import 'package:flutter/material.dart';

class ColorDropDown extends StatefulWidget {
  final String label;
  final Function(Color) onChanged;
  final double height;
  final double width;

  ColorDropDown({
    Key? key,
    required this.onChanged,
    this.height = 25,
    this.width = 150,
    required this.label,
  }) : super(key: key);

  @override
  _ColorDropDownState createState() => _ColorDropDownState();
}

class _ColorDropDownState extends State<ColorDropDown> {
  Color? value;
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.8), width: 1)),
        child: Center(
          child: DropdownButton<Color>(
            value: value,
            underline: SizedBox(),
            iconEnabledColor: Colors.black.withOpacity(0.8),
            hint: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(5)),
            ),
            onChanged: (color) {
              setState(() => value = color!);
              widget.onChanged(color!);
            },
            items: colors
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      decoration: BoxDecoration(
                          color: e,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                )
                .toList(),
          ),
        ));
  }
}
