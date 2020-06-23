import 'package:flutter/material.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPage createState() => _WebPage();
}

class _WebPage extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web App'),
      ),
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