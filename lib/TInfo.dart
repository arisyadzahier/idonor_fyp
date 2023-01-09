import 'package:flutter/material.dart';
import 'package:fyp_application/MCampaign.dart';
import 'package:fyp_application/MInfo.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_application/models/informations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Add New Info",
      home: TInfo(),
    );
  }
}

class TInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TInfo();
  }
}

class _TInfo extends State<TInfo> {
  TextEditingController informationTitle = TextEditingController();
  TextEditingController informationMessage = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  // void initState() {
  //   dateinput.text = ""; //set the initial value of text field
  //   timeinput.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Information"),
        backgroundColor:
            Color.fromARGB(255, 130, 224, 170), //background color of app bar
      ),
      body: Container(
        //height: 50,
        margin: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),

            // CAMPAIGN NAME
            Padding(
              // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: informationTitle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //icon: Icon(Icons.title_outlined),
                  labelText:
                      "Title", /* hintText: 'Enter the name of the Campaign'*/
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 480,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: informationMessage,
                        decoration: InputDecoration(
                            labelText: 'Enter Message',
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        expands: true, // <-- SEE HERE
                      ),
                    ),

                    // CAMERA
                    // Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    // child: IconButton(
                    //   icon: Icon(Icons.camera_alt_outlined),
                    //   alignment: Alignment.bottomLeft,
                    //   onPressed: () {
                    //       print("Icon Button clicked");
                    //     },
                    // ),
                    // ),

                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //   primary: Color.fromARGB(255, 130, 224, 170)),
                    //   child: const Text(
                    //     'SAVE NEW INFORMATION',
                    //     style: TextStyle(fontSize: 24, color: Colors.white),
                    //   ),
                    // ),

                    //BUTTON SAVE INFORMATION
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 130, 224, 170),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          CollectionReference informations = FirebaseFirestore
                              .instance
                              .collection('informations');
                          informations.add(Informations(informationTitle.text,
                                  informationMessage.text)
                              .toMap());
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => MInfo()));
                        },
                        child: Text(
                          'Save New Information',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
