import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SectioncardsCopyWidget extends StatefulWidget {
  SectioncardsCopyWidget({Key key}) : super(key: key);

  @override
  _SectioncardsCopyWidgetState createState() => _SectioncardsCopyWidgetState();
}

class _SectioncardsCopyWidgetState extends State<SectioncardsCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 120,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                    size: 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                  child: Text(
                    'DI LR',
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Bebas Neue',
                      fontSize: 17,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Text(
                  'DI LR Workout',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Raleway',
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
