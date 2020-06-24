import 'package:flutter/material.dart';
import 'package:fpbm/models/Event.dart';
import 'package:fpbm/services/EventService.dart';
import 'package:fpbm/views/menu/menu.dart';

class EventPage extends StatelessWidget {

  final EventService eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.blue,
          
          title: Text(
            "Evénements",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: Menu(),
        body: Container(
          /*decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background_lines.png"),
                fit: BoxFit.cover,
              )
          ),*/
          child: FutureBuilder(
            future: eventService.getEvents(),
            builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
              if (snapshot.hasData) {
                List<Event> events = snapshot.data;
                return ListView(
                  children: events
                      .map(
                        (Event event) => ListTile(
                      title: Text(event.title),
                      subtitle: Text("${event.description}"),
                      onTap: (){}
                    ),
                  )
                      .toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
    );
  }
}

