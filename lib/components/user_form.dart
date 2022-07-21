import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:first_assignment/models/user_model.dart';
import 'package:first_assignment/models/user_provider.dart';
import 'package:first_assignment/values/string_values.dart';
import 'package:first_assignment/components/registration_form_buttons.dart';
import '../models/user_model.dart';

class UserForm {
  static final formKey = GlobalKey<FormState>();

  static final nameController = TextEditingController();
  static final ageController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneController = TextEditingController();
  static final passwordController = TextEditingController();

  static late User selectedUser;

  static Container displayUserForm(context, String operation) {
    if (operation.contains(StringValues.updateUserFormParameter)) {
      selectedUser =
          Provider.of<UserProvider>(context, listen: false).getSelectedUser();

      nameController.text = selectedUser.name;
      ageController.text = selectedUser.age.toString();
      emailController.text = selectedUser.email_id;
      phoneController.text = selectedUser.phone;
      passwordController.text = selectedUser.password;
    } else {
      nameController.clear();
      ageController.clear();
      emailController.clear();
      phoneController.clear();
      passwordController.clear();
    }
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),

        /// width and height of this container are calculated based of size of the device
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: StringValues.fullNameLabel),
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringValues.emptyFullNameWarning;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: ageController,
                  decoration:
                      const InputDecoration(labelText: StringValues.ageLabel),
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringValues.emptyAgeWarning;
                    }
                    if (value.contains(RegExp(r'[A-Z, a-z]'))) {
                      return StringValues.invalidAgeWarning;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      labelText: StringValues.phoneNoLabel),
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringValues.emptyPhoneNoWarning;
                    }
                    if (value.contains(RegExp(r'[A-Z, a-z]'))) {
                      return StringValues.invalidPhoneNoWarning;
                    }
                    if (value.length != 10) {
                      return StringValues.invalidPhoneNoWarning;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(labelText: StringValues.emailLabel),
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringValues.emptyEmailWarning;
                    }
                    if (!EmailValidator.validate(value)) {
                      return StringValues.invalidEmailWarning;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: StringValues.setPasswordLabel),
                  maxLines: 1,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return StringValues.emptyPasswordWarning;
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child:
                        operation.contains(StringValues.createUserFormParameter)
                            ? RegistrationFormButton.showCreateButton(context)
                            : RegistrationFormButton.showUpdateDeleteButtons(
                                context)),
              ],
            )));
  }
}
