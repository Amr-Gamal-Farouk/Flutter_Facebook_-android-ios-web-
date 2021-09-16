import 'package:facebook/models/post_model.dart';
import 'package:facebook/res/colors.dart';
import 'package:facebook/view/widgets/contacts_list.dart';
import 'package:facebook/view/widgets/create_post_container.dart';
import 'package:facebook/view/widgets/more_options_list.dart';
import 'package:facebook/view/widgets/post_container.dart';
import 'package:facebook/view/widgets/stories.dart';
import 'package:facebook/viewmodel/data_sources/local_data.dart';
import 'package:facebook/viewmodel/posts/cubit.dart';
import 'package:facebook/viewmodel/posts/state.dart';
import 'package:facebook/viewmodel/user/cubit.dart';
import 'package:facebook/viewmodel/user/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopBody extends StatefulWidget {
  final TrackingScrollController scrollController;
  const DesktopBody({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;
    var mHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Row(
      children: [
        (mWidth > 1100)
            ? Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: MoreOptionsList(currentUser: state.currentUser),
                  ),
                ),
              )
            : const SizedBox(),
        const Spacer(),
        SizedBox(
          width: 550.0,
          child: CustomScrollView(
            controller: widget.scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: BlocConsumer<PostsCubit, PostsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, pState) {
    return Stories(
                    currentUser: state.currentUser,
                    stories: pState.stories,
                  );
  },
),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: state.currentUser),
              ),

              SliverToBoxAdapter(
                  child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 12),
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                        child: TextButton.icon(
                          onPressed: () => print('Create Room'),
                          icon: const Icon(
                            Icons.video_call,
                            // color: Color(Color)
                          ),
                          label:  const Text( 'Create Room',style: TextStyle(color: MyColors.facebookBlue),),
                        ),
                    ),
                  ),),

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
        ),
        const Spacer(),
        (mWidth > 800)
            ? Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ContactsList(users: state.onlineUsers);
  },
),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  },
);
  }
}
