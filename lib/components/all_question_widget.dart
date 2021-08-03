import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AllQuestionWidget extends StatefulWidget {
  AllQuestionWidget({
    Key key,
    this.lala,
  }) : super(key: key);

  final DocumentReference lala;

  @override
  _AllQuestionWidgetState createState() => _AllQuestionWidgetState();
}

class _AllQuestionWidgetState extends State<AllQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Text(
        'In the author\'s view, cities promote human creativity for all the following reasons EXCEPT that they',
        style: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
