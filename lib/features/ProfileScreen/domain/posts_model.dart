import 'package:newproject/features/ProfileScreen/domain/users_model.dart';

class Post {
  final String poster;
  final String postTime;
  final String postCaption;
  final String postImage;
  Post({
    required this.poster,
    required this.postTime,
    required this.postCaption,
    required this.postImage,
  });
}
