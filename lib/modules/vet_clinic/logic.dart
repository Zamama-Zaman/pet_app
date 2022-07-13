import 'package:get/get.dart';

import 'state.dart';

class VetClinicLogic extends GetxController {
  final state = VetClinicState();

  List<MilesSelectionClassModel> milesList = [
    MilesSelectionClassModel(title: 'Within City', isSelected: false),
    MilesSelectionClassModel(title: 'Within 1 Mile', isSelected: false),
    MilesSelectionClassModel(title: 'Within 2 Miles', isSelected: false),
    MilesSelectionClassModel(title: 'Within 5 Miles', isSelected: false),
    MilesSelectionClassModel(title: 'Within 10 Miles', isSelected: false),
    MilesSelectionClassModel(title: 'Within 20 Miles', isSelected: false),
    MilesSelectionClassModel(title: 'Within 30 Miles', isSelected: false),
  ];
  String? selectedMile;
  updateSelectedMile(String? newValue) {
    selectedMile = newValue;
    update();
  }
}

class MilesSelectionClassModel {
  MilesSelectionClassModel({this.title, this.isSelected});
  String? title;
  bool? isSelected;
}
