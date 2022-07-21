import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_assignment/components/loader.dart';
import 'package:first_assignment/values/string_values.dart';

class FirebaseRegistration extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FirebaseRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringValues.firebaseRegistrationTitle),
      ),
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width * 0.33,
            height: MediaQuery.of(context).size.width * 0.20,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueAccent,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          labelText: StringValues.emailLabel),
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
                      controller: _passwordController,
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
                      child: ElevatedButton(
                        onPressed: () => register(context),
                        child: const Text(StringValues.submitButtonTitle),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  register(context) {
    if (_formKey.currentState!.validate()) {
      Loader.showLoader(context);

      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
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
        _formKey.currentState!.reset();
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(
            msg: StringValues.registrationFailedMsg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            webBgColor: "red",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }
}
