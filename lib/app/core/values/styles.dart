part of values;

class AppTextStyles {
  static final TextStyle bottomLinkTextStyle = GoogleFonts.lato(
      color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600);

  static final TextStyle flyInTextStyle = GoogleFonts.lato(
      color: Color.fromRGBO(154, 116, 84, 0.5),
      fontSize: 100,
      fontWeight: FontWeight.w300);

  static final TextStyle headerTextStyle = GoogleFonts.lato(
      color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600);

  static final TextStyle brandTextStyle =
      GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.bold);

  static final TextStyle header2 = GoogleFonts.lato(
      fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black, shadows: [
    Shadow(
        color: Colors.black,
        offset: Offset(0.0, 1.0),
        blurRadius: 1.0),
  ],);
}
