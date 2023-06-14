part of values;

class Utils {
  static final double screenWidth = Get.width;
  static final double screenHeight = Get.width;
}

class SineCurve extends Curve {
  final double count;

  SineCurve({this.count = 3});

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}

Widget buildStackedImages(
    {TextDirection direction = TextDirection.ltr, bool? addMore}) {
  final double size = 50;
  final double xShift = 20;

  DottedBorder iconContainer = DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.grey,
      strokeWidth: 2,
      dashPattern: [
        5,
        5,
      ],
      child: Center(
        child: GestureDetector(
          onTap: () => Get.to(SetAssigneesScreen()),
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.primaryAccentColor, shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              )),
        ),
      ));

  final items = List.generate(
      4,
      (index) => ProfileDummyImg(
          color: AppData.groupBackgroundColors[index],
          dummyType: ProfileDummyTypeImg.Image,
          image: AppData.profileImages[index],
          scale: 1.0));

  return StackedWidgets(
    direction: direction,
    items: [...items, (addMore != null) ? iconContainer : iconContainer],
    size: size,
    xShift: xShift,
  );
}
