import 'package:flutter/material.dart';

class TaskContainerImage extends StatelessWidget {
  final String imageUrl;
  final Color backgroundColor;

  const TaskContainerImage(
      {Key? key, required this.backgroundColor, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Image.asset(imageUrl, height: 30, width: 30,);
  }
}
