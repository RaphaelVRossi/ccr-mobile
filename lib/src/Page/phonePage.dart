import 'package:ccrmobile/src/Helper/c_c_r_icons_icons.dart';
import 'package:ccrmobile/src/Page/underConstruction.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chatPage.dart';
import 'mainPageRefactor.dart';
import 'mapPage.dart';

class PhonePage extends StatefulWidget {
  PhonePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PhonePageState createState() => _PhonePageState();
}

final feedData = [
  {'title': '190', 'subtitle': 'Policia Militar', 'number': 'tel://190'},
  {
    'title': '191',
    'subtitle': 'Polícia Rodoviária Federal',
    'number': 'tel://191'
  },
  {'title': '192', 'subtitle': 'SAMU', 'number': 'tel://192'},
  {
    'title': '180',
    'subtitle': 'Central de Atendimento à Mulher',
    'number': 'tel://180'
  },
  {'title': '193', 'subtitle': 'Bombeiros', 'number': 'tel://193'},
];

class _PhonePageState extends State<PhonePage> {
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
                  child: _iconButton(CCRIcons.alerts_black, 'Alertas'),
                  onPressed: () {
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
                  child: _iconButton(CCRIcons.chat, 'Chat'),
                  onPressed: () {
                    openChat();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardTable() {
    return ListView.builder(
// scrollDirection: Axis.horizontal,
        itemCount: feedData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text(feedData[index]['title']),
                      subtitle: Text(feedData[index]['subtitle']),
                      onTap: () {
                        _launch(feedData[index]['number']);
                      })
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            ),
        child: _buildCardTable(),
      ),
      bottomNavigationBar: _botttomAppBar(),
    );
  }

  void openMap() {
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MapPage(
                      latLng: LatLng(currloc.latitude, currloc.longitude),
                    )));
      });
    });
  }

  void openChat() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(),
        ));
  }

  void openConstruction() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConstructionPage(),
        ));
  }

  Future<void> _launch(String url) async {
    await launch(url);
  }
}
