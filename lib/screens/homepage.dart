import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Upper Banner
  final carousel = Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/images/1.jpg'),
        AssetImage('assets/images/2.jpg'),
        AssetImage('assets/images/3.jpg'),
        AssetImage('assets/images/4.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 2000));

// Banner Text
  final banner = Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
    child: new Container(
        decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0))),
        padding: EdgeInsets.all(10.0),
        child: new Text(
          "Premium Gifts",
          style: new TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
        )),
  );

// Product Listing

  List<Container> daftarSuperhero = new List();

  var karakter = [
    {"nama": "Ipnone 5", "gambar": "iphone1.jpg"},
    {"nama": "Iphone 5s", "gambar": "iphone2.jpg"},
    {"nama": "Iphone 7", "gambar": "iphone3.jpg"},
    {"nama": "Iphone 8", "gambar": "iphone4.jpg"},
    {"nama": "Iphone X", "gambar": "iphone5.png"},
    {"nama": "Ipnone 5", "gambar": "iphone1.jpg"},
    {"nama": "Iphone 5s", "gambar": "iphone2.jpg"},
    {"nama": "Iphone 7", "gambar": "iphone3.jpg"},
    {"nama": "Iphone 8", "gambar": "iphone4.jpg"},
    {"nama": "Iphone X", "gambar": "iphone5.png"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarSuperhero.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new Image.asset(
                "assets/products/$gambar",
                fit: BoxFit.cover,
                height: 100.0,
              ),
              new Text(
                karakternya['nama'],
                style: new TextStyle(fontSize: 20.0),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    super.initState();
    _buatlist();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new Container(
              child: new Stack(
                children: <Widget>[carousel, banner],
              ),
            ),
            flex: 1,
          ),
          new Expanded(
            child: new GridView.count(
              primary: true,
              crossAxisCount: 2,
              children: daftarSuperhero,
            ),
            flex: 3,
          )
        ],
      ),
    );
  }
}
