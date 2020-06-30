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
          title: Text('FP Béni Mellal'),
        ),
        //By deefault we load faculter website !! then the floating button shown above will redirect to university website
        body: WebView(
            initialUrl: "http://www.fpbm.ma/",
            //javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }
        ),

      //This Floating button redirect to university official website 
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        // ignore: missing_return
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            // ignore: missing_return, missing_return
            return FloatingActionButton(
 
              //Couldnt show the image of university icon dunno why???
              //child: Image.asset('assets/images/logo.png'),

              child: Image.asset('assets/images/logo.png'),

              // ignore: missing_return
              onPressed: () {
                controller.data.loadUrl("http://www.fpbm.ma/new/");
                //controller.data.reload();
              },
            );
          }
        },
      ),

    );
  }
}
