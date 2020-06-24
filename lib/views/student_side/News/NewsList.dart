import 'package:flutter/cupertino.dart';
import 'package:fpbm/models/NewsArticle.dart';
import 'package:fpbm/services/NewsService.dart';
import 'package:fpbm/views/menu/menu.dart';
import 'package:fpbm/widgets/my_header.dart';
import 'package:flutter/material.dart';
import '../../../helpers/colorAndTextStyle.dart';
import 'NewsDetails.dart';
//import 'enventDetails.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsPage> {
  final controller = ScrollController();
  final NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          
          title: Text(
            "Actualités",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: Menu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyHeader(
            text: "Les Actualités",
          ),
          FutureBuilder(
            future: newsService.getArticls(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Articls>> snapshot) {
              if (snapshot.hasData) {
                List<Articls> news = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          newsCard(article: news[index], context: context),
                          Positioned(
                            top: 10,
                            child: evenImgae(news[index].image),
                          ),
                        ]);
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget newsCard({Articls article, BuildContext context}) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(12, 13),
              blurRadius: 16,
              color: kShadowColor,
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black26,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          article.title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Année ${article.scholarYear}",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          article.description.substring(0, 30) + '...',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Text(article.publishedAt,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleViewDetails(
                      theArticle: article,
                      articleName: article.title,
                    )));
      },
    );
  }

  Widget evenImgae(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      /*decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              //edited by yassine cuz we don't have images locally in web app
              //down below original code
              *//*image: NetworkImage(imageUrl ??
                  "https://source.unsplash.com/user/erondu/100x100"),*//*
              image: NetworkImage("https://source.unsplash.com/user/erondu/100x100"),
              fit: BoxFit.cover)),*/
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Image.network(
          /*theEvent.image,*/
          "https://source.unsplash.com/user/erondu/100x100",
          fit: BoxFit.cover,
          loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ?
                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
