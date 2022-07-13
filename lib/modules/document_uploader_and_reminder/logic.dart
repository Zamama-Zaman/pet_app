import 'package:get/get.dart';

import 'state.dart';

class DocumentUploaderAndReminderLogic extends GetxController {
  final state = DocumentUploaderAndReminderState();

  List<VendorSelectionClassModel> vendorList = [
    VendorSelectionClassModel(title: 'Craig', isSelected: false),
    VendorSelectionClassModel(title: 'Del', isSelected: false),
    VendorSelectionClassModel(title: 'Pearsons', isSelected: false),
    VendorSelectionClassModel(title: 'Petco', isSelected: false),
    VendorSelectionClassModel(title: 'Test', isSelected: false),
  ];
  String? selectedVendor;
  updateSelectedVendor(String? newValue) {
    selectedVendor = newValue;
    update();
  }
}

class VendorSelectionClassModel {
  VendorSelectionClassModel({this.title, this.isSelected});
  String? title;
  bool? isSelected;
}
