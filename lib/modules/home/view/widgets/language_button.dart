


import 'package:flutter/material.dart';
import 'package:get/get.dart';

IconButton buildChangeLanguageButton(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.language),
    onPressed: () {
      // Show language selection dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("SelectLanguage".tr),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  changeLanguage(Locale('en', 'US'));
                  Navigator.pop(context);
                },
                child: Text("English".tr),
              ),
              SimpleDialogOption(
                onPressed: () {
                  changeLanguage(Locale('ar', 'AR'));
                  Navigator.pop(context);
                },
                child: Text("Arabic".tr),
              ),
            ],
          );
        },
      );
    },
  );
}
void changeLanguage(Locale locale) {
  Get.updateLocale(locale);
}