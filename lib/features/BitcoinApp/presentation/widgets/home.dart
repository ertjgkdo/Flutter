import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(11, 11, 11, 1),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 270,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(27, 37, 122, 1),
                              Color.fromRGBO(38, 57, 194, 1),
                              Color.fromRGBO(74, 92, 217, 1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
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
                              const Text(
                                "Hello, Kathryn",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Row(children: [
                                topRightIcons(icon: Icons.square_outlined),
                                topRightIcons(
                                    icon: Icons.notifications_none_outlined)
                              ]),
                            ],
                          ),
                        ),
                        const Text(
                          "Your balance • USD",
                          style: TextStyle(
                              color: Color.fromRGBO(176, 180, 227, 1),
                              fontSize: 15),
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                              top: 5,
                              bottom: 20,
                            ),
                            child: const Text(
                              "\$9,283.12",
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            )),
                        Row(
                          children: [
                            Expanded(
                                child: actionButtons(
                                    icon: Icons.arrow_forward,
                                    label: "Send",
                                    color: const Color.fromRGBO(
                                        255, 251, 156, 1))),
                            Expanded(
                                child: actionButtons(
                                    icon: Icons.arrow_back,
                                    label: "Receive",
                                    color: const Color.fromRGBO(
                                        255, 251, 156, 1))),
                            Expanded(
                                child: actionButtons(
                              icon: Icons.add,
                              label: "Add Funds",
                              color: Colors.white,
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      // margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: const Text(
                            "Recents",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SingleChildScrollView(
                          padding: EdgeInsets.only(left: 15),
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ],
                              ),
                              recentsList(),
                              recentsList(),
                              recentsList(),
                              recentsList(),
                              recentsList(),
                              recentsList(),
                              recentsList(),
                            ],
                          ),
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
                  transactionsList(),
                  transactionsList(),
                  transactionsList()
                ],
              ),
              Positioned(
                bottom: 25,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.amber,
                    type: BottomNavigationBarType.shifting,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.school), label: "Files"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "Profile")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   type: BottomNavigationBarType.shifting,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.black,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: "Files"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      //   ],
      // ),
    );
  }

  Container transactionsList() {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                        child: const Text("Bitcoin",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13)),
                      ),
                      const Text("BTC",
                          style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Text("\$23,746.15",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13)),
                      ),
                      const Text("+1.98%",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Column recentsList() {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
        const Text(
          "User 1",
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }

  Column actionButtons(
      {required IconData icon, required String label, required Color color}) {
    return Column(
      children: [
        Container(
          width: 105,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: IconButton(
            icon: Icon(icon),
            onPressed: () {},
          ),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ))
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
