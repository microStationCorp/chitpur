import 'package:chitpur/resource/app_string.dart';
import 'package:get/get.dart';

import '../../models/microprocessor/microprocessor.model.dart';

class CategoryController extends GetxController {
  var queryData = <Map<String, List<String>>>[].obs;

  var categoriesList = <Category>[
    Category(
      title: "Coach type",
      code: "coachType",
      subcategories: [
        CoachType.lwaccn,
        CoachType.lwaccw,
        CoachType.lwaccnea,
        CoachType.lwfaccw,
        CoachType.lwcbac,
        CoachType.lwlrrm,
        CoachType.lwfac
      ].map((sc) => Subcategory(title: sc)).toList(),
    ),
    Category(
      title: "Microprocessor details",
      code: "microprocessorDetails",
      subcategories: [
        Subcategory(title: MicroprocessorName.areca),
        Subcategory(title: MicroprocessorName.sidwal),
        Subcategory(title: MicroprocessorName.venus)
      ],
    ),
  ].obs;

  void toggleSelection(Subcategory subcategory) {
    subcategory.isSelected.value = !subcategory.isSelected.value;
    update();
  }

  void updateQueryData() {
    queryData.clear();
    for (Category category in categoriesList) {
      var subCat = <String>[];
      for (Subcategory subcategory in category.subcategories) {
        if (subcategory.isSelected.value) {
          subCat.add(subcategory.title);
        }
      }
      if (subCat.isNotEmpty) {
        queryData.add({category.code: subCat});
      }
    }
    update();
  }

  void updateSearchParam(String searchParam) {
    queryData.clear();
    queryData.add({
      "coachNumber": [searchParam]
    });
    update();
  }
}
