import 'package:flutter/material.dart';
import 'package:fpbm/views/menu/menu.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPage createState() => _WebPage();
}

class _WebPage extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          backgroundColor: Colors.blue,
          
          title: Text(
            "Web",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Web Page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}