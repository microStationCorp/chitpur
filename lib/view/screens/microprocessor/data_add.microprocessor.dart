import 'package:chitpur/data/controller/microprocessor/controller.microprocessor.dart';
import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/utils/form_validators.dart';
import 'package:chitpur/view/widgets/common/feedback_snackbar.dart';
import 'package:chitpur/view/widgets/microprocessor/card.microprocessor.dart';
import 'package:chitpur/view/widgets/microprocessor/cover.microprocessor.dart';
import 'package:chitpur/view/widgets/microprocessor/dropdown_field.microprocessor.dart';
import 'package:chitpur/view/widgets/microprocessor/text_form_field.microprocessor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataAddMP extends StatefulWidget {
  const DataAddMP({super.key});

  @override
  State<DataAddMP> createState() => _DataAddMPState();
}

class _DataAddMPState extends State<DataAddMP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MicroprocessorController controllerMp = Get.find();
  List<String> analogFieldOptions = [
    AnalogFieldOptions.ok,
    AnalogFieldOptions.nok,
    AnalogFieldOptions.open,
    AnalogFieldOptions.short,
    AnalogFieldOptions.notChecked
  ];
  List<String> coachTypes = [
    CoachType.lwaccn,
    CoachType.lwaccw,
    CoachType.lwaccnea,
    CoachType.lwcbac,
    CoachType.lwfaccw,
    CoachType.lwfac,
    CoachType.lwlrrm
  ];
  List<String> makes = [
    MicroprocessorName.areca,
    MicroprocessorName.sidwal,
    MicroprocessorName.venus,
    MicroprocessorName.sirveen
  ];
  List<String> digitalOptions = [
    DigitalFieldOptions.ok,
    DigitalFieldOptions.nok,
    DigitalFieldOptions.notChecked
  ];

  @override
  Widget build(BuildContext context) {
    return CoverMP(
      bodyMP: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    //coach details
                    CardMP(
                      child: Column(
                        children: [
                          cardHeader(Titles.coachDetails),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormFieldMP(
                            labelText:
                                MicroprocessorFormFieldsLabels.coachNumber,
                            validatorCallback: isEmptyValidator,
                            onSavedCallback: (value) {
                              controllerMp.coachNumber = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.coachType,
                            items: coachTypes,
                            onSavedCallback: (value) {
                              controllerMp.coachType = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          cardHeader(Titles.microprocessorDetails),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels
                                .microprocessorDetails,
                            items: makes,
                            onSavedCallback: (value) {
                              controllerMp.microprocessorDetails = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormFieldMP(
                            labelText: MicroprocessorFormFieldsLabels
                                .microprocessorStatus,
                            onSavedCallback: (value) {
                              controllerMp.microprocessorStatus = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels
                                .microprocessorDisplayDetails,
                            items: makes,
                            onSavedCallback: (value) {
                              controllerMp.microprocessorDisplayDetails =
                                  value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormFieldMP(
                            labelText: MicroprocessorFormFieldsLabels
                                .microprocessorDisplayStatus,
                            onSavedCallback: (value) {
                              controllerMp.microprocessorDisplayStatus = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          cardHeader(Titles.pressureGauge),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hp11,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.hp11 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hp12,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.hp12 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hp21,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.hp21 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hp22,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.hp22 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lp11,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.lp11 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lp12,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.lp12 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lp21,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.lp21 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lp22,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.lp22 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          cardHeader(Titles.sensorsStatus),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.at1,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.at1 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.at2,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.at2 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.st1,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.st1 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.st2,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.st2 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.rt1,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.rt1 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.rt2,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.rt2 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hygrostat,
                            items: analogFieldOptions,
                            onSavedCallback: (value) {
                              controllerMp.hygrostat = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          cardHeader(Titles.digitalIO),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.voltOk,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.voltOk = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.airCo,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.airCo = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.controllerOk,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.controllerOk = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.fault,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.fault = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.topBlower11,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.topBlower11 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.topBlower21,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.topBlower21 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.topCD11,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.topCD11 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.topCD12,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.topCD12 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.topCD21,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.topCD21 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.topCD22,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.topCD22 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.ohp11,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.ohp11 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.ohp21,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.ohp21 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lpFault11,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.lpFault11 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lpFault12,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.lpFault12 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lpFault21,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.lpFault21 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.lpFault22,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.lpFault22 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hpFault11,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.hpFault11 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hpFault12,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.hpFault12 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hpFault21,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.hpFault21 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropDownField(
                            label: MicroprocessorFormFieldsLabels.hpFault22,
                            items: digitalOptions,
                            onSavedCallback: (value) {
                              controllerMp.hpFault22 = value!;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: WidgetStateProperty.all(0),
                            ),
                            onPressed: () {
                              controllerMp.addMicroprocessor(_formKey);
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: WidgetStateProperty.all(0),
                              backgroundColor: WidgetStateProperty.all(
                                  AppColor.outlineColor),
                            ),
                            onPressed: () {
                              generalSnackBar("Attention", "Form Cleared");
                              _formKey.currentState!.reset();
                            },
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.cardBackgroundColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
