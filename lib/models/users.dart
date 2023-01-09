import 'package:intl/intl.dart';

class users {
  users.fromJson(Map<String, dynamic> map) {
    Nameuser:
    map['name'];
    userName:
    map['username'];
    email:
    map['email'];
    phoneNo:
    map['phone'];
    address:
    map['address'];
    bloodType:
    map['bloodtype'];
    icnum:
    map['icnum'];
    weight:
    map['weight'];
    donateSince:
    map['donateSince'];
  }
  users(this.Nameuser, this.userName, this.email, this.phone, this.address,
      this.bloodType, this.icnum, this.weight, this.donateSince);

  String? Nameuser = "";
  String? userName = "";
  String? email = "";
  String? phone = "";
  String? address = "";
  String? bloodType = "";
  String? icnum = "";
  String? weight = "";
  late String donateSince= DateTime.now().toString();

  Map<String, dynamic> toMap() {
    //take the saved values in your local variables and can return a Map.
    return {
      'name': Nameuser,
      'username': userName,
      'email': email,
      'phone': phone,
      'address': address,
      'bloodType': bloodType,
      'icnum': icnum,
      'weight': weight,
      'donateSince' : donateSince,
    };
  }
}
