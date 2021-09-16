import 'package:facebook/models/post_model.dart';
import 'package:facebook/view/widgets/post_container.dart';
import 'package:facebook/view/widgets/stories.dart';
import 'package:facebook/viewmodel/data_sources/local_data.dart';
import 'package:facebook/viewmodel/posts/cubit.dart';
import 'package:facebook/viewmodel/posts/state.dart';
import 'package:facebook/viewmodel/user/cubit.dart';
import 'package:facebook/viewmodel/user/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_post_container.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  _MobileBodyState createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;
    var mHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, uState) {
    return SizedBox(
          width: 550.0,
          child: CustomScrollView(
            shrinkWrap: true ,
            physics: const ScrollPhysics(),
            // controller: widget.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: uState.currentUser),
              ),
              BlocConsumer<PostsCubit, PostsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: uState.currentUser,
                    stories: state.stories,
                  ),
                ),
              );
  },
),
              BlocConsumer<PostsCubit, PostsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final Post post = state.posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: state.posts.length,
                ),
              );
  },
),
            ],
          ),
        );
  },
);
  }
}
