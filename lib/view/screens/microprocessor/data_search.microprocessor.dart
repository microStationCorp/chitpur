import 'package:chitpur/data/controller/microprocessor/category.controller.dart';
import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/resource/app_typography.dart';
import 'package:chitpur/view/widgets/microprocessor/cover.microprocessor.dart';
import 'package:chitpur/view/widgets/microprocessor/stream_list_builder.microprocessor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/microprocessor/controller.microprocessor.dart';

/// A list of categories and their subcategories.
///
/// The categories are grouped into a list of maps, where each map has a
/// "title" key for the category name and a "Subcategories" key for a list
/// of subcategory names.

class DataSearchMP extends StatelessWidget {
  DataSearchMP({super.key});

  final MicroprocessorController controllerMP = Get.find();

  final CategoryController categoryController = Get.find();

  /// Builds the DataSearchMP widget which is a stateless widget.
  ///
  /// The widget is composed of a CoverMP widget which contains a column
  /// of two widgets: a Row widget which contains the search field and the
  /// category button and a Text widget which displays the search result.
  ///
  /// The search field is a TextField widget with a search icon as prefix and a
  /// clear icon as suffix. The search field is white with a black border. The
  /// text is black and the icons are black. When the text field is focused, its
  /// border turns blue.
  ///
  /// The category button is an IconButton widget which opens a category
  /// selection bottom sheet. The bottom sheet is a Wrap widget which contains
  /// the category selection buttons.
  ///
  /// The category selection buttons are ElevatedButton widgets with a blue
  /// background color and a white text color. When a button is pressed, it
  /// opens a new route with the selected category.
  @override
  Widget build(BuildContext context) {
    return CoverMP(
      bodyMP: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
            child: Row(
              children: [
                Expanded(child: _searchField(context)),
                _categoryButton(context)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(
              () => StreamBuilder(
                stream: controllerMP.microprocessorDatabaseService
                    .queryOrOperation(categoryController.queryData),
                builder: streamListBuilder,
              ),
            ),
          )
        ],
      ),
    );
  }

  // This widget creates an IconButton that opens a category selection bottom sheet
  Widget _categoryButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(
          _categoryBottomSheet(context),
          isScrollControlled: true,
        );
      },
      icon: Icon(
        AppIcons.filter,
      ),
    );
  }

  /// Returns a TextField widget with a search icon as prefix and a clear icon
  /// as suffix. The search field is white with a black border. The text is
  /// black and the icons are black. When the text field is focused, its border
  /// turns blue.
  TextField _searchField(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      onChanged: (value) {
        controllerMP.searchString.value = value;
      },
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {
            categoryController.updateSearchParam(controller.text);
          },
          icon: Icon(AppIcons.search),
        ),
        suffixIcon: Obx(
          () => IconButton(
            onPressed: () {
              controller.clear();
              controllerMP.searchString.value = '';
            },
            icon: Icon(controllerMP.searchString.value.isEmpty
                ? null
                : AppIcons.cross),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(),
        ),
        labelText: "Search Coach Number",
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: AppTypo.primaryFontSize,
        ),
      ),
    );
  }

  /// Creates a bottom sheet with a list of categories that can be expanded
  /// to show subcategories.
  ///
  /// The bottom sheet is a fixed height of 400 pixels and has a title of
  /// "Categories" centered at the top. Below the title is a list of
  /// ExpansionTile widgets, one for each category. Each ExpansionTile
  /// has a title that is the category name and children that are a list of
  /// ListTile widgets, one for each subcategory.
  ///
  /// The ExpansionTile children are initially collapsed and can be expanded
  /// by tapping on the title. The ListTile widgets have a title that is the
  /// subcategory name.
  Widget _categoryBottomSheet(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(16.0),
        height: 400, // Set a fixed height for the side sheet
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    categoryController.updateQueryData();
                    Get.back();
                  },
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                      letterSpacing: 2.0,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            // Map each category to an ExpansionTile widget
            ...categoryController.categoriesList.map(
              (category) => ExpansionTile(
                // Set the title of the ExpansionTile to the category name
                title: Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // Set the children of the ExpansionTile to a list of ListTile
                // widgets, one for each subcategory
                children: [
                  // Map each subcategory to a ListTile widget
                  ...category.subcategories.map(
                    (subCategory) => ListTile(
                      // Set the title of the ListTile to the subcategory name
                      title: Text(
                        subCategory.title,
                        style: TextStyle(
                          letterSpacing: 2.0,
                        ),
                      ),
                      tileColor: subCategory.isSelected.value
                          ? AppColors.lightGrey
                          : null,
                      onTap: () {
                        categoryController.toggleSelection(subCategory);
                      },
                      trailing: Icon(
                        subCategory.isSelected.value ? Icons.check : null,
                      ),
                    ),
                  )
                ],
              ),
            ) // Add more categories as needed
          ],
        ),
      ),
    );
  }
}
