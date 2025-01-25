import 'package:chitpur/data/models/microprocessor/microprocessor.model.dart';
import 'package:chitpur/view/widgets/common/feedback_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../services/microprocesor.database_service.dart';

class MicroprocessorController extends GetxController {
  RxString searchString = "".obs;
  final MicroprocessorDatabaseService microprocessorDatabaseService =
      MicroprocessorDatabaseService();

  // Coach details
  late String coachNumber;
  late String coachType;
  late String microprocessorDetails;
  late String? microprocessorStatus;
  late String microprocessorDisplayDetails;
  late String? microprocessorDisplayStatus;

  // Digital inputs
  late String voltOk;
  late String airCo;
  late String controllerOk;
  late String fault;
  late String topBlower11;
  late String topBlower21;
  late String topCD11;
  late String topCD12;
  late String topCD21;
  late String topCD22;
  late String ohp11;
  late String ohp21;
  late String hpFault11;
  late String hpFault12;
  late String hpFault21;
  late String hpFault22;
  late String lpFault11;
  late String lpFault12;
  late String lpFault21;
  late String lpFault22;

  // Sensor states
  late String at1;
  late String at2;
  late String st1;
  late String st2;
  late String rt1;
  late String rt2;
  late String hygrostat;

  // Pressure gauge readings
  late String hp11;
  late String hp12;
  late String hp21;
  late String hp22;
  late String lp11;
  late String lp12;
  late String lp21;
  late String lp22;

  // Add a new microprocessor entry
  void addMicroprocessor(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      // Create a new Microprocessor instance
      Microprocessor newMicroprocessor = Microprocessor(
        coachNumber: coachNumber,
        coachType: coachType,
        microprocessorDetails: microprocessorDetails,
        microprocessorStatus: microprocessorStatus,
        microprocessorDisplayDetails: microprocessorDisplayDetails,
        microprocessorDisplayStatus: microprocessorDisplayStatus,
        voltOk: voltOk,
        airCo: airCo,
        controllerOk: controllerOk,
        fault: fault,
        topBlower11: topBlower11,
        topBlower21: topBlower21,
        topCD11: topCD11,
        topCD12: topCD12,
        topCD21: topCD21,
        topCD22: topCD22,
        ohp11: ohp11,
        ohp21: ohp21,
        hpFault11: hpFault11,
        hpFault12: hpFault12,
        hpFault21: hpFault21,
        hpFault22: hpFault22,
        lpFault11: lpFault11,
        lpFault12: lpFault12,
        lpFault21: lpFault21,
        lpFault22: lpFault22,
        at1: at1,
        at2: at2,
        st1: st1,
        st2: st2,
        rt1: rt1,
        rt2: rt2,
        hygrostat: hygrostat,
        hp11: hp11,
        hp12: hp12,
        hp21: hp21,
        hp22: hp22,
        lp11: lp11,
        lp12: lp12,
        lp21: lp21,
        lp22: lp22,
      );

      try {
        // Attempt to add microprocessor to the database
        microprocessorDatabaseService.addMicroprocessor(newMicroprocessor);
        successSnackBar("Success", "Form Submitted");
        formKey.currentState!.reset(); // Reset form on success
      } catch (e) {
        errorSnackBar("Error", "Something wrong : ${e.toString()}");
      }
    } else {
      errorSnackBar("Error", "Validation Error");
    }
  }

}
