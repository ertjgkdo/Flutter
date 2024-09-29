import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newproject/features/ProfileScreen/domain/users_model.dart';

class MyProfile extends StatelessWidget {
  final Person user;
  const MyProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(245, 247, 246, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(151, 254, 229, 1),
                          Colors.white,
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 35,
                        height: 50,
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              user.firstName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ]),
                        Row(children: [
                          Container(
                            width: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Text(
                              "Edit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu),
                          ),
                        ]),
                      ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(10),
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                  image: user.pfp != null
                                      ? DecorationImage(
                                          image: NetworkImage(
                                          user.pfp!,
                                        ))
                                      : null),
                              child: user.pfp == null
                                  ? const Icon(
                                      Icons.person_2_outlined,
                                      size: 70,
                                    )
                                  : null),
                          Text(
                            "${user.firstName} ${user.lastName}",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          Text(
                            user.username!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 135, 134, 134)),
                          ),
                        ]),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(221, 217, 217, 1),
                          offset: Offset(0, 1),
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(221, 217, 217, 1),
                          offset: Offset(0, -1),
                        )
                      ], color: Colors.white),
                      child: Wrap(
                        spacing: 53,
                        children: [
                          userProfileDetails(
                              value: user.noOfPosts, label: "Post"),
                          userProfileDetails(
                              value: user.noOfFollowers, label: "Follower"),
                          userProfileDetails(
                              value: user.noOfFollowing, label: "Following"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView(
                          padding: const EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Stack(children: [
                              Container(
                                width: 50,
                                margin: const EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.only(bottom: 5),
                                alignment: Alignment.bottomCenter,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromRGBO(247, 246, 244, 1),
                                ),
                                child: const Text(
                                  "Add Story",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 135, 134, 134),
                                      fontSize: 10),
                                ),
                              ),
                              Container(
                                  width: 40,
                                  margin: const EdgeInsets.only(
                                      left: 5, bottom: 14),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                      image: user.pfp != null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                user.pfp!,
                                              ),
                                              fit: BoxFit.cover)
                                          : null),
                                  child: user.pfp == null
                                      ? const Icon(
                                          Icons.person_2_outlined,
                                          size: 70,
                                        )
                                      : null),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 32, left: 17),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              )
                            ]),
                            for (int i = 0; i < user.friends.length; i++)
                              listOfStories(index: i),
                          ]),
                    ),
                  ],
                ),
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.square),
                                onPressed: () {},
                              ),
                              const Text(
                                "Posts",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ]),
                        const Divider(
                          color: Colors.black,
                          height: 3,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(children: [
                          IconButton(
                            icon: const Icon(Icons.atm),
                            onPressed: () {},
                          ),
                          const Text("Mentions")
                        ]),
                        const Divider(
                          color: Color.fromARGB(255, 197, 195, 195),
                          height: 3,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                )
              ]),
              for (int i = 0; i < user.posts.length; i++)
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Icon(Icons.person),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.posts[i].poster,
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '${user.posts[i].postTime}',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 135, 134, 134),
                                      fontSize: 13),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                        user.posts[i].postCaption,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          color: Colors.green,
                          child: Image(
                              image: NetworkImage(user.posts[i].postImage)))
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Container listOfStories({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 55,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey,
          image: user.friends[index].story != null
              ? DecorationImage(
                  image: NetworkImage(user.friends[index].story!),
                  fit: BoxFit.cover)
              : null),
    );
  }

  Column userProfileDetails({required int value, required String label}) {
    return Column(
      children: [
        Text(
          NumberFormat.compact().format(value).toString(),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(
              color: Color.fromARGB(255, 135, 134, 134), fontSize: 13),
        )
      ],
    );
  }
}
