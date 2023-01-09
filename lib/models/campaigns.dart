import 'package:intl/intl.dart';

class Campaigns {
  Campaigns.fromJson(Map<String, dynamic> map) {
    campaignName:
    map['name'];
    date:
    map['date'];
    start:
    map['start'];
    end:
    map['end'];
    location:
    map['location'];
    status:
    map['status'];
  }
  Campaigns(this.campaignName, this.date, this.startTime, this.endTime,
      this.location, this.status);

  String? campaignName = "";
  late String date = DateTime.now().toString();
  late String? startTime = DateTime.now().toString();
  late String? endTime = DateTime.now().toString();
  String? location = "";
  String? status = "";

  Map<String, dynamic> toMap() {
    return {
      'name': campaignName,
      'date': date,
      'start': startTime,
      'end': endTime,
      'location': location,
      'status': status,
    };
  }
}
