import 'package:flutter/material.dart';
import 'package:first_assignment/components/user_form.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registration'),
      ),
      body: Center(child: UserForm.displayUserForm(context, 'create')),
    );
  }
}
