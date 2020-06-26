import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class UniversityView extends StatefulWidget {
  //final String title;
  //WebView({Key key, this.title}) : super(key: key);

  @override
  _UniversityViewState createState() => _UniversityViewState();
}

class _UniversityViewState extends State<UniversityView> {
  int _selectedIndex = 0;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Navigation'),
        ),
        body: WebView(
            initialUrl: "https://www.google.com",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }
        ),

        
        
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
 
              //Couldnt show the image of university icon dunno why???
              //child: Image.asset('assets/images/Image1.png'),

              child: Image.asset('assets/images/web_icon.png'),

              onPressed: () {
                controller.data.loadUrl("http://usms.ac.ma");
              },
            );
          }
        },
      ),

    );
  }
}
