import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../quizpage_mcq/quizpage_mcq_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutDescWidget extends StatefulWidget {
  WorkoutDescWidget({
    Key key,
    this.topicName,
    this.sectionName,
    this.topicIconURL,
  }) : super(key: key);

  final String topicName;
  final String sectionName;
  final String topicIconURL;

  @override
  _WorkoutDescWidgetState createState() => _WorkoutDescWidgetState();
}

class _WorkoutDescWidgetState extends State<WorkoutDescWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<List<SectionResultsRecord>>(
              stream: querySectionResultsRecord(
                queryBuilder: (sectionResultsRecord) => sectionResultsRecord
                    .where('topicName', isEqualTo: widget.topicName)
                    .where('uid', isEqualTo: currentUserReference),
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
                List<SectionResultsRecord> columnSectionResultsRecordList =
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
                final columnSectionResultsRecord =
                    columnSectionResultsRecordList.first;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment(0.95, 0),
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.05, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            widget.topicIconURL,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: AutoSizeText(
                          widget.topicName,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.title2.override(
                            fontFamily: 'Bebas Neue',
                            color: FlutterFlowTheme.primaryColor,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0),
                      child: Text(
                        widget.sectionName,
                        style: FlutterFlowTheme.title2.override(
                          fontFamily: 'Bebas Neue',
                          color: FlutterFlowTheme.positive,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Container(
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: Alignment(-0.9, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
                                child: Text(
                                  'FEATURING',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Raleway',
                                    color: FlutterFlowTheme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                final subTopicsList = columnSectionResultsRecord
                                        .subTopicsList
                                        ?.toList() ??
                                    [];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(subTopicsList.length,
                                      (subTopicsListIndex) {
                                    final subTopicsListItem =
                                        subTopicsList[subTopicsListIndex];
                                    return Align(
                                      alignment: Alignment(-0.9, 0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(36, 10, 0, 0),
                                        child: Text(
                                          subTopicsListItem,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Raleway',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
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
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Container(
                            width: 130,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                            child: Align(
                              alignment: Alignment(-0.05, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text(
                                      columnSectionResultsRecord
                                          .workoutsCompleted
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Raleway',
                                        color: FlutterFlowTheme.positive,
                                        fontSize: 34,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Workouts Completed',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Raleway',
                                      color: FlutterFlowTheme.primaryColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizpageMcqWidget(
                        topicName: widget.topicName,
                        topicIconURL: widget.topicIconURL,
                      ),
                    ),
                  );
                },
                text: 'Start Workout',
                options: FFButtonOptions(
                  width: 320,
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
                  borderRadius: 7,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
