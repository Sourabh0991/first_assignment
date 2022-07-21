import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:first_assignment/values/string_values.dart';
import 'package:first_assignment/views/login.dart';
import 'package:first_assignment/models/user_provider.dart';
import 'package:first_assignment/values/firebase_credentials.dart';

class StartApp extends StatelessWidget {
  StartApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: FirebaseCredentials.apiKey,
        appId: FirebaseCredentials.appId,
        messagingSenderId: FirebaseCredentials.messagingSenderId,
        projectId: FirebaseCredentials.projectId),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: UserProvider())],
      child: MaterialApp(
        title: StringValues.projectName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text(StringValues.titleError),
                      content: Text(StringValues.unknownErrorMsg),
                    );
                  });
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Login();
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
