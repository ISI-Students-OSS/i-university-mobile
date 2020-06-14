import 'package:flutter/material.dart';
import 'package:fpbm/main.dart';
import 'AboutPage.dart';
import 'EventsPage.dart';
import 'PwPage.dart';
import 'WebPage.dart';
import 'NewsPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>  {  
  
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Icon(Icons.menu),
          title: Text(
            "Accueil",
            textAlign: TextAlign.center,
          ),
        ),
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
                    createGridItem(0,"Actualités",'assets/images/news_icon.png'),
                    createGridItem(1,"Evénements",'assets/images/event_icon.png'),
                    createGridItem(2,"FPBM en bref",'assets/images/university_icon.png'),
                    createGridItem(3,"Mot du président",'assets/images/president_word_icon.png'),
                    createGridItem(4,"FPBM facebook",'assets/images/facebook_icon.png'),
                    createGridItem(5,"Web",'assets/images/web_icon.png'),
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
                        position == 0 ? NewsPage() : position == 1 ? EventsPage() : position == 2 ? AboutPage() :
                        position == 3 ? PresedentPage() : position == 4 ? SecondPage(data: "Facebook page request") : position == 5 ? WebPage() :
                        SecondPage(data: "Request unavailable") ,
                  )
              );
            },
            child: Center(
              child: Column (
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Image.asset(imgPath,
                      height: 100,
                      fit:BoxFit.cover),
                  SizedBox(height: 10.0),
                  Container(
                        child: Text(title,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 18.0
                          ),
                        ),
                      ),
                    ],
                  )
              )
            ),
          ),
      );
    });
  }
}

