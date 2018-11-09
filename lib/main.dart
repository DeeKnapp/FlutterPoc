import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_app_poc/utils/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Flutter Room Finder : POC'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String signInStatus = 'Unauthorized User';
  String clickData = "";
  NodeWithSize rootNode;

  @override
  void initState() {
    super.initState();
    rootNode = new NodeWithSize(const Size(1024.0, 1024.0));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(bottom: 50),
              child: new Column(
                children: <Widget>[
                  new RaisedButton(
                    child: const Text('Login with Google'),
                    color: Theme
                        .of(context)
                        .accentColor,
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    onPressed: () => loginWithGoogleAccount(),
                  ),
                  new Text(signInStatus),
                  new Text(clickData),
                ],
              ),
            ),
//            new Container(
//              margin: const EdgeInsets.all(16.0),
//              child: new GestureDetector(
//                onTapDown: (TapDownDetails details) => _onTapDown(details),
//                onTapUp: (TapUpDetails details) => _onTapUp(details),
//                child: Image.network(
//                  Constants.FIRESTORE_TEST_FLOOR_PLAN_URL,
//                  fit: BoxFit.fill,
//                  height: MediaQuery
//                      .of(context)
//                      .size
//                      .height / 2,
//                  width: MediaßQuery
//                      .of(context)
//                      .size
//                      .width,
//                ),
//              ),
//            ),
            new SpriteWidget(rootNode),
          ],
        ),
      ),
    );
  }

  void loginWithGoogleAccount() {
    Future<FirebaseUser> _handleSignIn() async {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      FirebaseUser user = await _auth.signInWithGoogle(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print("signed in " + user.displayName);

//      Image image = Image.network(Constants.FIRESTORE_TEST_FLOOR_PLAN_URL);
      ImageMap images = new ImageMap(rootBundle);

      ui.Image image = await images.loadImage('assets/example_floor_plan.png');

      Sprite car = new Sprite.fromImage(image);

      return user;
    }

    _handleSignIn().then((FirebaseUser user) => signInSuccess(user))
        .catchError((e) => print(e));
  }

  void loadTestData() {
    Future<DocumentSnapshot> document = Firestore.instance
        .collection(Constants.FIRESTORE_COLLECTION_KEY)
        .document(Constants.FIRESTORE_TEST_DOCUMENT_KEY).get();


    document.then(handleData).catchError(onError);
  }

  void handleData(DocumentSnapshot testDocument) {
    clickData = testDocument.documentID;
  }

  void onError() {
    print('An error has occured.');
  }

  void signInSuccess(FirebaseUser user) {
    print('User\'s email : ' + user.email);
    setState(() {
      signInStatus = 'Authorized User : ${user.email}';
    });
    loadTestData();
  }

  _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    print("tap down " + x.toString() + ", " + y.toString());
  }

  _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    setState(() {
      clickData = "tap up " + x.toString() + ", " + y.toString();
    });
    print("tap up " + x.toString() + ", " + y.toString());
  }


}
