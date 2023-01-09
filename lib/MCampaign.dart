import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'HomePage.dart';
import 'TCampaign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MCampaign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MCampaign();
  }
}

class _MCampaign extends State<MCampaign> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference campaigns =
      FirebaseFirestore.instance.collection('campaigns');
  Future<QuerySnapshot<Object?>>? docRef;
  @override
  void initState() {
    super.initState();
    docRef = campaigns.get();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("CAMPAIGN"),
          backgroundColor: Color.fromARGB(255, 130, 224, 170),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 130, 224, 170),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => TCampaign()));
                },
                child: Text(
                  'Add New Campaign',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: _buildList(),
            )
          ],
        ),
      ),
    );

    Column(
      children: <Widget>[
        //  _buildBox(),
        _buildList(),
      ],
    );
  }

  Widget _buildList() {
    return FutureBuilder(
      future: docRef,
      builder: (BuildContext context, snapshot) {
        print(snapshot);
        print(snapshot.hasData);
        if (snapshot.hasData) {
          var x = snapshot.data?.docs.map((e) => print(e['name']));
          // return Text("${snapshot.data?.docs.length} + ${snapshot.data?.docs[0]['name']}");
          return ListView.builder(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  visualDensity: VisualDensity(vertical: 4.0, horizontal: 0.5),
                  contentPadding: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: Color.fromARGB(255, 57, 56, 56)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  title: Text(
                    snapshot.data?.docs[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data?.docs[index]['date']),
                      Text(
                          '${snapshot.data?.docs[index]['start']} - ${snapshot.data?.docs[0]['end']}'),
                      Text(snapshot.data?.docs[index]['location']),
                    ],
                  ),
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text(
                      snapshot.data?.docs[index]['status'],
                      style: TextStyle(backgroundColor: Color.fromARGB(255, 225, 143, 170)),
                    ),
                    Icon(Icons.edit),
                    Icon(Icons.delete),
                  ]),
                ),
              );
            },
          );
        }
        return Text("data");
      },
    );
  }
}
