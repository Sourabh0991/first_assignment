import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_assignment/components/user_form.dart';
import 'package:first_assignment/models/user_model.dart';
import 'package:first_assignment/services/firebase_services.dart';
import 'package:first_assignment/values/string_values.dart';

class RegistrationFormButton {
  static Widget showCreateButton(context) {
    return ElevatedButton(
      onPressed: () => createButtonOperation(context),
      child: const Text(StringValues.submitButtonTitle),
    );
  }

  static createButtonOperation(context) {
    if (UserForm.formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringValues.processingDataMsg)),
      );

      var userToCreate = User(
          name: UserForm.nameController.text,
          age: int.parse(UserForm.ageController.text),
          email_id: UserForm.emailController.text,
          phone: UserForm.phoneController.text,
          password: UserForm.passwordController.text);

      FirebaseServices.createUser(userToCreate, UserForm.formKey).then(
        (value) {
          Fluttertoast.showToast(
              msg: StringValues.registrationSuccessMsg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              webBgColor: "green",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pop(context);
        },
      );
    }
  }

  static Widget showUpdateDeleteButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: const Text(StringValues.updateButtonLabel),
              onPressed: () => updateButtonOperation(context),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: const Text(StringValues.deleteButtonLabel),
              onPressed: () => deleteButtonOperation(context),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: const Text(StringValues.cancelButtonLabel),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        )
      ],
    );
  }

  static updateButtonOperation(context) {
    if (UserForm.formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringValues.processingDataMsg)),
      );

      var selectedUser = User(
          id: UserForm.selectedUser.id,
          name: UserForm.nameController.text,
          age: int.parse(UserForm.ageController.text),
          email_id: UserForm.emailController.text,
          phone: UserForm.phoneController.text,
          password: UserForm.passwordController.text);

      FirebaseServices.updateUser(selectedUser).then(
        (value) => Navigator.pop(context),
      );
    }
  }

  static deleteButtonOperation(context) {
    if (UserForm.formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringValues.processingDataMsg)),
      );

      FirebaseServices.deleteUser(UserForm.selectedUser.id).then(
        (value) => Navigator.pop(context),
      );
    }
  }
}
