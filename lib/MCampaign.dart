import 'dart:ui';
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
    
    return ListView(
      //itemExtent: 100.0, 
      //shrinkWrap: true,  
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),   
      children: <Widget>[
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          title: Text('Lets Donate Blood', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('17/6/2022'),
              Text('0900 - 1700'),
              Text('SHAHS Mosque IIUM'),
            ],
          ),
          trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    
                    Text('ON GOING', style: TextStyle(backgroundColor: Colors.green),),
                    Icon(Icons.edit), 
                    Icon(Icons.delete),
            ]),
        ),
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          title: Text('Lets Donate Blood', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('17/6/2022'),
              Text('0900 - 1700'),
              Text('SHAHS Mosque IIUM'),
            ],
          ),
           trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    Text('COMING SOON', style: TextStyle(backgroundColor: Colors.blue),),
                    Icon(Icons.edit), 
                    Icon(Icons.delete),
            ]),
        ),
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          title: Text('Lets Donate Blood', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('17/6/2022'),
              Text('0900 - 1700'),
              Text('SHAHS Mosque IIUM'),
            ],
         ),
           trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    Text('FINISHED', style: TextStyle(backgroundColor: Colors.orange),),
                    Icon(Icons.edit), 
                    Icon(Icons.delete),
            ]),
        ),
      ],
    );
  }
}