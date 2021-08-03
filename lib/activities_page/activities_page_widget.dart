import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesPageWidget extends StatefulWidget {
  ActivitiesPageWidget({Key key}) : super(key: key);

  @override
  _ActivitiesPageWidgetState createState() => _ActivitiesPageWidgetState();
}

class _ActivitiesPageWidgetState extends State<ActivitiesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.secondaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Activities',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Bebas Neue',
            color: FlutterFlowTheme.primaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment(0.05, 0),
              child: Text(
                'Practice topic-wise workouts, \\noptimised for your success',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.primaryColor,
                      indicatorColor: FlutterFlowTheme.secondaryColor,
                      tabs: [
                        Tab(
                          text: 'VA RC',
                        ),
                        Tab(
                          text: 'Quant',
                        ),
                        Tab(
                          text: 'DI LR',
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: StreamBuilder<List<VarcActivitiesRecord>>(
                              stream: queryVarcActivitiesRecord(
                                queryBuilder: (varcActivitiesRecord) =>
                                    varcActivitiesRecord.where('uid',
                                        isEqualTo: currentUserReference),
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
                                List<VarcActivitiesRecord>
                                    gridViewVarcActivitiesRecordList =
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
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      gridViewVarcActivitiesRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewVarcActivitiesRecord =
                                        gridViewVarcActivitiesRecordList[
                                            gridViewIndex];
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.tertiaryColor,
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.tertiaryColor,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8, 20, 0, 0),
                                                child: Text(
                                                  gridViewVarcActivitiesRecord
                                                      .sectionName,
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 8, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 70, 0, 0),
                                                      child: Text(
                                                        'WORKOUTS DONE',
                                                        style: TextStyle(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              8, 70, 0, 0),
                                                      child: Text(
                                                        gridViewVarcActivitiesRecord
                                                            .completedWorkouts
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .positive,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: StreamBuilder<List<QuantActivitiesRecord>>(
                              stream: queryQuantActivitiesRecord(
                                queryBuilder: (quantActivitiesRecord) =>
                                    quantActivitiesRecord.where('uid',
                                        isEqualTo: currentUserReference),
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
                                List<QuantActivitiesRecord>
                                    gridViewQuantActivitiesRecordList =
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
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      gridViewQuantActivitiesRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewQuantActivitiesRecord =
                                        gridViewQuantActivitiesRecordList[
                                            gridViewIndex];
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.tertiaryColor,
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.tertiaryColor,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8, 20, 0, 0),
                                                child: Text(
                                                  gridViewQuantActivitiesRecord
                                                      .topicName
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 8, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 70, 0, 0),
                                                      child: Text(
                                                        'WORKOUTS DONE',
                                                        style: TextStyle(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              8, 70, 0, 0),
                                                      child: Text(
                                                        gridViewQuantActivitiesRecord
                                                            .completedWorkouts
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .positive,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: StreamBuilder<List<DilrActivitiesRecord>>(
                              stream: queryDilrActivitiesRecord(
                                queryBuilder: (dilrActivitiesRecord) =>
                                    dilrActivitiesRecord.where('uid',
                                        isEqualTo: currentUserReference),
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
                                List<DilrActivitiesRecord>
                                    gridViewDilrActivitiesRecordList =
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
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      gridViewDilrActivitiesRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewDilrActivitiesRecord =
                                        gridViewDilrActivitiesRecordList[
                                            gridViewIndex];
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.tertiaryColor,
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.tertiaryColor,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    8, 20, 0, 0),
                                                child: Text(
                                                  gridViewDilrActivitiesRecord
                                                      .topicName
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 8, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 70, 0, 0),
                                                      child: Text(
                                                        'WORKOUTS DONE',
                                                        style: TextStyle(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              8, 70, 0, 0),
                                                      child: Text(
                                                        gridViewDilrActivitiesRecord
                                                            .completedWorkouts
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .positive,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
