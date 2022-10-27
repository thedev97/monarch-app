part of values;

class BoxDecorationStyles {
  static final BoxDecoration fadingGlory = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.tealAccent.withOpacity(0.5),
          Colors.lightGreenAccent.withOpacity(0.5),
          Colors.pinkAccent.withOpacity(0.5),
          Colors.purpleAccent.withOpacity(0.5)
        ]),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20), topRight: Radius.circular(20)),);

  static final BoxDecoration fadingInnerDecor = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)));
}
