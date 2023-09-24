import 'package:flutter/material.dart';
import 'package:hefish/utility/session.dart';
import 'package:intl/intl.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:get/get.dart';

import '../auth/loginScreen.dart';

// Convert to Format Rupiah
String convRupiah(int val) {
  return NumberFormat.currency(locale: 'IDR').format(val);
}

// Function LogOut
void logOut(BuildContext context) {
  ArtDialogResponse response;
  clearSession().then(
    (value) async => Navigator.of(context).pushNamedAndRemoveUntil(
      '/login',
      response = await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
          denyButtonText: "Cancel",
          title: "Are you sure?",
          text: "You will logout from this page!",
          confirmButtonText: "Yes",
          type: ArtSweetAlertType.warning,
          onConfirm: () {
            Get.off(loginScreen());
          },
        ),
      ),
    ),
  );
}
