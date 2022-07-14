// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:first_assignment/user_form.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registration'),
      ),
      body: Center(child: UserForm.displayUserForm(context, 'create')),
    );
  }
}
