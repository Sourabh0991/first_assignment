import 'package:first_assignment/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  late User selectedUser;

  void setSelectedUser(value) {
    selectedUser = value;
  }

  User getSelectedUser() {
    return selectedUser;
  }
  
}