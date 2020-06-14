import 'package:ccrmobile/src/Helper/c_c_r_icons_icons.dart';
import 'package:ccrmobile/src/Page/phonePage.dart';
import 'package:ccrmobile/src/Page/underConstruction.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'chatPage.dart';
import 'mapPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

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

class _MainPageState extends State<MainPage> {
  Widget _title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Oi, Stenio!',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'conheça nossos parceiros!',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))),
      ],
    );
  }

  Widget _partners() {
    var images = [
      {'name': 'Grupo CCR', 'image': 'assets/ccr.jpg'},
      {'name': 'Posto Ipiranga', 'image': 'assets/ipiranga.jpg'},
      {'name': 'Graal', 'image': 'assets/graal.jpg'}
    ];

    List<Widget> imageSliders = images
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image(image: AssetImage(item['image'])),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '${item['name']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Container(
        child: Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          ),
          items: imageSliders,
        ),
      ],
    ));
  }

  Widget _where() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Pra onde você vai agora?',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.search),
                      hintText: 'De:',
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true)),
              SizedBox(
                height: 5,
              ),
              TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.place),
                      suffixIcon: Icon(Icons.search),
                      hintText: 'De:',
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true)),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xffF1543F), Color(0xffD10C0C)])),
                  child: Text(
                    'GERAR UMA ROTA',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _delivery() {
    TextStyle poppins = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 14,
      color: Colors.black,
    );

    TextStyle poppinsBold = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    Widget _iconDelivery(IconData iconData, String text) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Icon(iconData, size: 20),
            SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      );
    }

    var delivery = [
      {
        'from': 'Florianópolis',
        'to': 'São Paulo',
        'km': '783,9',
        'time': '10:29',
        'gas': '50',
        'price': '150.0'
      },
      {
        'from': 'Florianópolis',
        'to': 'São Paulo',
        'km': '783,9',
        'time': '10:29',
        'gas': '50',
        'price': '150.0'
      },
      {
        'from': 'Florianópolis',
        'to': 'São Paulo',
        'km': '783,9',
        'time': '10:29',
        'gas': '50',
        'price': '150.0'
      }
    ];

    List<Widget> imageSliders = delivery
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Divider(
                                color: Color(0xff4ADD70),
                                thickness: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                            text: 'de: ',
                                            style: poppins,
                                            children: [
                                              TextSpan(
                                                  text: item['from'],
                                                  style: poppinsBold)
                                            ])),
                                    RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                            text: 'para: ',
                                            style: poppins,
                                            children: [
                                              TextSpan(
                                                  text: item['to'],
                                                  style: poppinsBold)
                                            ])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        _iconDelivery(CCRIcons.placeholder,
                                            "${item['km']}KM"),
                                        _iconDelivery(CCRIcons.speed,
                                            "${item['time']}Min"),
                                        _iconDelivery(CCRIcons.delivery,
                                            "${item['gas']}L"),
                                        _iconDelivery(CCRIcons.money_bag,
                                            "R\$${item['price']}"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                text: 'Últimas Entregas',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))),
        SizedBox(
          height: 5,
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          ),
          items: imageSliders,
        ),
      ],
    ));
  }

  Widget _actions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Gerencie seu negócio',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xff52BCCE),
                      ),
                      child: Column(
                        children: [
                          Icon(CCRIcons.delivery),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Meu Veículo',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xffF266F2),
                      ),
                      child: Column(
                        children: [
                          Icon(CCRIcons.placeholder),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Viagens',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xff4ADD70),
                      ),
                      child: Column(
                        children: [
                          Icon(CCRIcons.statistics),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Relatórios',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xffF1543F),
                      ),
                      child: Column(
                        children: [
                          Icon(CCRIcons.money_bag),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Despesas',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xffFCC62D),
                      ),
                      child: Column(
                        children: [
                          Icon(CCRIcons.home),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Locais',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xff7567FF),
                      ),
                      child: Column(
                        children: [
                          Icon(CCRIcons.heartbeat),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Saúde',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _remember() {
    TextStyle poppins = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 14,
      color: Colors.black,
    );

    TextStyle poppinsBold = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );

    Widget _iconDelivery(IconData iconData, String text) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Icon(iconData, size: 20),
            SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      );
    }

    var remember = [
      {
        'date': '24.06.2020',
        'title': 'Parcela Finaciamento (7/48)',
        'subtitle': 'lorem ipsum',
        'type': 'finanças',
        'color': 0xff4ADD70
      },
      {
        'date': '27.07.2020',
        'title': 'Troca de Pneus',
        'subtitle': 'lorem ipsum',
        'type': 'manutenção',
        'color': 0xffF1543F
      },
      {
        'date': '19.08.2020',
        'title': 'Exame toxicológico',
        'subtitle': 'lorem ipsum',
        'type': 'saúde',
        'color': 0xff52BCCE
      },
    ];

    List<Widget> imageSliders = remember
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 SizedBox(width: 5, height: 100, child: Container(color: Color(item['color']),),),
//                             SizedBox(width: 5,),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     SizedBox(height: 5,),
                                     RichText(
                                         textAlign: TextAlign.left,
                                         text: TextSpan(
                                             text: item['date'],
                                             style:  poppinsBold,
                                             )),
                                     RichText(
                                         textAlign: TextAlign.left,
                                         text: TextSpan(
                                           text: item['title'],
                                           style:  poppinsBold,
                                         )),
                                     RichText(
                                         textAlign: TextAlign.start,
                                         text: TextSpan(
                                           text: item['subtitle'],
                                           style:  poppins,
                                         )),
                                   ],
                                 ),

                               ],

                              ),
                              RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                    text: "${item['type']} ",
                                    style:  GoogleFonts.poppins(
                                      textStyle: Theme.of(context).textTheme.headline4,
                                      fontSize: 14,
                                      color: Color(item['color']),
                                    ),
                                  )),
                            ],
                          )
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Column(
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Lembretes',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ))),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: imageSliders,
        ),
      ],
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
                  child: _iconButton(CCRIcons.home_black, 'Home'),
                  onPressed: () {
                    Navigator.pop(context);
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

  Widget _buildMenu() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          SizedBox(
            height: 10,
          ),
          _partners(),
          SizedBox(
            height: 15,
          ),
          _where(),
          SizedBox(
            height: 15,
          ),
          _delivery(),
          SizedBox(
            height: 15,
          ),
          _actions(),
          SizedBox(
            height: 15,
          ),
          _remember()
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        child: _buildMenu(),
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

  void openConstruction() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConstructionPage(),
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
