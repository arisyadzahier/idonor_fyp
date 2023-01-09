import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'VUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MUser();
  }
}

class _MUser extends State<MUser> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<QuerySnapshot<Object?>>? docRef;
  @override
  void initState() {
    super.initState();
    docRef = users.get();
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
          title: Text("USER"),
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
            /*Container(
              margin: const EdgeInsets.only(top: 20.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 130, 224, 170), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  'Add New Campaign',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ), */
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
          return ListView.builder(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(padding: EdgeInsets.all(8.0), 
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: Color.fromARGB(255, 57, 56, 56)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  title: Text(
                    snapshot.data?.docs[index]['username'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data?.docs[index]['email']),
                      Text(snapshot.data?.docs[index]['name']),
                    ],
                  ),
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => VUser()));
                        },
                        icon: Icon(Icons.arrow_circle_right_rounded)),
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
