import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'MInfo.dart';
import 'MCampaign.dart';
import 'MUser.dart';
import 'MCard.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(" "),
        actions: [
        IconButton(
        //alignment: Alignment.center,
        icon: Image.asset('assets/images/logo_iDonor.png', fit: BoxFit.contain),
        onPressed: () => HomePage(), 
        ),
        ],
        backgroundColor: Color.fromARGB(255, 130, 224, 170),
      ),
      
  body: 
  Center(
    child: Column(
       children: [
SizedBox(
              height: 50,
            ),

        Text("Welcome Karim!", 
           textAlign: TextAlign.left,
           style: TextStyle(
            fontSize: 25, 
            fontWeight: FontWeight.bold,),
            ),

 /*Container(  
          padding: EdgeInsets.all(20),  
          margin: EdgeInsets.all(20),  
          decoration: BoxDecoration(  
            border: Border.all(color: Color.fromARGB(255, 130, 224, 170), width: 2),  
            //borderRadius: BorderRadius.circular(15),  
            boxShadow: [  
              new BoxShadow(color: Color.fromARGB(255, 130, 224, 170), offset: new Offset(1.0, 1.0),),  
            ],  
          ),  
           child: Text("STATISTICS", 
                style: TextStyle(
                color: Colors.white, 
                fontSize: 28, 
                fontWeight: FontWeight.bold, 
                backgroundColor: Color.fromARGB(255, 130, 224, 170),
                 )),
),
*/
//Statistics Box
 Container(  
          padding: EdgeInsets.all(40),  
          margin: EdgeInsets.all(20),  
          decoration: BoxDecoration(  
            border: Border.all(color: Color.fromARGB(255, 130, 224, 170), width: 3),  
            borderRadius: BorderRadius.circular(20),
            boxShadow: [  
              new BoxShadow(color: Colors.white, offset: new Offset(1.0, 1.0),),  
            ],  
          ),  
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'STATISTICS',
                style: TextStyle(
                color: Colors.white, 
                fontSize: 30, 
                fontWeight: FontWeight.bold,
                backgroundColor: Color.fromARGB(255, 176, 226, 197), 
                 ),
                 children: [
                  TextSpan(
                    text: "\n\n123 online user",
                    style: TextStyle(
                    color: Colors.red, 
                    fontSize: 20, 
                    backgroundColor: Colors.white,
                  ),
                  ),

                  TextSpan(
                    text: "\n23 new registered users",
                    style: TextStyle(
                    color: Colors.blue, 
                    fontSize: 20, 
                    backgroundColor: Colors.white,
                  ),
                  ),
                 ]
                 ), 
          ), 
        ),  
      
SizedBox(
              height: 20,
            ),

     Wrap(
      spacing: 10,runSpacing: 10,
      alignment: WrapAlignment.spaceBetween, 
      direction: Axis.horizontal,

    //manage campaign
    children: <Widget>[
      Container(
              height:150, 
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 176, 226, 197), borderRadius: BorderRadius.circular(25)),
              child: TextButton(
                onPressed:() {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MCampaign()));
                },
              child: Text(
                'MANAGE CAMPAIGN', 
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),  
            ),
          ), 

      //manage information
       Container(
              height:150, 
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 176, 226, 197), borderRadius: BorderRadius.circular(25)),
              child: TextButton(
                onPressed:() {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MInfo()));
              },
              child: Text(
                'MANAGE INFORMATION', 
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),  
            ),
          ),  

       //manage user
       Container(
              height:150, 
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 176, 226, 197), borderRadius: BorderRadius.circular(25)),
              child: TextButton(
                onPressed:() {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MUser()));
              },
              child: Text(
                'USER', 
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),  
            ),
          ),  

       //manage ecard
       Container(
              height:150, 
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 176, 226, 197), borderRadius: BorderRadius.circular(25)),
              child: TextButton(
                onPressed:() {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MCard()));
              },
              child: Text(
                'MANAGE \ne-CARD', 
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),  
            ),
          ),  
    ],
),
       ]
)
    )
    );
  }
}
