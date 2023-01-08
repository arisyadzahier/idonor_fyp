import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'HomePage.dart';
import 'TInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MInfo();
  }
}

class _MInfo extends State<MInfo> {
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
        title: Text("INFORMATION"),
        backgroundColor: Color.fromARGB(255, 130, 224, 170),
         leading: IconButton(icon: Icon(
                  Icons.arrow_back), 
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
                  color: Color.fromARGB(255, 130, 224, 170), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => TInfo()));
                },
                child: Text(
                  'Add New Information',
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
    
    return ListView(
      //itemExtent: 100.0, 
      //shrinkWrap: true,  
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),   
      children: <Widget>[
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          title: Text('Before Donating Blood', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You should.....'),
              Text('................'),
              Text('.................'),
            ],
          ),
          trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    Icon(Icons.edit), 
                    Icon(Icons.delete),
            ]),
        ),
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          title: Text('During Donating Blood', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Drink a lot of water'),
              Text('Wear a shirt with sleeves that.....'),
              Text('Stay calm'),
            ],
          ),
           trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    Icon(Icons.edit), 
                    Icon(Icons.delete),
            ]),
        ),
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          title: Text('After Donating Blood', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Relax for a few minute'),
              Text('Enjoy snacks ad sweet drinks'),
              Text('Do not lift heavy things.'),
            ],
         ),
           trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    Icon(Icons.edit), 
                    Icon(Icons.delete),
            ]),
        ),
      ],
    );
  }
}