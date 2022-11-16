import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';

class InactiveProjectSelectableContainer extends StatelessWidget {
  final String header;
  final ValueNotifier<bool> notifier;
  const InactiveProjectSelectableContainer({
    Key? key,
    required this.header,
    required this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.value = !notifier.value;
      },
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
            width: double.infinity,
            height: 70,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryBackgroundColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ...progressCardGradient,
                ],
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 2)),
                    ),
                    AppSpaces.horizontalSpace20,
                    Text(header,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 16,
                          color: Colors.grey, shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(0.0, 0.2),
                              blurRadius: 0.2),
                        ],)),
                  ]),
                  SizedBox()
                ])),
        secondaryActions: <Widget>[
          IconSlideAction(
            //caption: 'More',
            color: HexColor.fromHex("B1FEE2"),
            icon: Icons.share,
            // onTap: () => _showSnackBar('More'),
          ),
          IconSlideAction(
            //caption: 'Delete',
            iconWidget: Icon(Icons.delete, size: 35),
            color: HexColor.fromHex("F5A3FF"),
            // onTap: () => _showSnackBar('Delete'),
          ),
        ],
      ),
    );
  }
}
