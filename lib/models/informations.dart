import 'package:intl/intl.dart';

class Informations {
  Informations.fromJson(Map<String, dynamic> map) {
    informationTitle:
    map['title'];
    informationMessage:
    map['message'];
  }
  Informations(this.informationTitle, this.informationMessage);

  String? informationTitle = "";
  String? informationMessage = "";

  Map<String, dynamic> toMap() {
    return {
      'title': informationTitle,
      'message': informationMessage,
    };
  }
}
