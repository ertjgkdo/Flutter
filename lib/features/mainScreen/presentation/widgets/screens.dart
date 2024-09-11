import 'package:flutter/material.dart';
import 'package:newproject/features/HardwareMobileApp/domain/specs_model.dart';
import 'package:newproject/features/HardwareMobileApp/domain/user_model.dart';
import 'package:newproject/features/HardwareMobileApp/presentation/widgets/hardware_app.dart';
import 'package:newproject/features/rowColumns/presentation/widgets/columns.dart';
import 'package:newproject/features/ChallengeBox/presentation/widgets/challengebox.dart';
import 'package:newproject/features/ChallengeBox/presentation/widgets/task.dart';
import 'package:newproject/features/podcastScreen/presentation/widgets/podcastPage.dart';
import 'package:newproject/features/podcastScreen/domain/podcast_model.dart';
import 'package:newproject/features/generatorScreen/presentation/widget/generators.dart';

class Screens extends StatelessWidget {
  const Screens({super.key});

  //title subtitile icon, number, widget
  Widget buildItem(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required int number,
      required Widget widget}) {
    return ListTile(
        title: Text(
          title,
        ),
        subtitle: Text(subtitle),
        leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.amber),
            child: Icon(icon)),
        trailing: Text(number.toString()),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildItem(context,
                title: "Containers First task",
                subtitle: "Challenge boxes",
                icon: Icons.add_box,
                number: 3,
                widget: ChallengeBox()),
            buildItem(context,
                title: "Containers second task",
                subtitle: "alignment container, shadows",
                icon: Icons.add_box,
                number: 3,
                widget: NewTask()),
            buildItem(context,
                title: "Columns first task",
                subtitle: "List tile like structure with rows and columns",
                icon: Icons.add_box,
                number: 3,
                widget: Columns()),
            buildItem(context,
                title: "Columns second task",
                subtitle: "Active generators, container",
                icon: Icons.add_box,
                number: 3,
                widget: Generators()),
            buildItem(context,
                title: "Full screen task",
                subtitle: "Podcast layout",
                icon: Icons.add_box,
                number: 3,
                widget: NewScreen(
                  creator: Creator(
                      name: "Sam  ",
                      coverPhoto:
                          "https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w",
                      description:
                          "Lorem ipsum odor amet, consectetuer adipiscing elit. Molestie justo primis magnis mus congue elementum euismod magnis. Condimentum nisi nisl nostra dignissim efficitur quis.",
                      podcasts: [
                        Podcast(
                          title:
                              "Using for loops fsdfjk sjdfksdfjksfjkdfjksdfjksdfjdkjfsljl",
                          releaseDate: DateTime.now(),
                          runtime: Duration(minutes: 30),
                          link: "google.com",
                        ),
                        Podcast(
                          title:
                              "Using for loops fsdfjk sjdfksdfjksfjkdfjksdfjksdfjdkjfsljl",
                          releaseDate: DateTime.now(),
                          runtime: Duration(minutes: 30),
                          link: "google.com",
                        )
                      ]),
                )),
            buildItem(context,
                title: "Full screen second task",
                subtitle: "Hardware mobile application design",
                icon: Icons.add_box,
                number: 3,
                widget: HardwareApp(
                  user: User(
                    name: "Nancy Tolbert",
                    deviceName: "Macbook Pro 2014",
                    jobTitle: "UI/UX Designer",
                    hoursWorked: 80,
                    noOfProjects: 4,
                    upgradeStage: 1,
                    upgradesCost: 923,
                    specs: [
                      Specs(
                          label: "CPU",
                          value: "2.5 GHz Intel Core i7",
                          percentage: 72),
                      Specs(
                          label: "RAM",
                          percentage: 32,
                          value: "16 GB 1600Mhz DDR3"),
                      Specs(
                          label: "Graphics",
                          percentage: 93,
                          value: "NVIDIA GeForce GT 750M 2 GB"),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
