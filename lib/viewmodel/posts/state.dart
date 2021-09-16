import 'package:facebook/models/post_model.dart';
import 'package:facebook/models/story_model.dart';

class PostsState {
  List<Post> posts;
  List<Story> stories;
  PostsState({required this.posts,required this.stories});
}
