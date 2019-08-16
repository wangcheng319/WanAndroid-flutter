import 'package:flutter/material.dart';

class EventDemoPage extends StatefulWidget {
  @override
  _EventDemoPageState createState() => _EventDemoPageState();
}

class _EventDemoPageState extends State<EventDemoPage> {
  String _event = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventDemo"),
        centerTitle: true,
      ),
      body: Center(
        child: Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            height: 300,
            width: 300,
            child: Text(_event),
          ),
          onPointerDown: (PointerDownEvent event) {
            setState(() {
              _event = event.toString();
            });
            print(event.toString());
          },
          onPointerMove: (PointerMoveEvent event) {
            setState(() {
              _event = event.toString();
            });
            print(event.toString());
          },
          onPointerUp: (PointerUpEvent event) {
            setState(() {
              _event = event.toString();
            });
            print(event.toString());
          },
        ),
      ),
    );
  }
}
