import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/post_model.dart';
import 'package:facebook/res/colors.dart';
import 'package:facebook/view/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Card(
        margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: sizingInformation.isDesktop ? 5.0 : 0.0,
        ),
        elevation: sizingInformation.isDesktop ? 1.0 : 0.0,
        shape: sizingInformation.isDesktop
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PostHeader(post: post),
                    const SizedBox(height: 4.0),
                    Text(post.caption),
                    post.imageListUrl.isNotEmpty
                        ? const SizedBox.shrink()
                        : const SizedBox(height: 6.0),
                  ],
                ),
              ),
              post.imageListUrl.isNotEmpty
                  ? ImagesView(post: post,isDisktop: sizingInformation.isDesktop,)
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: PostStats(post: post),
              ),
            ],
          ),
        ),
      );
  }
    );
  }
}

class ImagesView extends StatelessWidget{
    Post post;
    bool isDisktop;


   ImagesView({Key? key,required this.post,required this.isDisktop}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(post.imageListUrl.length==1){

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CachedNetworkImage(imageUrl: post.imageListUrl[0]),
      );

    }else if(post.imageListUrl.length==2){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: isDisktop? 550:MediaQuery.of(context).size.width-18,
          child: Row(
            children: [
              Expanded(child: CachedNetworkImage(imageUrl: post.imageListUrl[0])),
              const Divider(color: Colors.white,indent: 1,),
              Expanded(child: CachedNetworkImage(imageUrl: post.imageListUrl[1])),
            ],
          ),
        ),
      );

    }
    else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: isDisktop? 550:MediaQuery.of(context).size.width,
          height: 400,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(imageUrl: post.imageListUrl[0],fit: BoxFit.cover,) ,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(1),
                  itemCount: (post.imageListUrl.length>5)?4:post.imageListUrl.length-1,
                  itemBuilder: (context, index) {
                    if(post.imageListUrl.length>5&&index==3){
                      return Stack(
                        children: [
                          SizedBox(
                              width: double.infinity ,
                              height: (post.imageListUrl.length<5)?400/(post.imageListUrl.length-1):100,
                    child: CachedNetworkImage(imageUrl: post.imageListUrl[index+1],fit: BoxFit.fill,)),
                          Container(
                            width: double.infinity ,
                              height: (post.imageListUrl.length<5)?400/(post.imageListUrl.length-1):100,
                              color: Colors.black26,
                          child: Center(child: Text("+ ${post.imageListUrl.length-5}",
                            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),)
                        ],
                      );
                    }
                    return SizedBox(
                      height: (post.imageListUrl.length<5)?400/(post.imageListUrl.length-1):100,
                        child: CachedNetworkImage(imageUrl: post.imageListUrl[index+1],fit: BoxFit.fill,));

                },) ,
              ),
            ],
          ),

        ),
      );

    }
  }

}


class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: MyColors.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            PostButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey[600],
                size: 18.0,
              ),
              label: 'Like',
              onTap: () => print('Like'),
            ),
            PostButton(
              icon: Icon(
                Icons.messenger_outline,
                color: Colors.grey[600],
                size: 18.0,
              ),
              label: 'Comment',
              onTap: () => print('Comment'),
            ),
            PostButton(
              icon: Icon(
                Icons.share,
                color: Colors.grey[600],
                size: 18.0,
              ),
              label: 'Share',
              onTap: () => print('Share'),
            )
          ],
        ),
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final  onTap;

  const PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 1.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

