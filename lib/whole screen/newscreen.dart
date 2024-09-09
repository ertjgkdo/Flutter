import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newproject/whole%20screen/podcast_model.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({
    super.key,
    required this.creator,
  });
  final Creator creator;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        color: const Color.fromRGBO(27, 27, 27, 1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //image container
              Container(
                width: 90,
                margin: const EdgeInsets.only(bottom: 5),
                child: Image.network(
                  creator.coverPhoto,
                  fit: BoxFit.cover,
                ),
              ),
              //headings
              Text(
                creator.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              // const Text(
              //   "Success",
              //   style: TextStyle(color: Colors.white, fontSize: 30),
              // ),
              //subtext
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "${creator.noOfPodcasts} podcasts • ${creator.followersNum ?? 0} followers",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              //description
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                  right: 12,
                ),
                child: Text(
                  creator.description,
                  style: const TextStyle(
                      color: Color.fromRGBO(129, 125, 125, 1), fontSize: 13),
                ),
              ),
              //row for the buttons?
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    //button on the left
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 80,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(179, 132, 129, 129),
                              Color.fromRGBO(78, 78, 78, 1),
                              Color.fromARGB(255, 49, 48, 48)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          color: Color.fromRGBO(78, 78, 78, 1),
                        ),
                        child: const Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    //group of buttons on the right
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: buildButtons(
                                  bgcolor: const Color.fromRGBO(78, 78, 78, 1),
                                  icon: Icons.share,
                                  iconColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildButtons(
                                  bgcolor: const Color.fromRGBO(78, 78, 78, 1),
                                  icon: Icons.shuffle,
                                  iconColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: buildButtons(
                                  bgcolor: Colors.white,
                                  icon: Icons.play_arrow,
                                  iconColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //Container for the first on the list
              if (creator.noOfPodcasts > 0)
                for (int i = 0; i < creator.noOfPodcasts; i++)
                  DetailItem(
                    podcast: creator.podcasts[i],
                  )
              else
                const Center(
                  child: Text(
                    "There are no podcasts.",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              //second item
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "BlockO",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "My Caziq",
          ),
        ],
      ),
    );
  }
}

Widget buildButtons(
    {required Color bgcolor,
    required IconData icon,
    required Color iconColor,
    Function? onTap}) {
  return GestureDetector(
    onTap: () {
      if (onTap != null) {
        onTap();
      }
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgcolor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 18,
      ),
    ),
  );
}

class DetailItem extends StatefulWidget {
  final Podcast podcast;
  const DetailItem({super.key, required this.podcast});

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        widget.podcast.title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        buildButtons(
                            bgcolor: isPlaying ? Colors.red : Colors.white,
                            icon: isPlaying ? Icons.pause : Icons.play_arrow,
                            iconColor: isPlaying ? Colors.white : Colors.black,
                            onTap: () {
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            }),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              "${DateFormat('MMM d, y').format(widget.podcast.releaseDate)} • ${widget.podcast.runtime} min",
                              style: const TextStyle(
                                  color: Color.fromRGBO(129, 125, 125, 1),
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Column(
                children: [
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
