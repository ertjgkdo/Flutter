import 'package:flutter/material.dart';
import 'package:newproject/features/BitcoinApp/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newproject/features/BitcoinApp/presentation/state/state.dart';
import 'package:newproject/features/BitcoinApp/presentation/widgets/bottom_navbar.dart';
import 'package:newproject/features/BitcoinApp/presentation/widgets/list.dart';
import 'package:newproject/features/mainScreen/presentation/widgets/screens.dart';

class MyHome extends ConsumerWidget {
  final Profile user;
  const MyHome({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(selectedProvider);
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(11, 11, 11, 1),
        child: Stack(
          children: [
            IndexedStack(
              index: currentPage,
              children: [
                home(),
                const ListTracker(),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
            const Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: BottomBar(),
            )
          ],
        ),
      ),
    );
  }

  Column home() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: 270,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(27, 37, 122, 1),
                Color.fromRGBO(38, 57, 194, 1),
                Color.fromRGBO(74, 92, 217, 1),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello, ${user.name}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(children: [
                      topRightIcons(icon: Icons.square_outlined),
                      topRightIcons(icon: Icons.notifications_none_outlined)
                    ]),
                  ],
                ),
              ),
              const Text(
                "Your balance • USD",
                style: TextStyle(
                    color: Color.fromRGBO(176, 180, 227, 1), fontSize: 15),
              ),
              Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 20,
                  ),
                  child: Text(
                    "\$ ${user.balance}",
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  )),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: actionButtons(
                            icon: Icons.arrow_forward,
                            label: "Send",
                            rotationAngle: 320,
                            color: const Color.fromRGBO(255, 251, 156, 1))),
                    Expanded(
                        child: actionButtons(
                            icon: Icons.arrow_back,
                            label: "Receive",
                            rotationAngle: 320,
                            color: const Color.fromRGBO(255, 251, 156, 1))),
                    Expanded(
                        child: actionButtons(
                      rotationAngle: 0,
                      icon: Icons.add,
                      label: "Add Funds",
                      color: Colors.white,
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            // margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              "Recents",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView(
                padding: const EdgeInsets.only(left: 15),
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                          ),
                          const Text(
                            "Search",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                      if (user.noOfTransaction > 0)
                        for (int i = 0; i < user.noOfTransaction; i++)
                          recentsList(index: i)
                      else
                        const Center(
                          child: Text(
                            "No recent contacts.",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                ]),
          )
        ])),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Assets",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text("See all",
                  style: TextStyle(color: Colors.white, fontSize: 15))
            ],
          ),
        ),
        if (user.noOfTransaction > 0)
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < user.noOfTransaction; i++)
                  transactionsList(index: i)
              ],
            ),
          )
        else
          const Center(
            child: Text(
              "There are no transactions.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
      ],
    );
  }

  Container transactionsList({required int index}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Icon(Icons.abc),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(user.transactions[index].assetName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13)),
                      ),
                      Text(user.transactions[index].abreviations,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                            "\$ ${user.transactions[index].amount.toString()}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13)),
                      ),
                      transactionPercentage(
                          percentage: user.transactions[index].percentage),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget transactionPercentage({required double percentage}) {
    bool isPositive = percentage > 0;
    return Text(
        isPositive
            ? "+${percentage.toString()} %"
            : " ${percentage.toString()} %",
        style: TextStyle(
            color: isPositive ? Colors.green : Colors.red, fontSize: 12));
  }

  Column recentsList({required int index}) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: user.transactions[index].contact.profilePicture != null
                  ? DecorationImage(
                      image: NetworkImage(
                      user.transactions[index].contact.profilePicture!,
                    ))
                  : null),
        ),
        Text(
          user.transactions[index].contact.name,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }

  Column actionButtons(
      {required IconData icon,
      required String label,
      required Color color,
      required double rotationAngle}) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: 105,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: IconButton(
              icon: Transform.rotate(
                child: Icon(icon),
                angle: rotationAngle,
              ),
              onPressed: () {},
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              )),
        )
      ],
    );
  }

  Container topRightIcons({required IconData icon}) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: const Color.fromARGB(255, 179, 173, 173),
              strokeAlign: 0.5),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ));
  }
}
