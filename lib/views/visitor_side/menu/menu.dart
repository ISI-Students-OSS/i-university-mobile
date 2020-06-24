import 'package:flutter/material.dart';
import 'package:fpbm/views/visitor_side/About/AboutPage.dart';
import 'package:fpbm/views/visitor_side/Events/EventsPage.dart';
import 'package:fpbm/views/visitor_side/HomePage.dart';
import 'package:fpbm/views/visitor_side/News/NewsList.dart';
import 'package:fpbm/views/visitor_side/Pw/PwPage.dart';

class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child:Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(6),
              color: Colors.white,
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
                          image: AssetImage('assets/images/fpbm.png'),
                          fit: BoxFit.fill,
                        ),
                        ),
                    ), 
                    Text("Faculté Polydisciplinaire Beni Mellal",
                    style: TextStyle(
                      
                      fontSize: 15,
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
              title: Text('Accueil'),
              dense:true,
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('Actualités'),
              dense:true,
              onTap: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsPage()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('FPBM en Bref'),
              dense:true,
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        AboutPage()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Mot du président'),
              dense:true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MotDuPresident()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Evènements FPBM'),
              dense:true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        EventPage()
                  ),
                );
              },
            ),
            ListTile(

              title: Text('Communiquer', style: TextStyle(color: Colors.lightBlue[800], fontSize: 15, fontWeight: FontWeight.bold)),
              dense:true,
            ),
            ListTile(
              leading: Icon(Icons.laptop),
              title: Text('Web'),
              dense:true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        EventPage()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text('FPBM Facebook'),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Authentification'),
              dense:true,
              onTap: () {
               },
            ),
            
          ],
        )
      );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /* Drawer(

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
      );*/
   /*return Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Align( alignment: Alignment.bottomCenter, child: Text('La Faculté Polydisciplinaire de Béni Mellal', 
                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold ))) 
              ),
              decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage("https://cdn-06.9rayti.com/rsrc/cache/widen_292/uploads/2016/01/logoFP2.png"),
                          fit: BoxFit.fill,
                        ),
                        ),
             padding:  const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil', style: TextStyle(color: Colors.black, fontSize: 15,)),
              dense:true,
              onTap: () {
                
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('Actualités'),
              dense:true,
              onTap: () {
                
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('FPBM en Bref'),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Mot du président'),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Evènements FPBM'),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(

              title: Text('Communiquer', style: TextStyle(color: Colors.lightBlue[800], fontSize: 15, fontWeight: FontWeight.bold)),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.laptop),
              title: Text('Web'),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text('FPBM Facebook'),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Authentification'),
              dense:true,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );*/
  }
}