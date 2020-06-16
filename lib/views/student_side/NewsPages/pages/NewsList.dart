import 'package:flutter/material.dart';
import 'package:fpbm/views/student_side/NewsPages/models/NewsArticle.dart';
import 'package:fpbm/views/student_side/NewsPages/services/WebServices.dart';

import 'NewsDetails.dart';

class News extends StatelessWidget {
  final WebsService httpService = WebsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les Actualités"),
      ),
      body: FutureBuilder(
        future: httpService.getArticls(),
        builder: (BuildContext context, AsyncSnapshot<List<Articls>> snapshot) {
          if (snapshot.hasData) {
            List<Articls> news = snapshot.data;

            return ListView(
                children: news
                    .map((Articls article) => GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PostDetail(
                                        article: article,
                                      ))),
                          child: Card(
                            elevation: 1.0,
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  height: 100.0,
                                  child: Image.network(
                                      //testing images via newtwork
                                      "https://picsum.photos/536/354"),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 20.0, bottom: 10.0),
                                              child: Text(
                                                article.title,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        child: Text(
                                          'Publié' + ' :' + article.publishedAt,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
