import 'package:facebook/models/user_model.dart';
import 'package:facebook/res/colors.dart';
import 'package:facebook/view/widgets/user_card.dart';
import 'package:flutter/material.dart';


class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    // [Icons.shield, Colors.deepPurple, 'COVID-19 Info Center'],
    [Icons.people_alt_outlined, Colors.cyan, 'Friends'],
    [Icons.group, MyColors.facebookBlue, 'Group'],
    [Icons.storefront, MyColors.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, MyColors.facebookBlue, 'Watch'],
    [Icons.remember_me_outlined, MyColors.facebookBlue, 'Memories'],
  ];

  final User currentUser;

  const MoreOptionsList({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(
              icon: option[0],
              color: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({
    Key ?key,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 25.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
