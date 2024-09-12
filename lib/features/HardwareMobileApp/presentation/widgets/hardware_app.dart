import 'package:flutter/material.dart';
import 'package:newproject/features/HardwareMobileApp/domain/user_model.dart';

class HardwareApp extends StatelessWidget {
  final User user;
  const HardwareApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 44, 96, 1),
      // const Color.fromRGBO(55, 54, 114, 1),
      body: SingleChildScrollView(
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
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(75, 73, 136, 1)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            (Column(children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5, bottom: 32),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: user.profilePicture != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                  user.profilePicture!,
                                ))
                              : null),
                      child: user.profilePicture == null
                          ? const Icon(
                              Icons.person_2_outlined,
                              size: 70,
                            )
                          : null,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        user.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      user.deviceName,
                      style: const TextStyle(
                          color: Color.fromRGBO(162, 162, 189, 1),
                          fontSize: 14),
                    ),
                    Container(
                      width: 110,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(49, 131, 251, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          )),
                      child: Text(
                        user.jobTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    rowDetails(
                        label: "CUURENT PROJECTS",
                        value: user.noOfProjects ?? 0),
                    rowDetails(
                        label: "HOURS WORKED", value: user.hoursWorked ?? 0),
                    rowDetails(
                        label: "UPGRADES STAGE", value: user.upgradeStage ?? 0),
                    rowDetails(
                        label: "UPGRADES COST", value: user.upgradesCost ?? 0),
                  ],
                ),
              ),
            ])),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 32),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(74, 73, 120, 1),
                  Color.fromRGBO(55, 53, 128, 1)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < user.specs.length; i++)
                    specsList(
                        label: user.specs[i].label,
                        percentage: user.specs[i].percentage,
                        value: user.specs[i].value),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 5),
                            color: Color.fromRGBO(38, 37, 96, 1),
                          ),
                        ],
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(142, 68, 247, 1),
                          Color.fromRGBO(111, 30, 187, 1),
                          Color.fromRGBO(38, 109, 216, 1)
                        ])),
                    child: const Text(
                      "SHOW SPECS UPGRADE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container specsList({
    required String label,
    required String value,
    required int percentage,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:
                const EdgeInsets.only(right: 20, top: 10, bottom: 10, left: 10),
            child: CircularProgressIndicator(
              color: percentage < 50 ? Colors.green : Colors.red,
              value: percentage / 100,
              strokeWidth: 3,
              strokeAlign: 0.5,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$label :",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color.fromRGBO(162, 162, 189, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget rowDetails({required String label, required int value}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              label,
              style: const TextStyle(
                  color: Color.fromRGBO(162, 162, 189, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
          )
        ],
      ),
    );
  }
}
