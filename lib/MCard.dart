//import 'dart:js';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_application/VeCard.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'HomePage.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:dio/dio.dart';

class MCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MCard();
  }
}

class _MCard extends State<MCard> {
  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    return WillPopScope(
      onWillPop: (){
        HomePage();
        return throw ''; //or return something
      },
      //top: true,
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("eCard"),
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
            Expanded(
              child: _buildList(),
            )
          ],
        ),
      ));

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
          leading: Icon(Icons.co_present),
          title: Text('arisyadzahier', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('sitiahmad98@gmail.com'),
              Text('Last visit: 23/12/2022'),
            ],
          ),
          trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {
                 navigateToCard();
                      //Navigator.of(context).push(MaterialPageRoute(
                 // builder: (BuildContext context) => VeCard()));
                              }, 
                icon: Icon(Icons.arrow_circle_right_rounded)
              ),      
            ],
            ),
        ),
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          leading: Icon(Icons.co_present),
          title: Text('sitiaminah', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('sitiahmad98@gmail.com'),
              Text('Last visit: 23/12/2022'),
            ],
          ),
          trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    Icon(Icons.arrow_circle_right_rounded),
            ]),
        ),
        ListTile(
          shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Color.fromARGB(255, 57, 56, 56)), borderRadius: BorderRadius.circular(2),),
          leading: Icon(Icons.co_present),
          title: Text('sitiaminah', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('sitiahmad98@gmail.com'),
              Text('Last visit: 23/12/2022'),
            ],
          ),
          trailing: Row( mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                    Icon(Icons.arrow_circle_right_rounded),
            ]),
        ),
      ],
    );
  }


void navigateToCard() {
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return VeCard(); 
                  }));
}

void moveToLastScreen(){
  Navigator.pop(context);
}

}