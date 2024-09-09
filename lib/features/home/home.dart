import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(-10, 10),
                ),
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(10, -150),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(colors: [
                Colors.red,
                Colors.orange,
              ]),
            ),
            child: const Text(
              "Challenge",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(255, 182, 119, 1)),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: 100,
              constraints: const BoxConstraints(minWidth: 280, maxWidth: 310),
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(73, 173, 251, 1),
                borderRadius: BorderRadius.all(Radius.circular(60)),
              ),
              child: Container(
                constraints: const BoxConstraints(minWidth: 200, maxWidth: 250),
                height: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      topLeft: Radius.circular(60)),
                  color: Color.fromRGBO(147, 204, 247, 1),
                ),
                child: const Text(
                  "Challenge",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              )),
          Container(
            height: 150,
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 154, 0, 1),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Text(
                "H",
                style: TextStyle(
                  fontSize: 100,
                  color: Color.fromRGBO(255, 154, 0, 1),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.amber,
        height: 55,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
