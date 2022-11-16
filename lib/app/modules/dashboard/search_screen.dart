import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../../widgets/buttons/primary_tab_buttons.dart';
import '../../widgets/forms/search_box_form.dart';
import '../../widgets/search/task_card.dart';
import '../../widgets/shapes/app_settings_icon.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController _searchController = new TextEditingController();
  ValueNotifier<int> _settingsButtonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppSpaces.verticalSpace10,
            Text("Search", style: AppTextStyles.header2),
            AppSpaces.verticalSpace30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: SearchBoxInput(
                        placeholder: 'Search Project',
                        controller: _searchController),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      height: 60,
                      child: Text("Cancel",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.lato(
                              color: HexColor.fromHex("616575"),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    )),
              ],
            ),
            AppSpaces.verticalSpace10,
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //tab indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PrimaryTabButton(
                      buttonText: "Task",
                      itemIndex: 0,
                      notifier: _settingsButtonTrigger),
                  PrimaryTabButton(
                      buttonText: "Mention",
                      itemIndex: 1,
                      notifier: _settingsButtonTrigger),
                  PrimaryTabButton(
                      buttonText: "Files",
                      itemIndex: 2,
                      notifier: _settingsButtonTrigger)
                ],
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: AppSettingsIcon(
                      // callback: ((),{_showDashboardSettings(context);}),
                      ))
            ]),
            AppSpaces.verticalSpace20,
            Expanded(
              child: ListView(children: [
                SearchTaskCard(
                    activated: false,
                    header: "HOBNOB - MOBILE APP",
                    subHeader: "Ui Design",
                    date: "Nov 16"),
                SearchTaskCard(
                    activated: true,
                    header: "BG WORK",
                    subHeader: "Implement the api",
                    date: "Nov 2"),
                SearchTaskCard(
                    activated: false,
                    header: "GITHUB LEARNING (INTERNAL)",
                    subHeader: "Learn the Git",
                    date: "Nov 5"),
              ]),
            )
          ]),
        ));
  }
}
