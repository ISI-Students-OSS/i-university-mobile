import 'package:flutter/material.dart';


class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return 
     Drawer(
        child:Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(6),
              color: Colors.lightBlueAccent,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                       margin: EdgeInsets.only(
                      top: 25,
                      bottom: 10),
                      width: 120,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage("https://cdn-06.9rayti.com/rsrc/cache/widen_292/uploads/2016/01/logoFP2.png"),
                          fit: BoxFit.fill,
                        ),
                        ),
                    ), 
                    Text("Faculté Polydisciplinaire Beni Mellal",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),
                    )
                   
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Acceuil"),
              selected: true,
              dense: true,

            ),
            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text("Actualités"),
                     dense: true,
                ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text("FPBM en Bref"),
              dense: true,
            ),
            ListTile(
              leading: Icon(Icons.speaker_notes),
              title: Text("Mot du président"),
              dense: true,
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text("Evénements FPBM"),
              dense: true,
            ),
            Divider(color: Colors.grey, 
            ),
            Text("Communiquer",
            textAlign: TextAlign.right,
            ),
            ListTile(
              leading: Icon(Icons.laptop),
              title: Text("Web"),
              dense: true,
              
            ),
             ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text("FPBM facebook"),
              dense: true,
            ),
             
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Authetification"),
              dense: true,
              
            ),
            
          ],
        )
      );
   
  }
}