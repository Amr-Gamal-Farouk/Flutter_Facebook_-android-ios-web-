import 'package:facebook/models/user_model.dart';

class Story {
   User user;
   String imageUrl;
   bool isViewed;
   Story({
    required this.user,
    required this.imageUrl,
    this.isViewed = false,
  });
}
