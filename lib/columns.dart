import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Columns extends StatelessWidget {
  const Columns({super.key});
  Widget buildTiles({
    required String title,
    required String subtitle,
    required IconData icon,
    required int number,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, right: 15),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 253, 219, 230),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            child: Icon(icon),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    number.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          buildTiles(
              title: 'Title1',
              subtitle: 'Subtitle1',
              icon: Icons.access_alarm,
              number: 2),
          buildTiles(
              title:
                  'Title2asdfsdfjksjfksfjlsdfskjfsklfjslkfjsklfjskljfkfsdfkjsl',
              subtitle:
                  'Subtitle2,sdjfksjdfksjdfklsjfskjfskdfjskdfjskfskfjskfdfjskdfjskl',
              icon: Icons.ac_unit,
              number: 32)
        ],
      ),
    );
  }
}
