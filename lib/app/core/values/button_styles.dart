part of values;

class ButtonStyles {
  static final ButtonStyle primaryDecoration = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          HexColor.fromHex("#3c4c7c")),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                  color: HexColor.fromHex("#3c4c7c")))));

  static final ButtonStyle blueRounded = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                  color: HexColor.fromHex("#3c4c7c")))),
    backgroundColor:
    MaterialStateProperty.all(Colors.transparent),
  );

  static final ButtonStyle imageRounded = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(HexColor.fromHex("181A1F")),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: HexColor.fromHex("666A7A"), width: 1))));
}

class ButtonStyleOne {
  static final ButtonStyle blueRounded = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(HexColor.fromHex("#FF968E")),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: HexColor.fromHex("#FF968E")))));
}
