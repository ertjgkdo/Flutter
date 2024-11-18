import 'package:newproject/features/ProfileScreen/domain/posts_model.dart';

import 'posts_model.dart';

class Person {
  final String firstName;
  final String? lastName;
  final String? username;
  final int noOfPosts;
  final int noOfFollowers;
  final int noOfFollowing;
  final String? story;
  final String? pfp;
  final List<Post> posts;
  final List<Person> friends;
  Person({
    required this.firstName,
    this.lastName,
    this.username,
    required this.noOfPosts,
    required this.noOfFollowers,
    required this.noOfFollowing,
    this.story,
    this.pfp,
    required this.posts,
    required this.friends,
  });
}
