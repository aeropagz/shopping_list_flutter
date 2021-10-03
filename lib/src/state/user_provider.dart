import 'package:flutter/foundation.dart';
import 'package:shopping_list/src/models/user/user.dart';

class UserProvider with ChangeNotifier {
  User? user;

  setUser(User u) {
    user = u;
    notifyListeners();
  }
}
