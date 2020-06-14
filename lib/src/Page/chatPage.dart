import 'dart:convert';

import 'package:ccrmobile/src/Helper/c_c_r_icons_icons.dart';
import 'package:ccrmobile/src/Model/message.dart';
import 'package:ccrmobile/src/Page/phonePage.dart';
import 'package:ccrmobile/src/Page/underConstruction.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bubble/bubble.dart';
import 'package:http/http.dart' as http;


import 'mainPageRefactor.dart';
import 'mapPage.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

BubbleStyle styleSomebody = BubbleStyle(
  nip: BubbleNip.leftTop,
  color: Colors.white,
  elevation: 5,
  margin: BubbleEdges.only(top: 8.0, right: 50.0),
  alignment: Alignment.topLeft,
);
BubbleStyle styleMe = BubbleStyle(
  nip: BubbleNip.rightTop,
  color: Color.fromARGB(255, 225, 255, 199),
  elevation: 5,
  margin: BubbleEdges.only(top: 8.0, left: 50.0),
  alignment: Alignment.topRight,
);

final List<Message> feedData = [];


class _ChatPageState extends State<ChatPage> {

  final myController = TextEditingController();

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'CCR',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Driver',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _appBar() {
    return AppBar(
        title: _title(),
        backgroundColor: Color(0xffF1543F),
        primary: true,
        );
  }

  Widget _iconButton(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, size: 20,),
        Text(text, style: TextStyle(
            fontSize: 14
        ),),
      ],
    );
  }

  Widget _botttomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(thickness: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ButtonTheme(
                minWidth: 10,
                child: FlatButton(
                  child: _iconButton(CCRIcons.alerts, 'Alertas'),
                  onPressed: () {
                    openPhone();
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 10,
                child: FlatButton(
                  child: _iconButton(CCRIcons.pin, 'Mapa'),
                  onPressed: () {
                    openMap();
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 10,
                child: FlatButton(
                  child: _iconButton(CCRIcons.home, 'Home'),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 10,
                child: FlatButton(
                  child: _iconButton(CCRIcons.user, 'Perfil'),
                  onPressed: () {
                    openConstruction();
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 10,
                child: FlatButton(
                  child: _iconButton(CCRIcons.chat_black, 'Chat'),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildMessage(Message message) {
    bool isMe = !message.response;
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Color(0xfff69486) : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        Divider()
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight:  Radius.circular(30.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: myController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Digite sua mensagem...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Color(0xfff69486),
            onPressed: () {
              sendMessage(myController.text);
            },
          ),
        ],
      ),
    );
  }

  void sendMessage(String message) {
    if (message.isEmpty) return;

    setState(() {
      feedData.insert(0, Message(time: actualTime(), text: message, response: false));
      myController.clear();
    });

    http.post(
      'http://34.71.80.221:8080/webchat',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": "994255834", "message": "$message"
      }),
    ).then((value) {
      print(value.body);
      var response = json.decode(value.body);
      String responseMessage = response['reply'];

      setState(() {
        feedData.insert(0, Message(time: actualTime(), text: responseMessage.replaceAll('<br>', ''), response: true));
      });
    });
  }

  String actualTime() {
    DateTime dateTime = new DateTime.now();
    String time = '${dateTime.hour}:${dateTime.minute}';
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
//            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: feedData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildMessage(feedData[index]);
                      },
                    ),
                  ),
                ),
              ),
//            _buildCardTable(),
              _buildMessageComposer()
            ],
          ),
        ),
      ),
      bottomNavigationBar: _botttomAppBar(),
    );
  }

  void openMap() {
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currloc;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MapPage(
                      latLng: LatLng(currloc.latitude, currloc.longitude),
                    )));
      });
    });
  }

  void openPhone() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhonePage(),
        ));
  }

  void openConstruction() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConstructionPage(),
        ));
  }
}
