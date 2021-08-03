import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashMainWidget extends StatefulWidget {
  SplashMainWidget({Key key}) : super(key: key);

  @override
  _SplashMainWidgetState createState() => _SplashMainWidgetState();
}

class _SplashMainWidgetState extends State<SplashMainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 50),
              child: Text(
                'Welcome back!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                  fontSize: 26,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: Text(
                'Your workouts for today are ready',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                  fontSize: 22,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
