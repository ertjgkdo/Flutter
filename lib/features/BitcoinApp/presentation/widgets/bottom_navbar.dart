import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  //int selectedItem = 0;

  final List<({IconData icon, String label})> items = const [
    (icon: Icons.home, label: "Home"),
    (icon: Icons.settings, label: "Settings"),
    (icon: Icons.person, label: "Profile")
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final selected = ref.watch(selectedProvider);
      return Container(
        color: Colors.transparent,
        // padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(37, 37, 38, 1)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: items
                .asMap()
                .entries
                .map((item) => bottomBarIcons(
                      icon: item.value.icon,
                      label: item.value.label,
                      isSelected: item.key == selected,
                      onPressed: () {
                        ref.read(selectedProvider.notifier).state = item.key;
                        // setState(() {
                        //   selectedItem = item.key;
                        // });
                      },
                    ))
                .toList(),
          ),
        ),
      );
    });
  }

  Widget bottomBarIcons(
      {required IconData icon,
      required String label,
      required bool isSelected,
      required Function() onPressed}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          margin: const EdgeInsets.only(right: 5),
          alignment: Alignment.center,
          decoration: isSelected
              ? const BoxDecoration(shape: BoxShape.circle, color: Colors.white)
              : null,
          child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: isSelected ? Colors.black : Colors.white,
              )),
        ),
        if (isSelected)
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
      ],
    );
  }
}
