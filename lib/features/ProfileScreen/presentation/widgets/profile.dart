import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Darlene"),
                      const Icon(Icons.arrow_drop_down),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Text("Edit"),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      height: 90,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        // image: user.profilePicture != null
                        //     ? DecorationImage(
                        //         image: NetworkImage(
                        //         user.profilePicture!,
                        //       ))
                        //     : null
                      ),
                      child: const Icon(
                        Icons.person_2_outlined,
                        size: 70,
                      )),
                  const Text("Darlene Beats"),
                  const Text("@dw_beats"),
                  Container(
                    child: const Row(
                      children: [
                        Column(
                          children: [Text("360"), Text("Post")],
                        ),
                        Column(
                          children: [Text("360"), Text("Post")],
                        ),
                        Column(
                          children: [Text("360"), Text("Post")],
                        )
                      ],
                    ),
                  ),
                  Row(children: [
                    Stack(children: [
                      Container(
                        width: 50,
                        height: 80,
                        color: Colors.amber,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Text("pfp"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(Icons.add),
                      )
                    ]),
                    Container(
                      width: 50,
                      height: 80,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey),
                    )
                  ]),
                ],
              ),
            ),
            Row(children: [
              Container(
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.square),
                    onPressed: () {},
                  ),
                  Text("Posts")
                ]),
              ),
              Container(
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.atm),
                    onPressed: () {},
                  ),
                  Text("Mentions")
                ]),
              )
            ]),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      Column(
                        children: [
                          Text("Nilesh"),
                          Text("Posted in u8s - 1h ago")
                        ],
                      )
                    ],
                  ),
                  Text(
                      "Discover adventure in patagonia's peaks or serenity provence's @hamlets - arrival"),
                  Container(
                    height: 100,
                    color: Colors.green,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
