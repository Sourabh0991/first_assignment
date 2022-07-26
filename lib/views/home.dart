import 'package:first_assignment/services/firebase_services.dart';
import 'package:first_assignment/values/string_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_assignment/views/login.dart';
import 'package:first_assignment/views/registration.dart';
import 'package:first_assignment/components/user_form.dart';
import 'package:first_assignment/models/user_provider.dart';
import 'package:first_assignment/models/user_model.dart' as user_model;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringValues.homeTitle),
        actions: [
          IconButton(
              onPressed: () => goToRegistration(context),
              icon: const Icon(Icons.add_circle_outline)),
          IconButton(
              onPressed: () => logout(context),
              icon: const Icon(Icons.power_settings_new)),
        ],
      ),
      body: StreamBuilder<List<user_model.User>>(
        stream: FirebaseServices.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            if (users.isEmpty) {
              return const Text(StringValues.noDataFoundMsg);
            }
            return ListView(
              children:
                  users.map((element) => buildUser(element, context)).toList(),
            );
          } else if (snapshot.hasError) {
            return const Text(StringValues.errorLoadingData);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildUser(user_model.User user, context) {
    return ListTile(
      key: Key(user.id),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[300],
        child: Text(
          user.age.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(user.name),
      subtitle: Row(
        children: [
          Expanded(
              child:
                  Text('${StringValues.emailListTileLabel} ${user.emailId}')),
          Expanded(
              child: Text('${StringValues.phoneListTileLabel} ${user.phone}'))
        ],
      ),
      onTap: () {
        Provider.of<UserProvider>(context, listen: false).setSelectedUser(user);
        openRecord(context);
      },
    );
  }

  openRecord(context) {
    AlertDialog alert = AlertDialog(
      title: const Text(StringValues.updateDeleteDialogTitle),
      actions: [
        UserForm.displayUserForm(context, StringValues.updateUserFormParameter),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  Future logout(context) async {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => Login())));
    });
  }

  goToRegistration(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const Registration())));
  }
}
