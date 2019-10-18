
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SharePage extends StatefulWidget {
  SharePage({this.strName, this.strPasswd});

  final String strName;
  final String strPasswd;

  @override
  _SharePageState createState() => _SharePageState();
  
}

class _SharePageState extends State<SharePage> {
 
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = 'Google';

  void loadData() {
    listDrop = [];
    listDrop.add(
      new DropdownMenuItem(child: new Text('Google'), value: 'Google',)
    );
    listDrop.add(
      new DropdownMenuItem(child: new Text('Yahoo'), value: 'Yahoo',)
    );
  }
  @override
  void initState() {
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadData();

    var deviceSize = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Share photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Name:' + widget.strName,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Password:' + widget.strPasswd,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: new DropdownButton(
                  value: selected,
                  items: listDrop, 
                  onChanged: (value) {
                    selected = value;
                    setState(() {
                      selected = value;
                    });
                  },
                ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: RaisedButton(
                onPressed: () {
                  getHttp(selected);
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getHttp(String siteName) async {
    String str = '';
    if (siteName == 'Google') {
      str= "http://www.google.com";
    }
    else if (siteName == 'Yahoo') {
      str= "http://www.yahoo.com";
    }
    try {
      final response = await Dio().get(str);
      print(response);
    } catch (e) {
      print(e);
    }
  }
  

}
