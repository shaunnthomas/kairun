import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedcardWidget extends StatefulWidget {
  FeaturedcardWidget({Key key}) : super(key: key);

  @override
  _FeaturedcardWidgetState createState() => _FeaturedcardWidgetState();
}

class _FeaturedcardWidgetState extends State<FeaturedcardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(9, 0, 5, 0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xFF1A494F),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 340,
          height: 270,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.primaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Icon(
                  Icons.settings_outlined,
                  color: FlutterFlowTheme.secondaryColor,
                  size: 180,
                ),
              ),
              Text(
                'RECOMMENDED',
                style: FlutterFlowTheme.title2.override(
                  fontFamily: 'Bebas Neue',
                ),
              ),
              Text(
                'your personalized workout',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
