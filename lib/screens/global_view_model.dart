import 'package:flutter/material.dart';

import '../model/api/user_api.dart';
import '../model/user_model.dart';

class GlobalViewModel extends ChangeNotifier {
  TextEditingController nameC = TextEditingController();
  TextEditingController polindromeC = TextEditingController();

  String name = '';
  String userName = 'Selected Username';

  List<UserModel> alldataUser = [];

  isPolindrome(String paramPolindrome, BuildContext context) {
    bool _input;
    _input = paramPolindrome.split('').join().toLowerCase() ==
        paramPolindrome.split('').reversed.join().toLowerCase();

    if (paramPolindrome.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Palindrome Required"),
        ),
      );
    } else {
      if (_input) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("IsPalindrome"),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("NotPalindrome"),
          ),
        );
      }
    }
  }

  changeName(String paramName) {
    name = paramName;
    notifyListeners();
  }

  changePeopleName(String paramPeopleName, BuildContext context) {
    userName = paramPeopleName;
    notifyListeners();
    showDialog(
        context: context,
        builder: (builder) => const AlertDialog(
              title: Text("Success Selected User"),
            ));
  }

  getAllDataUser() async {
    List<UserModel> _dataUser = await UserApi().getAllDataUser();
    alldataUser = _dataUser;
    notifyListeners();
  }
}
