import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSolutionWidget extends StatefulWidget {
  AllSolutionWidget({Key key}) : super(key: key);

  @override
  _AllSolutionWidgetState createState() => _AllSolutionWidgetState();
}

class _AllSolutionWidgetState extends State<AllSolutionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Text(
            'Solution:',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFFE8F5E9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Text(
                'provide access to cultural activities that promote new and creative ways of thinking.',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Text(
            '\"The passage does not mention that cities provide access to cultural activities and that this promotes creativity.\\n\\nThe points about public spaces ‘where people can meet spontaneously and serendipitously’, ‘diverse’ populations and infrastructure for finance, organization and, trade which allow ideas ‘to be swiftly actualized’ are mentioned in paragraph 2.\\n\"',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Montserrat',
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }
}
