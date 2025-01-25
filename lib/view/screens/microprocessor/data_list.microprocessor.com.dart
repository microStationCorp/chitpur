import 'package:chitpur/data/controller/microprocessor/controller.microprocessor.dart';
import 'package:chitpur/view/widgets/microprocessor/cover.microprocessor.dart';
import 'package:chitpur/view/widgets/microprocessor/stream_list_builder.microprocessor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataListMP extends StatefulWidget {
  const DataListMP({super.key});

  @override
  State<DataListMP> createState() => _DataListMPState();
}

class _DataListMPState extends State<DataListMP> {
  @override
  Widget build(BuildContext context) {
    MicroprocessorController controllerMP = Get.find();
    return CoverMP(
      bodyMP: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: controllerMP.microprocessorDatabaseService
              .getAllMicroprocessors(),
          builder: streamListBuilder,
        ),
      ),
    );
  }
}
