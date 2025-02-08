import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/app_typography.dart';
import 'package:chitpur/view/widgets/microprocessor/card.microprocessor.dart';
import 'package:flutter/material.dart';

class CoachDetailSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> fields;

  const CoachDetailSection(
      {super.key, required this.title, required this.fields});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              cardHeader(title),
              ...fields.map(
                (f) {
                  return textFieldData(context, f['label'], f['value']) ??
                      SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget? textFieldData(
    BuildContext context, String fieldName, String? fieldValue) {
  if (fieldValue == "") {
    return null;
  }
  return fieldValue != null
      ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Text(
                  fieldName,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: fieldValue == AnalogFieldOptions.ok
                    ? IconTextField(
                        fieldValue: fieldValue,
                        textColor: Colors.white,
                        surfaceColor: AppColors.checkColor,
                        icon: AppIcons.check,
                      )
                    : fieldValue == AnalogFieldOptions.nok
                        ? IconTextField(
                            fieldValue: fieldValue,
                            textColor: AppColors.dark.onError,
                            surfaceColor: AppColors.dark.error,
                            icon: AppIcons.badgeAlert,
                          )
                        : fieldValue == AnalogFieldOptions.notChecked
                            ? IconTextField(
                                fieldValue: fieldValue,
                                textColor: AppColors.charcoalGrey,
                                surfaceColor: AppColors.lightGrey,
                                icon: AppIcons.noCheck,
                              )
                            : Text(
                                fieldValue,
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .fontSize,
                                ),
                              ),
              )
            ],
          ),
        )
      : SizedBox.shrink();
}

class IconTextField extends StatelessWidget {
  final String fieldValue;
  final Color textColor;
  final Color surfaceColor;
  final IconData icon;

  const IconTextField(
      {super.key,
      required this.fieldValue,
      required this.textColor,
      required this.surfaceColor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              fieldValue,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                color: textColor,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              color: textColor,
              size: AppTypo.primaryFontSize,
            )
          ],
        ),
      ),
    );
  }
}
