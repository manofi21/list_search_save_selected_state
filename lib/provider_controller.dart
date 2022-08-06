import 'package:flutter/cupertino.dart';
import 'package:list_search_save_selected_state/model.dart';

import 'const_name.dart';
import 'status_search.dart';

class ProviderController extends ChangeNotifier {
  ProviderController() : super();
  String _searchInput = "";

  set setModel(Model model) {
    final indexFromList = listValueKamenRider.indexWhere((e) => model == e);
    final indexFromListView = _listValue.indexWhere((e) => model == e);
    final newValue = model.copyWith(
      isSelected: !model.isSelected,
    );
    listValueKamenRider[indexFromList] = newValue;
    _listValue[indexFromListView] = newValue;

    notifyListeners();
  }

  List<Model> _listValue = listValueKamenRider;
  List<Model> get listKamenRider => _listValue;

  var _status = StatusSearch.init;
  StatusSearch get statusSearch => _status;

  void searchExecute(String userInput) {
    _status = StatusSearch.searching;
    _searchInput = userInput;

    if (_searchInput.isEmpty) {
      _listValue = listValueKamenRider;
      _status = StatusSearch.complete;
      notifyListeners();
      return;
    }

    _listValue = listValueKamenRider
        .where((e) => e.name.toLowerCase().contains(_searchInput.toLowerCase()))
        .toList();
    _status = StatusSearch.complete;
    notifyListeners();
  }
}


// class ProviderController extends ChangeNotifier {
//   ProviderController() : super();
//   String _searchInput = "";

//   Model? _model;
//   set setModel(Model model) {
//     _model = model;
//     final indexFromList = listKamenRider.indexWhere((e) => _model == e);
//     listValueKamenRider[indexFromList] = _model!.copyWith(
//       isSelected: !_model!.isSelected,
//     );
//     notifyListeners();
//   }

//   List<Model> _listValue = listValueKamenRider;
//   List<Model> get listKamenRider => _listValue;

//   var _status = StatusSearch.init;
//   StatusSearch get statusSearch => _status;

//   void searchExecute(String userInput) {
//     _status = StatusSearch.searching;
//     _searchInput = userInput;

//     debugPrint("_searchInput : $_searchInput");
//     if (_status == StatusSearch.init || _status == StatusSearch.complete) {
//       return;
//     }

//     if (_searchInput.isEmpty) {
//       _listValue = listValueKamenRider;
//       _status = StatusSearch.complete;
//       notifyListeners();
//       return;
//     }

//     _listValue = listValueKamenRider
//         .where((e) => e.name.toLowerCase().contains(_searchInput.toLowerCase()))
//         .toList();
//     _status = StatusSearch.complete;
//     notifyListeners();
//   }
// }
