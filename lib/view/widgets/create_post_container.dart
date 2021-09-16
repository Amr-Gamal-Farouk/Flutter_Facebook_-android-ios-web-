import 'package:facebook/models/user_model.dart';
import 'package:facebook/view/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Card(
        margin: EdgeInsets.symmetric(
            horizontal: sizingInformation.isDesktop ? 5.0 : 0.0),
        elevation: sizingInformation.isDesktop ? 1.0 : 0.0,
        shape: sizingInformation.isDesktop
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
            : null,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: currentUser.imageUrl),
                  const SizedBox(width: 8.0),
                   Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                        filled: (sizingInformation.isDesktop)?true:false,
                        fillColor: const Color(0xfff0f2f5),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: (sizingInformation.isDesktop)?0:1,
                              color: (sizingInformation.isDesktop)?
                              Colors.white:
                              Colors.grey),
                        ),
                        hintText: ' What\'s on your mind?',
                      ),
                    ),
                  )
                ],
              ),
              const Divider(height: 10.0, thickness: 0.5),
              SizedBox(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () => print('Video Live'),
                      icon: const Icon(
                        Icons.video_call,
                        color:  Colors.red,
                      ),
                      label:  Text((sizingInformation.isDesktop)? 'Video Live':"Live",style: const TextStyle(
                        color: Colors.black54,fontWeight: FontWeight.bold
                      ),),
                    ),
                    const VerticalDivider(width: 8.0),
                    TextButton.icon(
                      onPressed: () => print('Photo/Video'),
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: const Text('Photo',style: TextStyle(
                          color: Colors.black54,fontWeight: FontWeight.bold
                      ),),
                    ),
                    const VerticalDivider(width: 8.0),
                    TextButton.icon(
                      onPressed: () => print('Feeling/Activity'),
                      icon:  Icon(
                        (sizingInformation.isDesktop)?Icons.tag_faces:Icons.video_call,
                        color: (sizingInformation.isDesktop)?const Color(0xfff7b928):Colors.deepPurple,
                      ),
                      label:  Text((sizingInformation.isDesktop)?'Feeling/Activity':"Room",style: const TextStyle(
                          color: Colors.black54,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
