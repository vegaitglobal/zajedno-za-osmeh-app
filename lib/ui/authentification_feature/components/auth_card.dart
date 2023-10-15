import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {
  final List<Widget> children;
  const AuthCard({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 34),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
