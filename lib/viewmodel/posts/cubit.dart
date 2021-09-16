import 'package:facebook/viewmodel/data_sources/local_data.dart';
import 'package:facebook/viewmodel/posts/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsState(posts: [],stories: []));
  getPosts(){
    state.posts=posts;
  }
  getStories(){
    state.stories=stories;
  }

}
