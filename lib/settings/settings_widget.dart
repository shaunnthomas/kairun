import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.where('uid', isEqualTo: currentUserUid),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<UsersRecord> settingsUsersRecordList = snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          return Container(
            height: 100,
            child: Center(
              child: Text('No results.'),
            ),
          );
        }
        final settingsUsersRecord = settingsUsersRecordList.first;
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
                    builder: (context) => NavBarPage(initialPage: 'HomePage'),
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
              'SETTINGS',
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
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Name',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Raleway',
                      color: FlutterFlowTheme.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Text(
                    settingsUsersRecord.firstName,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Raleway',
                      color: Color(0xB2E5ECE9),
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    'Subscription Status',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Raleway',
                      color: FlutterFlowTheme.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Text(
                        settingsUsersRecord.firstName,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Raleway',
                          color: Color(0xB2E5ECE9),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.05),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(215, 5, 0, 5),
                        child: Icon(
                          Icons.chevron_right,
                          color: FlutterFlowTheme.positive,
                          size: 34,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.05),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(200, 5, 0, 5),
                        child: Icon(
                          Icons.chevron_right,
                          color: FlutterFlowTheme.positive,
                          size: 34,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    'Email ID',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Raleway',
                      color: FlutterFlowTheme.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Text(
                    settingsUsersRecord.email,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Raleway',
                      color: Color(0xB2E5ECE9),
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                      child: Text(
                        'Contact Us',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Raleway',
                          color: FlutterFlowTheme.primaryColor,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.05),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(200, 5, 0, 5),
                        child: Icon(
                          Icons.chevron_right,
                          color: FlutterFlowTheme.positive,
                          size: 34,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
