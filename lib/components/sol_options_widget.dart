import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SolOptionsWidget extends StatefulWidget {
  SolOptionsWidget({Key key}) : super(key: key);

  @override
  _SolOptionsWidgetState createState() => _SolOptionsWidgetState();
}

class _SolOptionsWidgetState extends State<SolOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(
              'contain spaces that enable people to meet and share new ideas.',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Raleway',
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.2,
            color: Color(0xFF90A4AE),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(
              'contain spaces that enable people to meet and share new ideas.',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Raleway',
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.2,
            color: Color(0xFF90A4AE),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(
              'provide the financial and institutional networks that enable ideas to become reality.',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Raleway',
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.2,
            color: Color(0xFF90A4AE),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(
              'provide access to cultural activities that promote new and creative ways of thinking.',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Raleway',
              ),
            ),
          )
        ],
      ),
    );
  }
}
