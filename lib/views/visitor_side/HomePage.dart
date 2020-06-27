import 'package:flutter/material.dart';
import 'package:fpbm/main.dart';
import 'package:fpbm/views/visitor_side/About/AboutPage.dart';
import 'package:fpbm/views/visitor_side/Events/EventsPage.dart';
import 'package:fpbm/views/visitor_side/News/NewsList.dart';
import 'package:fpbm/views/visitor_side/Pw/PwPage.dart';
import 'package:fpbm/views/visitor_side/menu/menu.dart';
import 'UniversityView.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Accueil",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: Menu(),
        body: Stack(
          children: <Widget>[
            Container(
              child: CustomPaint(
                child: Container(
                  color: Color(0xFFEEEEEE),
                  height: size.height / 2,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              color: Color(0xFFEEEEEE),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    createGridItem(
                        0, "Actualités", 'assets/images/news_icon.png'),
                    createGridItem(
                        1, "Evénements", 'assets/images/event_icon.png'),
                    createGridItem(
                        2, "FPBM en bref", 'assets/images/university_icon.png'),
                    createGridItem(3, "Mot du président",
                        'assets/images/president_word_icon.png'),
                    createGridItem(
                        4, "FPBM facebook", 'assets/images/facebook_icon.png'),
                    createGridItem(5, "Web", 'assets/images/web_icon.png'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createGridItem(int position, String title, String imgPath) {
    return Builder(builder: (context) {
      return Padding(
        padding:
        const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
        child: Card(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  // With MaterialPageRoute, you can pass data between pages,
                  // but if you have a more complex app,   will quickly get lost.
                    MaterialPageRoute(
                      builder: (context) =>
                      //FirstPage()
                      //This is condition [Position] indicates wich page you want to navigate to
                      position == 0 ? NewsPage() :
                      position == 1 ? EventPage() :
                      position == 2 ? AboutPage() :
                      position == 3 ? MotDuPresident() :
                      position == 4 ? NavigateByUrl() :
                      position == 5 ? UniversityView() :
                      SecondPage(data: "Request unavailable"),
                    )
                );
              },
              child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Image.asset(imgPath, height: 100, fit: BoxFit.cover),
                      SizedBox(height: 10.0),
                      Container(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 17.0),
                        ),
                      ),
                    ],
                  ))),
        ),
      );
    });
  }
}

class NavigateByUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const url = 'https://www.facebook.com/fpbm.ma';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FP Facebook'),
      ),
      drawer: Menu(),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15.0,
              ),
              Divider(
                color: Colors.black,
                height: 15,
                thickness: 4,
                indent: 60,
                endIndent: 60,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Confirm redirect ?',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF616161),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "You're being redirected to an external URL, we're just making sure that you want to visit: ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 17,
                )
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                url,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  //Center Row contents horizontally,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        textColor: Colors.white,
                        color: Colors.grey,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        ),
                        child: new Text('Cancel'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }),
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: new Text(' Confirm'),
                      onPressed: _launchURL,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.facebook.com/fpbm.ma';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        enableDomStorage: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
