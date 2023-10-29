import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.onPress,
    required this.icon,
    required this.text,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  });

  final void Function() onPress;
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                Icon(
                  icon,
                  color: iconColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
