//This is Side Navigation Bar at the top
import 'package:flutter/material.dart';
import 'package:fyp_application/HomePage.dart';
import 'package:fyp_application/authenticate/LoginPage.dart';
import 'package:fyp_application/edit_profile.dart';
import 'package:fyp_application/services/auth.dart';

class NavDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //remove padding
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Karim',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            accountEmail: Text(
              'karim@idonor.com',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Material(
                  color: Color.fromARGB(255, 176, 226, 197),
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 75.0,
                    /*fit: BoxFit.cover,
                  width: 90,
                  height: 90,*/
                  ),
                ),
              ),
            ),
            /* child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ), */
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 176, 226, 197),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://color-hex.org/colors/b0e2c5.png'))),
          ),

          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (_) => HomePage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.people_sharp),
            title: Text('Edit Profile'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => EditProfilePage()))
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          /* ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Message'),
            onTap: () => {Navigator.of(context).pop()},
          ), */
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                await _auth.signOut();

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }),
        ],
      ),
    );
  }
}
