import 'package:barber/Models/Font.dart';
import 'package:barber/SearchResults.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(stacktrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = MyBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow, primaryColor: Colors.grey[800]),
      home: MyHomePage(title: 'Barber Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var assetImage = AssetImage('assets/images/barber-main.jpg');

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Image(image: assetImage, fit: BoxFit.fill),
            Opacity(
              opacity: .7,
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
            Center(
              // Text fields
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text('Welcome to \nBarber',
                        textAlign: TextAlign.center, style: firstTextStyle()),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, right: 24, left: 24, bottom: 24),
                      child: TextField(
                        controller: _searchController,
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.search,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Font.secondFont,
                            letterSpacing: 2.5),
                        decoration: InputDecoration(
                            hintText: 'Write your location...',
                            labelText: 'Search',
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.white54),
                            hintStyle: TextStyle(
                                color: Colors.white30, letterSpacing: 1),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.black45,
                            border: _textBorder(),
                            enabledBorder: _textBorder(),
                            focusedBorder: _textBorder()),
                      ),
                    ),
                  ),
                  Container(
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.white),
                      splashColor: Colors.black,
                      highlightedBorderColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResults(
                                  query: _searchController.text,
                                ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 8, right: 8),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontFamily: Font.secondFont,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
          fit: StackFit.expand,
        ),
      ),
    );
  }

  _textBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.yellow));
  }

  TextStyle firstTextStyle() {
    return TextStyle(
        fontSize: 42,
        color: Colors.white,
        letterSpacing: 5,
        wordSpacing: 10,
        height: 1.3,
        fontFamily: Font.mainFont);
  }
}
