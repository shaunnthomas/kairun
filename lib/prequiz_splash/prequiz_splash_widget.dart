import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PrequizSplashWidget extends StatefulWidget {
  PrequizSplashWidget({Key key}) : super(key: key);

  @override
  _PrequizSplashWidgetState createState() => _PrequizSplashWidgetState();
}

class _PrequizSplashWidgetState extends State<PrequizSplashWidget> {
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
              padding: EdgeInsets.fromLTRB(80, 0, 80, 15),
              child: Text(
                'Please Wait',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: Text(
                'Selecting the most optimum questions for you',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
