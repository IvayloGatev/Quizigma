import 'package:flutter/material.dart';

// A widget, which displays a circlular button with an icon inside.
class RoundButton extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final IconData icon;

  RoundButton({this.onTap, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
