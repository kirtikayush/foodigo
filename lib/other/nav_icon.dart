import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const NavIcon({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (index) {
      case 0:
        icon = CupertinoIcons.home;
        break;
      case 1:
        icon =
            selectedIndex == 1
                ? CupertinoIcons.person_solid
                : CupertinoIcons.person;
        break;
      case 2:
        icon =
            selectedIndex == 2
                ? CupertinoIcons.chat_bubble_fill
                : CupertinoIcons.chat_bubble;
        break;
      case 3:
        icon =
            selectedIndex == 3
                ? CupertinoIcons.heart_fill
                : CupertinoIcons.heart;
        break;
      default:
        icon = CupertinoIcons.circle;
    }

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 4),
          if (selectedIndex == index)
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
