import 'package:get/get.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import '../../../core/values/sizes.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import '../../../widgets/buttons/primary_buttons.dart';

class NotifyView extends StatefulWidget {
  const NotifyView({Key? key}) : super(key: key);

  @override
  State<NotifyView> createState() => _NotifyViewState();
}

class _NotifyViewState extends State<NotifyView> {
  bool isDonotDisturbSelected = false;
  bool isCustomNotify = false;
  TextEditingController _customNotifyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(notifySection, style: AppTextStyles.header4),
        ),
        AppSpaces.verticalSpace10,
        notificationSection(),
        isDonotDisturbSelected == true ? notActivatedSection() : Container(),
        AppSpaces.verticalSpace10,
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(notifyAbout, style: AppTextStyles.header4),
        ),
        AppSpaces.verticalSpace10,
        notifyMyAboutSection(),
        AppSpaces.verticalSpace10,
      ],
    );
  }

  Widget notificationSection() {
    return RadioButtonGroup(
        labels: AppData.notificationSectionList,
        labelStyle: AppTextStyles.header6,
        activeColor: primaryColor,
        onSelected: (String selected) {
          if (selected != "Active") {
            setState(() {
              isDonotDisturbSelected = !isDonotDisturbSelected;
            });
          }
          if (selected == "Active") {
            setState(() {
              isDonotDisturbSelected = false;
            });
          }
        });
  }

  Widget notActivatedSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: RadioButtonGroup(
          labels: AppData.donotDisturbList,
          labelStyle: AppTextStyles.header6,
          activeColor: primaryColor,
          onSelected: (String selected) {
            if (selected == "Custom") {
              setState(() {
                isCustomNotify = true;
              });

              Future.delayed(Duration(milliseconds: 200), () async {
                customNotifyDialog(context);
              });
            }
          }),
    );
  }

  Widget notifyMyAboutSection() {
    return RadioButtonGroup(
        labels: AppData.notifyMyAbout,
        labelStyle: AppTextStyles.header6,
        activeColor: primaryColor,
        onSelected: (String selected) => print(selected));
  }

  // Show Dialog For Custom Notification
  Future customNotifyDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  customNotification,
                                  style: AppTextStyles.header,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  try {
                                    Get.back();
                                  } catch (exception) {
                                    print(exception);
                                  }
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Icon(
                                    Icons.close_sharp,
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppSpaces.verticalSpace10,
                          customNotifyTextField(),
                          AppSpaces.verticalSpace30,
                          createCustomNotifyButton(),
                          AppSpaces.verticalSpace10,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget customNotifyTextField() {
    return TextFormField(
      controller: _customNotifyController,
      keyboardType: TextInputType.none,
      autofocus: false,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black),
      onTap: () async {
        DateTime? datePicked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2025));
        if (datePicked != null) {
          _customNotifyController.text =
              "${datePicked.day}-${datePicked.month}-${datePicked.year}";
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 18,
        ),
        hintText: "Set Date / Time",
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            color: Colors.black.withOpacity(0.5)),
        suffixIcon: Icon(
          FontAwesomeIcons.calendar,
          size: 15.0,
          color: HexColor.fromHex("3C3E49"),
        ),
        filled: false,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
        ),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      ),
    );
  }

  Widget createCustomNotifyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: AppPrimaryButton(
          buttonHeight: 40,
          buttonWidth: sizeWidth * 0.7,
          buttonText: createNotify,
          callback: () => Get.back()),
    );
  }
}
