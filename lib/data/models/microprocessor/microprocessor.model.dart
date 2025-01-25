import 'package:get/get.dart';

/// Microprocessor model class
class Microprocessor {
  /// coach number
  String coachNumber;

  /// coach type
  String coachType;

  /// microprocessor details
  String microprocessorDetails;

  /// microprocessor status
  String? microprocessorStatus;

  /// microprocessor display details
  String microprocessorDisplayDetails;

  /// microprocessor display status
  String? microprocessorDisplayStatus;

  /// digital inputs
  String voltOk;
  String airCo;
  String controllerOk;
  String fault;
  String topBlower11;
  String topBlower21;
  String topCD11;
  String topCD12;
  String topCD21;
  String topCD22;
  String ohp11;
  String ohp21;
  String hpFault11;
  String hpFault12;
  String hpFault21;
  String hpFault22;
  String lpFault11;
  String lpFault12;
  String lpFault21;
  String lpFault22;

  /// sensors
  String at1;
  String at2;
  String st1;
  String st2;
  String rt1;
  String rt2;
  String hygrostat;

  /// pressure gauge
  String hp11;
  String hp12;
  String hp21;
  String hp22;
  String lp11;
  String lp12;
  String lp21;
  String lp22;

  /// constructor
  Microprocessor({
    required this.coachNumber,
    required this.coachType,
    required this.microprocessorDetails,
    required this.microprocessorDisplayDetails,
    this.microprocessorStatus,
    this.microprocessorDisplayStatus,
    required this.voltOk,
    required this.airCo,
    required this.controllerOk,
    required this.fault,
    required this.topBlower11,
    required this.topBlower21,
    required this.topCD11,
    required this.topCD12,
    required this.topCD21,
    required this.topCD22,
    required this.ohp11,
    required this.ohp21,
    required this.hpFault11,
    required this.hpFault12,
    required this.hpFault21,
    required this.hpFault22,
    required this.lpFault11,
    required this.lpFault12,
    required this.lpFault21,
    required this.lpFault22,
    required this.at1,
    required this.at2,
    required this.st1,
    required this.st2,
    required this.rt1,
    required this.rt2,
    required this.hygrostat,
    required this.hp11,
    required this.hp12,
    required this.hp21,
    required this.hp22,
    required this.lp11,
    required this.lp12,
    required this.lp21,
    required this.lp22,
  });

  /// from json to Microprocessor model class
  Microprocessor.fromJson(Map<String, dynamic> json)
      : this(
          coachNumber: json['coachNumber'] as String,
          coachType: json['coachType'] as String,
          microprocessorDetails: json['microprocessorDetails'] as String,
          microprocessorStatus: json['microprocessorStatus'] as String,
          microprocessorDisplayDetails:
              json['microprocessorDisplayDetails'] as String,
          microprocessorDisplayStatus:
              json['microprocessorDisplayStatus'] as String,
          voltOk: json['voltOk'] as String,
          airCo: json['airCo'] as String,
          controllerOk: json['controllerOk'] as String,
          fault: json['fault'] as String,
          topBlower11: json['topBlower11'] as String,
          topBlower21: json['topBlower21'] as String,
          topCD11: json['topCD11'] as String,
          topCD12: json['topCD12'] as String,
          topCD21: json['topCD21'] as String,
          topCD22: json['topCD22'] as String,
          ohp11: json['ohp11'] as String,
          ohp21: json['ohp21'] as String,
          hpFault11: json['hpFault11'] as String,
          hpFault12: json['hpFault12'] as String,
          hpFault21: json['hpFault21'] as String,
          hpFault22: json['hpFault22'] as String,
          lpFault11: json['lpFault11'] as String,
          lpFault12: json['lpFault12'] as String,
          lpFault21: json['lpFault21'] as String,
          lpFault22: json['lpFault22'] as String,
          at1: json['at1'] as String,
          at2: json['at2'] as String,
          st1: json['st1'] as String,
          st2: json['st2'] as String,
          rt1: json['rt1'] as String,
          rt2: json['rt2'] as String,
          hygrostat: json['hygrostat'] as String,
          hp11: json['hp11'] as String,
          hp12: json['hp12'] as String,
          hp21: json['hp21'] as String,
          hp22: json['hp22'] as String,
          lp11: json['lp11'] as String,
          lp12: json['lp12'] as String,
          lp21: json['lp21'] as String,
          lp22: json['lp22'] as String,
        );

