import 'package:chitpur/data/controller/microprocessor/controller.microprocessor.dart';
import 'package:chitpur/data/models/microprocessor/microprocessor.model.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/view/widgets/microprocessor/coach_detail/widgets.coach_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachDetailMP extends StatefulWidget {
  const CoachDetailMP({super.key, required this.microprocessor});

  final Microprocessor microprocessor;

  @override
  State<CoachDetailMP> createState() => _CoachDetailMPState();
}

class _CoachDetailMPState extends State<CoachDetailMP> {
  MicroprocessorController controllerMP = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.microprocessor.coachNumber}(${widget.microprocessor.coachType.toUpperCase()})"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CoachDetailSection(
                  title: Titles.microprocessorDetails,
                  fields: [
                    {
                      "label":
                          MicroprocessorFormFieldsLabels.microprocessorDetails,
                      "value": widget.microprocessor.microprocessorDetails
                    },
                    {
                      "label":
                          MicroprocessorFormFieldsLabels.microprocessorStatus,
                      "value": widget.microprocessor.microprocessorStatus
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels
                          .microprocessorDisplayDetails,
                      "value":
                          widget.microprocessor.microprocessorDisplayDetails
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels
                          .microprocessorDisplayStatus,
                      "value": widget.microprocessor.microprocessorDisplayStatus
                    },
                  ],
                ),
                CoachDetailSection(
                  title: Titles.pressureGauge,
                  fields: [
                    {
                      "label": MicroprocessorFormFieldsLabels.hp11,
                      "value": widget.microprocessor.hp11
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.hp12,
                      "value": widget.microprocessor.hp12
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.hp21,
                      "value": widget.microprocessor.hp21
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.hp22,
                      "value": widget.microprocessor.hp22
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lp11,
                      "value": widget.microprocessor.lp11
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lp12,
                      "value": widget.microprocessor.lp12
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lp21,
                      "value": widget.microprocessor.lp21
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lp22,
                      "value": widget.microprocessor.lp22
                    }
                  ],
                ),
                CoachDetailSection(
                  title: Titles.sensorsStatus,
                  fields: [
                    {
                      "label": MicroprocessorFormFieldsLabels.at1,
                      "value": widget.microprocessor.at1
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.at2,
                      "value": widget.microprocessor.at2
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.st1,
                      "value": widget.microprocessor.st1
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.st2,
                      "value": widget.microprocessor.st2
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.rt1,
                      "value": widget.microprocessor.rt1
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.rt2,
                      "value": widget.microprocessor.rt2
                    },
                  ],
                ),
                CoachDetailSection(
                  title: Titles.digitalIO,
                  fields: [
                    {
                      "label": MicroprocessorFormFieldsLabels.voltOk,
                      "value": widget.microprocessor.voltOk
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.airCo,
                      "value": widget.microprocessor.airCo
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.controllerOk,
                      "value": widget.microprocessor.controllerOk
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.fault,
                      "value": widget.microprocessor.fault
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.topBlower11,
                      "value": widget.microprocessor.topBlower11
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.topBlower21,
                      "value": widget.microprocessor.topBlower21
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.topCD11,
                      "value": widget.microprocessor.topCD11
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.topCD12,
                      "value": widget.microprocessor.topCD12
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.topCD21,
                      "value": widget.microprocessor.topCD21
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.topCD22,
                      "value": widget.microprocessor.topCD22,
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.ohp11,
                      "value": widget.microprocessor.ohp11
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.ohp21,
                      "value": widget.microprocessor.ohp21
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.hpFault11,
                      "value": widget.microprocessor.hpFault11
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.hpFault12,
                      "value": widget.microprocessor.hpFault12
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.hpFault21,
                      "value": widget.microprocessor.hpFault21
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.hpFault22,
                      "value": widget.microprocessor.hpFault22
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lpFault11,
                      "value": widget.microprocessor.lpFault11
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lpFault12,
                      "value": widget.microprocessor.lpFault12
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lpFault21,
                      "value": widget.microprocessor.lpFault21
                    },
                    {
                      "label": MicroprocessorFormFieldsLabels.lpFault22,
                      "value": widget.microprocessor.lpFault22
                    }
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
