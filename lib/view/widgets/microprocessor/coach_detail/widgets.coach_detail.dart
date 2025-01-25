import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/app_string.dart';
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
                        textColor: AppColor.successTextColor,
                        surfaceColor: AppColor.successSurfaceColor,
                        icon: Icons.check,
                      )
                    : fieldValue == AnalogFieldOptions.nok
                        ? IconTextField(
                            fieldValue: fieldValue,
                            textColor: AppColor.errorTextColor,
                            surfaceColor: AppColor.errorSurfaceColor,
                            icon: Icons.close_rounded,
                          )
                        : fieldValue == AnalogFieldOptions.notChecked
                            ? IconTextField(
                                fieldValue: fieldValue,
                                textColor: AppColor.charcoalGrey,
                                surfaceColor: AppColor.lightGrey,
                                icon: Icons.stop_outlined,
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
            Icon(
              icon,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}
