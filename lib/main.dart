import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inmotion/utils/colors.dart';
import 'package:inmotion/utils/routes.dart';
import 'package:inmotion/views/firstview/get_started.dart';
import 'package:inmotion/views/main/feed.dart';
import 'package:inmotion/views/main/profile.dart';
import 'package:inmotion/views/main/progress.dart';
import 'package:inmotion/views/main/train.dart';
import 'package:inmotion/views/main/video_feed.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp()
  //     .whenComplete(() => print('Firebase is initilized'))
  //     .catchError((e) => print('ERROR RUN: $e'));
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   if (kReleaseMode) exit(1);
  // };

  runApp(const MyApp());
}

void exit(int i) {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rise',
        // routes: MyRoutes.define(),
        // initialRoute: '/',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: GetStarted());
  }
}

class Main extends StatefulWidget {
  const Main({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

List<bool> _isSelected = [false, false, false];

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Feed(),
    const VideoFeed(),
    const Train(),
    const Progress(),
    const Profile()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: const <Widget>[
          ImageIcon(
            AssetImage('assets/icon_home.png'),
          ),
          ImageIcon(AssetImage('assets/icon_video.png')),
          ImageIcon(
            AssetImage('assets/icon_ball.png'),
          ),
          ImageIcon(AssetImage('assets/icon_cognitive.png')),
          ImageIcon(
            AssetImage('assets/icon_profile.png'),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: primaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
