import 'package:get/get.dart';

class CustomExpansionTileController extends GetxController {
  var _expandedIndex = -1; // Start with no tile expanded
  int get expandedIndex => _expandedIndex; // Getter for expandedIndex

  void toggleTile(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = -1; // Collapse if already expanded
    } else {
      _expandedIndex = index; // Expand the new tile
    }
    update();
  }
}
