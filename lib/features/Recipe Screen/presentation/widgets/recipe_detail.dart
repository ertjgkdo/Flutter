import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  height: 350,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://i.pinimg.com/236x/f3/85/d7/f385d78eba93e8b768bcc04bf96fe5a5.jpg"))),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      padding: const EdgeInsets.only(left: 8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 59, 66, 83)),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 300, left: 15, right: 15),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          color: Color.fromARGB(255, 130, 127, 127),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      const Text(
                        "Greek salad",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const Text(
                        "6 ingredients",
                        style: TextStyle(
                            color: Color.fromARGB(202, 104, 102, 102)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            recipeSpecs(
                                icon: Icons.timer, specification: "30 min"),
                            recipeSpecs(
                                specification: "234 Kall",
                                icon: Icons.local_fire_department_outlined),
                            recipeSpecs(
                                specification: "3 servings", icon: Icons.adjust)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: const Text(
                "Ingredients",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://i.pinimg.com/236x/f3/85/d7/f385d78eba93e8b768bcc04bf96fe5a5.jpg"),
                                    fit: BoxFit.cover)),
                            margin: const EdgeInsets.only(right: 15, bottom: 5),
                            height: 70,
                            width: 70,
                          ),
                          const Text(
                            "Tomato",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "1 items",
                            style: TextStyle(
                                color: Color.fromARGB(202, 104, 102, 102)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: 70,
                            child: const Image(
                                image: NetworkImage(
                                    "https://i.pinimg.com/236x/f3/85/d7/f385d78eba93e8b768bcc04bf96fe5a5.jpg")),
                          ),
                          const Text("Tomato"),
                          const Text("1 items")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: const Text(
                "Cooking instruction",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(255, 246, 234, 1)),
              padding: EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Step 1")],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget recipeSpecs({required String specification, required IconData icon}) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Icon(
                  icon,
                  color: Color.fromRGBO(250, 169, 47, 1),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                specification,
                style: TextStyle(color: Color.fromARGB(202, 104, 102, 102)),
              ),
            )
          ])),
    );
  }
}
