import 'package:flutter/material.dart';
import '../../core/values/values.dart';

class DashboardAddButton extends StatelessWidget {
  final VoidCallback? iconTapped;
  const DashboardAddButton({
    Key? key,
    this.iconTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: iconTapped,
      child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: AppColors.primaryAccentColor, borderRadius: BorderRadius.circular(10.0)),
          child: Icon(Icons.add, color: Colors.white)),
    );
  }
}
