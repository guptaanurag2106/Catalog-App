import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                accountName: Text("Username"),
                accountEmail: Text("sample@sample.com"),
                currentAccountPicture: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,
                  color: Theme.of(context).buttonColor),
              title: Text('Home'),
              onTap: () => {print('1'), Navigator.pop(context)},
            ),
            ListTile(
                leading: Icon(CupertinoIcons.profile_circled,
                    color: Theme.of(context).buttonColor),
                title: Text('Profile'),
                onTap: () => {print('2'), Navigator.pop(context)}),
            ListTile(
              leading: Icon(CupertinoIcons.mail,
                  color: Theme.of(context).buttonColor),
              title: Text('Email'),
              onTap: () => {print('3'), Navigator.pop(context)},
            ),
          ],
        ),
      ),
    );
  }
}
