import 'package:flutter/material.dart';
import 'package:first_assignment/values/string_values.dart';

class Loader {
  static void showLoader(context) {
    showDialog(
        context: context,
        builder: (value) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                Container(
                    margin: const EdgeInsets.only(left: 7),
                    child: const Text(StringValues.loading)),
              ],
            ),
          );
        });
  }
}
