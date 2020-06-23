import 'package:flutter/material.dart';

class PresedentPage extends StatefulWidget {
  @override
  _PresedentPage createState() => _PresedentPage();
}

class _PresedentPage extends State<PresedentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presedent App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Mot De Presedent Page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}