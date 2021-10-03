import 'package:flutter/foundation.dart';
import 'package:shopping_list/src/models/shopping/lists_response.dart';

class ListResponseProvider with ChangeNotifier {
  ListResponse? listResponse;

  setResponse(ListResponse? res) {
    listResponse = res;
    notifyListeners();
  }
}