  /// to update database and return Microprocessor model
  Microprocessor copyWith({
    String? coachNumber,
    String? coachType,
    String? microprocessorDetails,
    String? microprocessorStatus,
    String? microprocessorDisplayDetails,
    String? microprocessorDisplayStatus,
    String? voltOk,
    String? airCo,
    String? controllerOk,
    String? fault,
    String? topBlower11,
    String? topBlower21,
    String? topCD11,
    String? topCD12,
    String? topCD21,
    String? topCD22,
    String? ohp11,
    String? ohp21,
    String? hpFault11,
    String? hpFault12,
    String? hpFault21,
    String? hpFault22,
    String? lpFault11,
    String? lpFault12,
    String? lpFault21,
    String? lpFault22,
    String? at1,
    String? at2,
    String? st1,
    String? st2,
    String? rt1,
    String? rt2,
    String? hygrostat,
    String? hp11,
    String? hp12,
    String? hp21,
    String? hp22,
    String? lp11,
    String? lp12,
    String? lp21,
    String? lp22,
  }) {
    return Microprocessor(
      coachNumber: coachNumber ?? this.coachNumber,
      coachType: coachType ?? this.coachType,
      microprocessorDetails:
          microprocessorDetails ?? this.microprocessorDetails,
      microprocessorStatus: microprocessorStatus ?? this.microprocessorStatus,
      microprocessorDisplayDetails:
          microprocessorDisplayDetails ?? this.microprocessorDisplayDetails,
      microprocessorDisplayStatus:
          microprocessorDisplayStatus ?? this.microprocessorDisplayStatus,
      voltOk: voltOk ?? this.voltOk,
      airCo: airCo ?? this.airCo,
      controllerOk: controllerOk ?? this.controllerOk,
      fault: fault ?? this.fault,
      topBlower11: topBlower11 ?? this.topBlower11,
      topBlower21: topBlower21 ?? this.topBlower21,
      topCD11: topCD11 ?? this.topCD11,
      topCD12: topCD12 ?? this.topCD12,
      topCD21: topCD21 ?? this.topCD21,
      topCD22: topCD22 ?? this.topCD22,
      ohp11: ohp11 ?? this.ohp11,
      ohp21: ohp21 ?? this.ohp21,
      hpFault11: hpFault11 ?? this.hpFault11,
      hpFault12: hpFault12 ?? this.hpFault12,
      hpFault21: hpFault21 ?? this.hpFault21,
      hpFault22: hpFault22 ?? this.hpFault22,
      lpFault11: lpFault11 ?? this.lpFault11,
      lpFault12: lpFault12 ?? this.lpFault12,
      lpFault21: lpFault21 ?? this.lpFault21,
      lpFault22: lpFault22 ?? this.lpFault22,
      at1: at1 ?? this.at1,
      at2: at2 ?? this.at2,
      st1: st1 ?? this.st1,
      st2: st2 ?? this.st2,
      rt1: rt1 ?? this.rt1,
      rt2: rt2 ?? this.rt2,
      hygrostat: hygrostat ?? this.hygrostat,
      hp11: hp11 ?? this.hp11,
      hp12: hp12 ?? this.hp12,
      hp21: hp21 ?? this.hp21,
      hp22: hp22 ?? this.hp22,
      lp11: lp11 ?? this.lp11,
      lp12: lp12 ?? this.lp12,
      lp21: lp21 ?? this.lp21,
      lp22: lp22 ?? this.lp22,
    );
  }

  /// to json , usefull to store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'coachNumber': coachNumber,
      'coachType': coachType,
      'microprocessorDetails': microprocessorDetails,
      'microprocessorStatus': microprocessorStatus,
      'microprocessorDisplayDetails': microprocessorDisplayDetails,
      'microprocessorDisplayStatus': microprocessorDisplayStatus,
      'voltOk': voltOk,
      'airCo': airCo,
      'controllerOk': controllerOk,
      'fault': fault,
      'topBlower11': topBlower11,
      'topBlower21': topBlower21,
      'topCD11': topCD11,
      'topCD12': topCD12,
      'topCD21': topCD21,
      'topCD22': topCD22,
      'ohp11': ohp11,
      'ohp21': ohp21,
      'hpFault11': hpFault11,
      'hpFault12': hpFault12,
      'hpFault21': hpFault21,
      'hpFault22': hpFault22,
      'lpFault11': lpFault11,
      'lpFault12': lpFault12,
      'lpFault21': lpFault21,
      'lpFault22': lpFault22,
      'at1': at1,
      'at2': at2,
      'st1': st1,
      'st2': st2,
      'rt1': rt1,
      'rt2': rt2,
      'hygrostat': hygrostat,
      'hp11': hp11,
      'hp12': hp12,
      'hp21': hp21,
      'hp22': hp22,
      'lp11': lp11,
      'lp12': lp12,
      'lp21': lp21,
      'lp22': lp22,
    };
  }
}

class Category {
  String title;
  String code;
  List<Subcategory> subcategories;

  Category(
      {required this.title, required this.code, required this.subcategories});
}

class Subcategory {
  String title;
  RxBool isSelected = false.obs;

  Subcategory({required this.title});
}
