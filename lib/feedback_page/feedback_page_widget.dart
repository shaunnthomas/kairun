import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../settings/settings_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackPageWidget extends StatefulWidget {
  FeedbackPageWidget({Key key}) : super(key: key);

  @override
  _FeedbackPageWidgetState createState() => _FeedbackPageWidgetState();
}

class _FeedbackPageWidgetState extends State<FeedbackPageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsWidget(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: FlutterFlowTheme.positive,
            size: 24,
          ),
        ),
        title: Text(
          'Feedback',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Bebas Neue',
            color: FlutterFlowTheme.primaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'Help us improve by suggesting new features or telling us about any issues you faced',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                  color: Color(0xAFE5ECE9),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                'Your Feedback',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter your feedback here...',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Raleway',
                    color: Color(0x86E5ECE9),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.secondaryColor,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.secondaryColor,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0x991E3030),
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Raleway',
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.05, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final userFeedbackCreateData = createUserFeedbackRecordData(
                      uid: currentUserReference,
                      feedback: textController.text,
                    );
                    await UserFeedbackRecord.collection
                        .doc()
                        .set(userFeedbackCreateData);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'HomePage'),
                      ),
                    );
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.positive,
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
