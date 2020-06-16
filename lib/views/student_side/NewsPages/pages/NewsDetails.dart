import 'package:flutter/material.dart';
import 'package:fpbm/views/student_side/NewsPages/models/NewsArticle.dart';

class PostDetail extends StatelessWidget {

  final Articls article;

  PostDetail({@required this.article});

  @override

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text(article.title)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, article),
        )
    );
  }

  List<Widget> _renderBody(BuildContext context, Articls article){
    var result = List<Widget>();
    result.add(_bannerImage("https://picsum.photos/536/354", 170.0));
    result.addAll(_renderInfo(context, article));
    return result;
  }

  List<Widget> _renderInfo(BuildContext context, Articls articls){
    var result = List<Widget>();
    result.add(_sectionTitle(article.title));
    result.add(_sectionText(article.description));
    result.add(_section_pub_year('Publié:'''+ article.publishedAt));
    result.add(_section_pub_year('Année Scolaire :'''+ article.scholarYear));
    return result;
  }

  Widget _sectionTitle(String text){
    return Container(
        padding: EdgeInsets.fromLTRB(25.0,25.0,25.0,10.0),
        child: Text(text,
            textAlign: TextAlign.left,style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),
            ));
  }

  Widget _section_pub_year(String text){
    return Container(
        padding: EdgeInsets.fromLTRB(25.0,25.0,25.0,10.0),
        child: Text(text,
          textAlign: TextAlign.left,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w200),
        ));
  }

  Widget _sectionText(String text){
    return Container(
        padding: EdgeInsets.fromLTRB(25.0,15.0,25.0,15.0),
        child:Text(text,style: TextStyle(fontSize: 15.0),)
    );
  }

  //working with image via network until we fix problem with image_api
  Widget _bannerImage(String url, double height){
    return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network("https://picsum.photos/536/354", fit: BoxFit.fitWidth)
    );
  }










}