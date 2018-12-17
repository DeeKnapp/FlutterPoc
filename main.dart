import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_app_poc/utils/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image;
import 'package:zoomable_image/zoomable_image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
    this.color: Colors.blueAccent,
    this.child,
  }) : super(key: key);

  final Color color;

  final Widget child;

  static const IconData time_to_leave =
      IconData(0xe62c, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Constants.SPLASH_IMAGE,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//
//  String signInStatus = 'Unauthorized User';
//  String clickData = "";
//
//  double tempXCoord = 126.242;
//  double tempYCoord = 511.029 / 2;
//
//  double tempOffset = 15;
//
////  double tempXCoord = 227.514;
////  double tempYCoord = 434.756 / 2;
////
////  double tempOffset = 20;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
//      body: new Container(
//        child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Container(
//              margin: EdgeInsets.only(bottom: 50),
//              child: new Column(
//                children: <Widget>[
//                  new RaisedButton(
//                    child: const Text('Login with Google'),
//                    color: Theme.of(context).accentColor,
//                    elevation: 4.0,
//                    splashColor: Colors.blueGrey,
//                    onPressed: () => loginWithGoogleAccount(),
//                  ),
//                  new Text(signInStatus),
//                  new Text(clickData),
//                ],
//              ),
//            ),
////            new Container(
////              margin: const EdgeInsets.all(16.0),
////              child: new GestureDetector(
////                onTapDown: (TapDownDetails details) => _onTapDown(details),
////                onTapUp: (TapUpDetails details) => _onTapUp(details),
////                child: Image.asset(
////                  Constants.FIRESTORE_TEST_FLOOR_PLAN_URL,
////                  fit: BoxFit.fill,
////                  height: MediaQuery.of(context).size.height / 2,
////                  width: MediaQuery.of(context).size.width,
////                ),
////              ),
////            ),
//
//            new Stack(
//              alignment: new Alignment(100, 100),
//              children: <Widget>[
//                new Positioned(
//                  child: Image.asset(
//                    Constants.FIRESTORE_TEST_FLOOR_PLAN_URL,
//                    fit: BoxFit.fill,
//                    height: MediaQuery.of(context).size.height / 2,
//                    width: MediaQuery.of(context).size.width,
//                  ),
//                ),
////                new Positioned(
////                  width: 20,
////                  left: (MediaQuery.of(context).size.width -
////                          (MediaQuery.of(context).size.width - tempXCoord)),
////                  top: (MediaQuery.of(context).size.height / 2 -
////                          (MediaQuery.of(context).size.height / 2 -
////                              tempYCoord)),
////                  height: 20,
////                  child: Image.asset(Constants.PIN_IMAGE_LOCATION),
////                ),
//                new Align(
//                  //this isn't good implementation with 2 method calls...
////                  alignment: new Alignment(getOffset().dx / 1000.0, getOffset().dy / 1000.0),
////                  alignment: new Alignment(-0.126242, -0.2555145),
////                  alignment: new Alignment(-0.126242, 0.7444855),
//                  alignment: new Alignment(100, 100),
//                  child: Image.asset(Constants.PIN_IMAGE_LOCATION),
//                ),
//              ],
//            )
//
////            new Container(
////              child: new ZoomableImage(
////                  new AssetImage(Constants.FIRESTORE_TEST_FLOOR_PLAN_URL),
////                  placeholder: const Center(child: const CircularProgressIndicator()),
////                  backgroundColor: Colors.red),
////            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Offset getOffset() {
//    double localDx;
//    double localDy;
//
//    print('width/2 = ' + (MediaQuery.of(context).size.width / 2).toString());
//    print('height/2 =  ' +
//        ((MediaQuery.of(context).size.height / 2) / 2).toString());
//
//    if ((MediaQuery.of(context).size.width / 2) > tempXCoord) {
//      localDx = -(tempXCoord);
//    } else {
//      localDx = tempXCoord;
//    }
//
//    if (((MediaQuery.of(context).size.height / 2) / 2) < tempYCoord) {
//      localDy = -(tempYCoord);
//    } else {
//      localDy = tempYCoord;
//    }
//    print('local Dx : $tempXCoord');
//    print('local Dy : $tempYCoord');
//
//    return new Offset(localDx / 1000, localDy);
//  }
//
//  void loginWithGoogleAccount() {
//    print('width: ' + MediaQuery.of(context).size.width.toString());
//    print('height: ' + (MediaQuery.of(context).size.height / 2).toString());
//    print(
//        'left: ' + (MediaQuery.of(context).size.width - tempXCoord).toString());
//    print('right: ' +
//        (MediaQuery.of(context).size.width -
//                (MediaQuery.of(context).size.width - tempXCoord))
//            .toString());
//    print(
//        'top: ' + (MediaQuery.of(context).size.height - tempYCoord).toString());
//    print('bottom: ' +
//        (MediaQuery.of(context).size.height -
//                (MediaQuery.of(context).size.height - tempYCoord))
//            .toString());
//    Future<FirebaseUser> _handleSignIn() async {
//      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//      FirebaseUser user = await _auth.signInWithGoogle(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );
//      print("signed in " + user.displayName);
//
//      return user;
//    }
//
//    _handleSignIn()
//        .then((FirebaseUser user) => signInSuccess(user))
//        .catchError((e) => print(e));
//  }
//
//  void loadTestData() {
//    Future<DocumentSnapshot> document = Firestore.instance
//        .collection(Constants.FIRESTORE_COLLECTION_KEY)
//        .document(Constants.FIRESTORE_TEST_DOCUMENT_KEY)
//        .get();
//
//    document.then(handleData).catchError(onError);
//  }
//
//  void handleData(DocumentSnapshot testDocument) {
//    clickData = testDocument.documentID;
//  }
//
//  void onError() {
//    print('An error has occured.');
//  }
//
//  void signInSuccess(FirebaseUser user) {
//    print('User\'s email : ' + user.email);
//    setState(() {
//      signInStatus = 'Authorized User : ${user.email}';
//    });
//    loadTestData();
//  }
//
//  _onTapDown(TapDownDetails details) {
//    var x = details.globalPosition.dx;
//    var y = details.globalPosition.dy;
//    print("tap down " + x.toString() + ", " + y.toString());
//  }
//
//  _onTapUp(TapUpDetails details) {
//    RenderBox box = context.findRenderObject();
//    Offset offset = box.globalToLocal(details.globalPosition);
//
//    print('local x : ${offset.dx}');
//    print('global x : ${details.globalPosition.dx}');
//    print('local y : ${offset.dy}');
//    print('global y : ${details.globalPosition.dy}');
//
//    var x = details.globalPosition.dx;
//    var y = details.globalPosition.dy;
//    setState(() {
//      clickData = "tap up " + x.toString() + ", " + y.toString();
//    });
//    print("tap up " + x.toString() + ", " + y.toString());
//  }
//}
