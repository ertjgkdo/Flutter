import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        // drawer: Drawer(
        //   child: ListView(
        //     children: const <Widget>[],
        //   ),
        // ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: const Alignment(30, 30),
            height: 150,
            width: 150,
            margin: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 241, 99, 203),
                Colors.pink,
                Colors.orange
              ]),
            ),
            child: Container(
              height: 149,
              width: 149,
              // transform: Matrix4.translation(math.Vector3(30, 30, 0)),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Color.fromRGBO(241, 99, 203, 1),
                      Color.fromRGBO(141, 104, 255, 1),
                      Color.fromRGBO(107, 185, 249, 1)
                    ]),
              ),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white, // Light shadow for top-left
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(
                        230, 158, 158, 158), // Dark shadow for bottom-right
                    offset: Offset(3, 5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]),
            child: Container(
              alignment: Alignment.center,
              height: 70,
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  gradient: RadialGradient(
                      colors: [
                        Colors.white70,
                        Colors.white70,
                        Colors.white,
                      ],
                      center: Alignment(0, 0.05),
                      stops: [0.6, 0.9, 1]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, // Light shadow for top-left
                      offset: Offset(-5, -5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(
                          255, 184, 183, 183), // Dark shadow for bottom-right
                      offset: Offset(5, 5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]),
              child: const Text(
                "1",
                style: TextStyle(
                  color: Color.fromRGBO(251, 142, 8, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]));
  }
}
