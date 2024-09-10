import 'package:flutter/material.dart';

class Creator {
  final String name;
  final String description;

  final int? followersNum;
  final List<Podcast> podcasts;
  final String coverPhoto;

  Creator({
    required this.name,
    required this.description,
    this.followersNum,
    this.podcasts = const [],
    required this.coverPhoto,
  });
  int get noOfPodcasts => podcasts.length;
}

class Podcast {
  final String title;
  final DateTime releaseDate;
  final Duration runtime;
  final String link;
  Podcast({
    required this.title,
    required this.releaseDate,
    required this.runtime,
    this.link = "",
  });
}
