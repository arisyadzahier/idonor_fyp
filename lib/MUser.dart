import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'VUser.dart';

class MUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MUser();
  }
}

class _MUser extends State<MUser> {
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
    return ListView(
      //itemExtent: 100.0,
      //shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      children: <Widget>[
        ListTile(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)),
            borderRadius: BorderRadius.circular(2),
          ),
          title: Text(
            'arisyadzahier',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('sitiahmad98@gmail.com'),
              Text('Last visit: 23/12/2022'),
            ],
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => VUser()));
                },
                icon: Icon(Icons.arrow_circle_right_rounded)),
          ]),
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)),
            borderRadius: BorderRadius.circular(2),
          ),
          title: Text(
            'sitiaminah',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('sitiahmad98@gmail.com'),
              Text('Last visit: 23/12/2022'),
            ],
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Icon(Icons.arrow_circle_right_rounded),
          ]),
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)),
            borderRadius: BorderRadius.circular(2),
          ),
          title: Text(
            'sitiaminah',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('sitiahmad98@gmail.com'),
              Text('Last visit: 23/12/2022'),
            ],
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Icon(Icons.arrow_circle_right_rounded),
          ]),
        ),
      ],
    );
  }
}