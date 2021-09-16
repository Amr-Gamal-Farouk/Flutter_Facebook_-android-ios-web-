import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/story_model.dart';
import 'package:facebook/models/user_model.dart';
import 'package:facebook/res/colors.dart';
import 'package:facebook/view/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Container(
            height: 200.0,
            color: sizingInformation.isDesktop ? Colors.transparent
                : Colors.white,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 8.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 1 + stories.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ResponsiveBuilder(
                        builder: (context, sizingInformation) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(12.0),
                                 topLeft: Radius.circular(12.0)),
                                child: CachedNetworkImage(
                                  imageUrl:  currentUser.imageUrl ,
                                  height: 135,
                                  width: 110.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: 110.0,
                                decoration: BoxDecoration(
                                  gradient: MyColors.storyGradient,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow:  const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 4.0,
                                    ),
                                  ]
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                child: Container(
                                  width: 110,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0),
                                        bottomRight:  Radius.circular(12.0)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                       'Add to Story' ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 30.0,
                                  left: 35.0,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: MyColors.facebookBlue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(Icons.add),
                                        iconSize: 20.0,
                                        color: Colors.white ,
                                        onPressed: () => print('Add to Story'),
                                      ),
                                    ),
                                  )
                              ),

                            ],
                          );
                        }),
                  );
                }
                final Story story = stories[index - 1];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _StoryCard(story: story, currentUser: currentUser,),
                );
              },
            ),
          );
        }
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard({
    Key? key,
    this.isAddStory = false,
    required this.currentUser,
    required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
              height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110.0,
            decoration: BoxDecoration(
              gradient: MyColors.storyGradient,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0,
                      ),
                    ]
            ),
          ),
          Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      iconSize: 30.0,
                      color: MyColors.facebookBlue,
                      onPressed: () => print('Add to Story'),
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,
                    hasBorder: !story.isViewed,
                  ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(
              isAddStory ? 'Add to Story' : story.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
  });
  }
}
