
import 'package:flutter/material.dart';

abstract class DialogHelper {
  static void showMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible:
            false, // disables popup to close if tapped outside popup (need a button to close)
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Thông báo",
              style: TextStyle(color: Colors.red),
            ),
            content: Text(message),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text("Đóng"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
            ],
          );
        });
  }
}
