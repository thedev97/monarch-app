import 'package:flutter/material.dart';

class ListExpandSection extends StatefulWidget {
  final Widget child;
  final int? height;
  final bool expand;
  final bool isMember;

  const ListExpandSection(
      {Key? key, this.expand = false, required this.child, this.height, required this.isMember})
      : super(key: key);

  @override
  State<ListExpandSection> createState() => _ListExpandSectionState();
}

class _ListExpandSectionState extends State<ListExpandSection>
    with SingleTickerProviderStateMixin {
  AnimationController? expandController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController!.forward();
    } else {
      expandController!.reverse();
    }
  }

  @override
  void didUpdateWidget(ListExpandSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation!,
        child: Padding(
          padding: EdgeInsets.only(
              top: 5.0),
          child: Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color:Color(0xff838383),
                    width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            constraints: BoxConstraints(
              maxWidth: sizeWidth,
              maxHeight: 100),
            child: widget.child,
          ),
        ));
  }
}