import 'package:flutter/material.dart';
import 'package:fyp_application/MCampaign.dart';
import 'package:fyp_application/models/campaigns.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'TCampaign.dart';


const List<String> list = <String>['On Going', 'Coming Soon', 'Finished'];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Update Campaign",
      home: UpdateCampaign(),
    );
  }
}

class UpdateCampaign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UpdateCampaign();
  }
}

class _UpdateCampaign extends State<UpdateCampaign> {
  TextEditingController campaignName = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController startInput = TextEditingController();
  TextEditingController endInput = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController status = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference campaigns =
      FirebaseFirestore.instance.collection('campaigns');
  Future<QuerySnapshot<Object?>>? docRef;

  var dropdownValue;
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    startInput.text = ""; //set the initial value of text field
    endInput.text = "";
    super.initState();
    docRef = campaigns.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Campaign"),
        backgroundColor:
            Color.fromARGB(255, 130, 224, 170), //background color of app bar
      ),
      body: Container(
        //height: 50,
        margin: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),

              // CAMPAIGN NAME
              Padding(
                // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: campaignName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.campaign),
                      labelText: "Campaign's Name",
                      hintText: 'Enter the name of the Campaign'),
                ),
              ),

              // TO CHOOSE DATE
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  height: 50,
                  child: Center(
                    child: TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
              ),

              //TO CHOOSE START TIME
              Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: TextField(
                    controller:
                        startInput, //editing controller of this TextField
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.timer), //icon of text field
                        labelText: "Enter Start Time" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        print(pickedTime.format(context)); //output 10:51 PM
                        var parsedTime = DateFormat('hh:mm')
                            .parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime =
                            DateFormat('HH:mm:ss').format(parsedTime);
                        print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                        setState(() {
                          startInput.text =
                              formattedTime; //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                    }, //async
                  ),
                ),
              ),

              //TO CHOOSE END TIME
              Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: TextField(
                    controller: endInput, //editing controller of this TextField
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.timer), //icon of text field
                        labelText: "Enter End Time" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        print(pickedTime.format(context)); //output 10:51 PM
                        var parsedTime = DateFormat('hh:mm')
                            .parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime =
                            DateFormat('HH:mm:ss').format(parsedTime);
                        print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                        setState(() {
                          endInput.text =
                              formattedTime; //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                    }, //async
                  ),
                ),
              ),

              //Location
              Padding(
                // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: location,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.location_city),
                      labelText: "Location",
                      hintText: 'Enter the name of the place'),
                ),
              ),

              //Dropdown Status
              Padding(
                  padding: EdgeInsets.all(15),
                  //elevation: 1,
                  //margin: EdgeInsets.only(bottom: 3),
                  child: ListTile(
                      title: Text(
                        "Status: ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      trailing: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        hint: Text("Choose Status"),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        elevation: 20,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            status.text = value!;
                            dropdownValue = value;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )))),

              Container(
                margin: const EdgeInsets.only(top: 20.0),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 130, 224, 170),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    // CollectionReference campaigns =
                    // FirebaseFirestore.instance
                    //     .collection('campaigns');
                    //     .doc('document_id');
                    //     .update(
                    //       {
                    //       'name': 'Some new data',
                    //       'date': 'Some new data',
                    //       'start': 'Some new data',
                    //       'end': 'Some new data',
                    //       'location': 'Some new data',
                    //       'status': 'Some new data'
                    //       },
                    //      );

                    CollectionReference campaigns =
                        FirebaseFirestore.instance.collection('campaigns');
                    campaigns.add(Campaigns(
                            campaignName.text,
                            dateinput.text,
                            startInput.text,
                            endInput.text,
                            location.text,
                            status.text)
                        .toMap());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MCampaign()));
                  },
                  child: Text(
                    'Save Updated Campaign',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
