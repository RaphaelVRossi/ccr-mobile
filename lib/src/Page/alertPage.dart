import 'package:ccrmobile/src/Page/phonePage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chatPage.dart';
import 'mapPage.dart';

class AlertPage extends StatefulWidget {
  AlertPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AlertPageState createState() => _AlertPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

final feedData = [
  {
    'data': '12/06/2020',
    'link':
        'http://ri.ccr.com.br/noticia/fato-relevante-conclusao-do-processo-de-sucessao-do-ceo/',
    'titulo': 'Fato Relevante - Conclusão do processo de sucessão do CEO'
  },
  {
    'data': '12/06/2020',
    'link':
        'http://ri.ccr.com.br/noticia/comunicado-ao-mercado-informacoes-sobre-a-movimentacao-nas-concessoes-sob-gestao-da-companhia-12/',
    'titulo':
        'Comunicado ao Mercado – Informações sobre a movimentação nas concessões sob gestão da companhia'
  },
  {
    'data': '12/06/2020',
    'link':
        'http://ri.ccr.com.br/noticia/fato-relevante-conclusao-do-processo-de-sucessao-do-ceo/',
    'titulo': 'Fato Relevante - Conclusão do processo de sucessão do CEO'
  },
  {
    'data': '12/06/2020',
    'link':
        'http://ri.ccr.com.br/noticia/fato-relevante-conclusao-do-processo-de-sucessao-do-ceo/',
    'titulo': 'Fato Relevante - Conclusão do processo de sucessão do CEO'
  },
  {
    'data': '12/06/2020',
    'link':
        'http://ri.ccr.com.br/noticia/fato-relevante-conclusao-do-processo-de-sucessao-do-ceo/',
    'titulo': 'Fato Relevante - Conclusão do processo de sucessão do CEO'
  },
  {
    'data': '12/06/2020',
    'link':
        'http://ri.ccr.com.br/noticia/fato-relevante-conclusao-do-processo-de-sucessao-do-ceo/',
    'titulo': 'Fato Relevante - Conclusão do processo de sucessão do CEO'
  },
  {
    'data': '12/06/2020',
    'link':
        'http://ri.ccr.com.br/noticia/fato-relevante-conclusao-do-processo-de-sucessao-do-ceo/',
    'titulo': 'Fato Relevante - Conclusão do processo de sucessão do CEO'
  }
];

class _AlertPageState extends State<AlertPage> {
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
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Icon(Icons.menu),
        ));
  }

  Widget _drawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
            Text(
              'Olá usuário!',
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  color: Color(0xffe46b10),
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Ranking 1 - 1200 pontos',
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  color: Color(0xffe46b10),
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      child: _iconButton(Icons.map, 'Mapa'),
                      onPressed: () {
                        openMap();
                      },
                    ),
                    FlatButton(
                      child: _iconButton(Icons.priority_high, 'Denuncia'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: _iconButton(Icons.phone, 'Telefones uteis'),
                      onPressed: () {
                        openPhone();
                      },
                    ),
                    FlatButton(
                      child: _iconButton(Icons.monetization_on, 'Pontuação'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: _iconButton(Icons.build, 'Manutenção'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: _iconButton(Icons.place, 'Lugares recomendados'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: _iconButton(Icons.settings, 'Configurações'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: _iconButton(Icons.chat, 'Chat'),
                      onPressed: () {
                        openChat();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        Text(text),
      ],
    );
  }

  Widget _botttomAppBar() {
    return BottomAppBar(
      color: Color(0xffe46b10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              openMap();
            },
          ),
          IconButton(
            icon: Icon(Icons.priority_high),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              openPhone();
            },
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
                    title: Text(feedData[index]['titulo']),
                    subtitle: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.link),
                          Text('Visualizar'),
                        ],
                      ),
                      onPressed: () {
                        _launchInWebViewOrVC(feedData[index]['link']);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: _drawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffF1543F), Color(0xffD10C0C)])),
        child: _buildCardTable(),
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

  void openChat() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(),
        ));
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
    );
  }
}
