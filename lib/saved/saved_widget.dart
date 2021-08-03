import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../saved_question_description/saved_question_description_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedWidget extends StatefulWidget {
  SavedWidget({Key key}) : super(key: key);

  @override
  _SavedWidgetState createState() => _SavedWidgetState();
}

class _SavedWidgetState extends State<SavedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'saved',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Bebas Neue',
            color: FlutterFlowTheme.primaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  child: Text(
                    'DI LR',
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Bebas Neue',
                      color: FlutterFlowTheme.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            StreamBuilder<List<SavedQuestionRecord>>(
              stream: querySavedQuestionRecord(
                queryBuilder: (savedQuestionRecord) => savedQuestionRecord
                    .where('user', isEqualTo: currentUserReference)
                    .where('section', isEqualTo: 'DI LR'),
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
                List<SavedQuestionRecord> columnSavedQuestionRecordList =
                    snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnSavedQuestionRecordList.length,
                      (columnIndex) {
                    final columnSavedQuestionRecord =
                        columnSavedQuestionRecordList[columnIndex];
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SavedQuestionDescriptionWidget(
                              questionDetails:
                                  columnSavedQuestionRecord.questionData,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.secondaryColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 8, 0, 5),
                                  child: AutoSizeText(
                                    columnSavedQuestionRecord.questionTitle,
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                                  child: Text(
                                    columnSavedQuestionRecord.topicName,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Raleway',
                                      color: FlutterFlowTheme.positive,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment(0.05, -0.05),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: FlutterFlowTheme.primaryColor,
                                  size: 34,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  child: Text(
                    'VA RC',
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Bebas Neue',
                      color: FlutterFlowTheme.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            StreamBuilder<List<SavedQuestionRecord>>(
              stream: querySavedQuestionRecord(
                queryBuilder: (savedQuestionRecord) => savedQuestionRecord
                    .where('user', isEqualTo: currentUserReference)
                    .where('section', isEqualTo: 'VA RC'),
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
                List<SavedQuestionRecord> columnSavedQuestionRecordList =
                    snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnSavedQuestionRecordList.length,
                      (columnIndex) {
                    final columnSavedQuestionRecord =
                        columnSavedQuestionRecordList[columnIndex];
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SavedQuestionDescriptionWidget(
                              questionDetails:
                                  columnSavedQuestionRecord.questionData,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.secondaryColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 8, 0, 5),
                                  child: AutoSizeText(
                                    columnSavedQuestionRecord.questionTitle,
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                                  child: Text(
                                    columnSavedQuestionRecord.topicName,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Raleway',
                                      color: FlutterFlowTheme.positive,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment(0.05, -0.05),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: FlutterFlowTheme.primaryColor,
                                  size: 34,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                  child: Text(
                    'Quant',
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Bebas Neue',
                      color: FlutterFlowTheme.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            StreamBuilder<List<SavedQuestionRecord>>(
              stream: querySavedQuestionRecord(
                queryBuilder: (savedQuestionRecord) => savedQuestionRecord
                    .where('user', isEqualTo: currentUserReference)
                    .where('section', isEqualTo: 'Quant'),
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
                List<SavedQuestionRecord> columnSavedQuestionRecordList =
                    snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnSavedQuestionRecordList.length,
                      (columnIndex) {
                    final columnSavedQuestionRecord =
                        columnSavedQuestionRecordList[columnIndex];
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SavedQuestionDescriptionWidget(
                              questionDetails:
                                  columnSavedQuestionRecord.questionData,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.secondaryColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 8, 0, 5),
                                  child: AutoSizeText(
                                    columnSavedQuestionRecord.questionTitle,
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                                  child: Text(
                                    columnSavedQuestionRecord.topicName,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Raleway',
                                      color: FlutterFlowTheme.positive,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment(0.05, -0.05),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: FlutterFlowTheme.primaryColor,
                                  size: 34,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
