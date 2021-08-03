import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedQuestionDescriptionWidget extends StatefulWidget {
  SavedQuestionDescriptionWidget({
    Key key,
    this.questionDetails,
  }) : super(key: key);

  final DocumentReference questionDetails;

  @override
  _SavedQuestionDescriptionWidgetState createState() =>
      _SavedQuestionDescriptionWidgetState();
}

class _SavedQuestionDescriptionWidgetState
    extends State<SavedQuestionDescriptionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          automaticallyImplyLeading: false,
          actions: [
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialPage: 'saved'),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.secondaryColor,
                    size: 35,
                  ),
                ),
              ),
            )
          ],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: StreamBuilder<List<QuestionDbRecord>>(
          stream: queryQuestionDbRecord(
            queryBuilder: (questionDbRecord) => questionDbRecord
                .where('question_ref', isEqualTo: widget.questionDetails),
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
            List<QuestionDbRecord> columnQuestionDbRecordList = snapshot.data;
            // Customize what your widget looks like with no query results.
            if (snapshot.data.isEmpty) {
              return Container(
                height: 100,
                child: Center(
                  child: Text('No results.'),
                ),
              );
            }
            final columnQuestionDbRecord = columnQuestionDbRecordList.first;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 7),
                    child: Text(
                      columnQuestionDbRecord.passage,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.primaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Text(
                      columnQuestionDbRecord.questiondescp,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.primaryColor,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                              child: Text(
                                columnQuestionDbRecord.option1,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Raleway',
                                  color: FlutterFlowTheme.secondaryColor,
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
                                columnQuestionDbRecord.option2,
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
                                columnQuestionDbRecord.option3,
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
                                columnQuestionDbRecord.option4,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
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
                            color: FlutterFlowTheme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: Text(
                              columnQuestionDbRecord.correctSolution,
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
                          columnQuestionDbRecord.solutionDescp,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.primaryColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
