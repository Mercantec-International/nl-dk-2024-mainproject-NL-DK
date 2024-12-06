import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '/main.dart';

class General {
  static String? version;
  static bool isPhone = false, isHomeScreen = false, isSettings = false, isLoading = false, isFirstLoad = true;
  static ConnectivityResult? connectivity;
  static Completer? doneLoading, doneDelete;
  static Timer? alertCheck, permissionUpdater;
  static int sdkInt = 0;

  // Create and show snackbar
  static void makeSnackBar(String text) => ScaffoldMessenger.of(globalNavigatorKey.currentContext!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ),
  );

  // Show standard simple loading dialog
  void ShowLoadingDialog([String? text]) {
    isLoading = true;
    doneLoading = Completer();
    showDialog(
      barrierDismissible: false,
      context: globalNavigatorKey.currentContext!,
      builder: (BuildContext context) => const PopScope(
        canPop: false,
        child: AlertDialog(
          insetPadding: EdgeInsets.all(1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          content: Row(
            children: [
              CircularProgressIndicator(),
              Spacer(),
              SizedBox(
                width: 120,
                child: Text("Henter data, Vent venligst"),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}