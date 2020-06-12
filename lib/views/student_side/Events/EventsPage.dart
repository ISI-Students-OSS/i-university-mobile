import 'package:flutter/cupertino.dart';
import 'package:fpbm/models/Event.dart';
import 'package:fpbm/services/EventService.dart';
import 'package:fpbm/widgets/my_header.dart';
import 'package:flutter/material.dart';
import '../../../helpers/colorAndTextStyle.dart';
import 'enventDetails.dart';

class EventPage extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventPage> {
  final controller = ScrollController();
  final EventService eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyHeader(
            text: "les événements",
          ),
          FutureBuilder(
            future: eventService.getEvents(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
              if (snapshot.hasData) {
                List<Event> events = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          eventCard(event: events[index], context: context),
                          Positioned(
                            top: 10,
                            child: evenImgae(events[index].image),
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

  Widget eventCard({Event event, BuildContext context}) {
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
                          event.title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Durée ${event.duration}",
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
                      Text(
                        event.description.substring(0, 30) + '...',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'commencer le ' + event.start_at.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                builder: (context) => EventViewDetails(
                      theEvent: event,
                      eventName: event.title,
                    )));
      },
    );
  }

  Widget evenImgae(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ??
                  "https://source.unsplash.com/user/erondu/100x100"),
              fit: BoxFit.cover)),
    );
  }
}

