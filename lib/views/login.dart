import 'package:flutter/material.dart';
import 'package:first_assignment/services/firebase_services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:first_assignment/views/firebase_registration.dart';
import 'package:first_assignment/values/string_values.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringValues.loginTitle),
      ),
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width * 0.20,
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
                        return _validationCheck(value, StringValues.emailLabel);
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: StringValues.passwordLabel),
                      maxLines: 1,
                      obscureText: true,
                      validator: (value) {
                        return _validationCheck(value, StringValues.passwordLabel);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () => _loginOperation(context),
                        child: const Text(StringValues.loginTitle),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: TextButton(
                          onPressed: () => _gotoRegistration(context),
                          child: const Text(StringValues.gotoRegistration),
                        ))
                  ],
                ))),
      ),
    );
  }

  _validationCheck(value, label) {
    if (value == null || value.isEmpty) {
      if (label == StringValues.emailLabel) {
        return StringValues.emptyEmailWarning;
      } else if (label == StringValues.passwordLabel) {
        return StringValues.emptyPasswordWarning;
      }
    }

    if (label == StringValues.emailLabel) {
      if (!EmailValidator.validate(value)) {
        return StringValues.invalidEmailWarning;
      }
    }

    return null;
  }

  _loginOperation(context) {
    if (_formKey.currentState!.validate()) {
      final user = {
        StringValues.emailIdKey: _emailController.text,
        StringValues.passwordKey: _passwordController.text
      };
      FirebaseServices.attemptLogin(user, context);
    }
  }

  _gotoRegistration(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirebaseRegistration(),
        ));
  }
}
