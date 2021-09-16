import 'package:facebook/models/user_model.dart';

class Post {
   User user;
   String caption;
   String timeAgo;
   List<String> imageListUrl ;
   int likes;
   int comments;
   int shares;

   Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageListUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
