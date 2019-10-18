import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingPage extends StatefulWidget {
    static String routeName = "/settingPage";
    @override
    _SettingPageState createState() => new _SettingPageState();
}


class _SettingPageState extends State<SettingPage> {
  TextEditingController ctrlTxtName;
  TextEditingController ctrlTxtPasswd;
 
  @override
  void initState() {
    ctrlTxtName = new TextEditingController();
    ctrlTxtPasswd = new TextEditingController();
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var deviceSize = MediaQuery.of(context).size;

    return  Material(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: ctrlTxtName,
              decoration: new InputDecoration(
                labelText: 'User Name',
              ),
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: ctrlTxtPasswd,
              decoration: new InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: RaisedButton(
                      onPressed: () {
                        saveName();
                      },
                      child: Text('Save'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),

                  ),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }

  Future<bool> saveNamePreference(String name, String passwd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('password', passwd);
    return prefs.commit();
  }



  void saveName() {
    String name = ctrlTxtName.text;
    String passwd= ctrlTxtPasswd.text;
    saveNamePreference(name, passwd).then((bool committed) {
      Navigator.of(context).pop();
    });
  }
}