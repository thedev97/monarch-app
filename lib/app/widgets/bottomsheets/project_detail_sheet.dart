import 'package:flutter/material.dart';
import 'bottom_sheet_holder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../onboarding/labelled_option.dart';

class ProjectDetailBottomSheet extends StatelessWidget {
  const ProjectDetailBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpaces.verticalSpace10,
        BottomSheetHolder(),
        AppSpaces.verticalSpace10,
        ListTile(
          title: Text("PROJECT SETTINGS", style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
        ),
        Expanded(
          child: ListView(
            children: [
              LabelledOption(label: 'Share Project', icon: Icons.share),
              LabelledOption(label: 'Mark all completed', icon: Icons.check_circle),
              LabelledOption(label: 'Copy', icon: Icons.copy, link: "https://hobnob.bimagarage.com/"),
              LabelledOption(label: 'Duplicate Project', icon: Icons.fiber_smart_record),
              /*LabelledOption(
                label: 'Set Color',
                icon: Icons.color_lens,
                boxColor: "FFDE72",
              ),*/
              LabelledOption(label: 'Archive Project', icon: Icons.archive),
              LabelledOption(label: 'Delete Project', icon: FeatherIcons.trash2),
            ],
          ),
        ),
      ],
    );
  }
}
