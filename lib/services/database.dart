/*import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

Final String uid;
DatabaseService({this.uid})

  //collection reference
  final CollectionReference CampaignCollection = Firestore.instance('campaign');

  Future updateUserData(String title, String location, String time) async {
    return await CampaignCollection.document(uid).setData({
      'title' : title,
      'location' : location,
      'time' : time,
    });
  }

  //get campaign stream
  Stream<QuerySnapshot? get campaign {
    return CampaignCollection.snapshots();
  }

}*/