import 'package:flutter/material.dart';

class Generators extends StatelessWidget {
  const Generators({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Active Generators",
          style: TextStyle(
            color: Color.fromRGBO(11, 87, 70, 1),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(53, 128, 129, 1),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: [
          Expanded(
            //outermost container
            child: Container(
              margin: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(110, 155, 156, 0.6),
                        spreadRadius: 8,
                        blurRadius: 15,
                        offset: Offset(0, 8))
                  ]),
              child: Column(
                children: [
                  //to evenly distribute the spaces
                  Expanded(
                    flex: 3,
                    //first container
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 133, 116, 0.9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      //Row inside the first container
                      child: Row(
                        children: [
                          //Two columns inside the row:
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                    child: Column(children: [
                                  Text(
                                    "ACTIVE",
                                    style: TextStyle(
                                      color: Color.fromRGBO(156, 212, 207, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "GENERATORS",
                                    style: TextStyle(
                                      color: Color.fromRGBO(156, 212, 207, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ])),
                                //The icon and number in row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: const Icon(
                                          Icons.whatshot,
                                          color:
                                              Color.fromRGBO(156, 212, 207, 1),
                                        )),
                                    const Text("3",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                218, 245, 239, 1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20))
                                  ],
                                )
                              ],
                            ),
                          ),
                          //Separator:
                          const VerticalDivider(
                            color: Color.fromRGBO(
                                156, 212, 207, 1), //color of divider
                            width: 15, //width space of divider
                            thickness: 1, //thickness of divier line
                            indent: 10, //Spacing at the top of divider.
                            endIndent: 10, //Spacing at the bottom of divider.
                          ),
                          //second column in the first row of the outermost container
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                    child: Column(children: [
                                  Text(
                                    "GENERATORS",
                                    style: TextStyle(
                                      color: Color.fromRGBO(156, 212, 207, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "POWER, FT3/SEC",
                                    style: TextStyle(
                                      color: Color.fromRGBO(156, 212, 207, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ])),
                                //row for icon and number
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        child: const Icon(
                                          Icons.bolt,
                                          color:
                                              Color.fromRGBO(156, 212, 207, 1),
                                        )),
                                    const Text("11,353",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                218, 245, 239, 1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //second row/container
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(8, 128, 116, 1),
                      ),
                      //row to keep two columns side by side
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //first column for texts only
                          const Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "RECEIVE NOTIFICATION WHEN",
                                  style: TextStyle(
                                    color: Color.fromRGBO(156, 212, 207, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Generators turns on",
                                  style: TextStyle(
                                      color: Color.fromRGBO(218, 245, 239, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          //second column for icons only
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: const Icon(
                                      Icons.notifications_on,
                                      color: Color.fromRGBO(156, 212, 207, 1),
                                      size: 20,
                                    )),
                                const Icon(
                                  Icons.toggle_on,
                                  size: 40,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //bottom row
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(9, 113, 102, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      //bottom row
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            flex: 7,
                            child: Text(
                              "Set up notifications for other lakes",
                              style: TextStyle(
                                color: Color.fromRGBO(156, 212, 207, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          //contianer for the icon on the right bottom row
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  Icons.chevron_right,
                                  color: Color.fromRGBO(218, 245, 239, 1),
                                  size: 28,
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 40, right: 30),
              child: const Text(
                "Generation schedule and subsequent water releases from dams are subject to change without notice",
                style: TextStyle(
                    color: Color.fromRGBO(78, 98, 99, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
