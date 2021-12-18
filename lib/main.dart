import 'package:boz_yap_sifirla/screen/OtherPage.dart';
import 'package:boz_yap_sifirla/screen/StreamPage.dart';
import 'package:boz_yap_sifirla/widgets/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'screen/floating_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boz_yap_sifirla/widgets/sabitler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Firebase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentTab = 0;
  Widget _currentPage = StreamPage();
  @override
  Widget build(BuildContext context) {
    var hh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '<h1>Firebase  Deneme</h1>',
            style: GoogleFonts.specialElite(fontSize: 24),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.blue])),
          ),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          height: Get.height / 12,
          gapLocation: GapLocation.center,
          icons: [Icons.show_chart, Icons.history],
          activeIndex: _currentTab,
          onTap: (int) {
            setState(() {
              _currentTab = int;
              _currentPage = (int == 0) ? StreamPage() : OtherPage();
            });
          },
        ),
        body: _currentPage,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xfff22577E),
            onPressed: () {
              Get.to(FloatingScreen());
            },
            tooltip: 'Increment',
            child: Icon(
              Icons.search_outlined,
            )),
      ),
    );
  }
}
//ListTile(
                 //     title: Text(map['title']),
              //        leading: Image.network(map['img']),
             //       );//