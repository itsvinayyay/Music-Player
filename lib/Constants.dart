import 'package:flutter/material.dart';

const kcontainer = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFCE91FE),
      Color(0xFFB85FFF),
      Color(0xFFD6A3FF),
    ],
  ),
);

class fullcontainer extends StatelessWidget {
  fullcontainer({required this.imagename, required this.itsdecoration});

  final String imagename;
  final BoxDecoration itsdecoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: itsdecoration,
      width: 180,
      height: 80,
      child: Image.asset(imagename),
    );
  }
}
