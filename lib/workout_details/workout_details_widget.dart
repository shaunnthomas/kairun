import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../workout_desc/workout_desc_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutDetailsWidget extends StatefulWidget {
  WorkoutDetailsWidget({Key key}) : super(key: key);

  @override
  _WorkoutDetailsWidgetState createState() => _WorkoutDetailsWidgetState();
}

class _WorkoutDetailsWidgetState extends State<WorkoutDetailsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
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
            Icons.chevron_left_rounded,
            color: Colors.black,
            size: 35,
          ),
        ),
        title: Text(
          'Recommended Workout',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Raleway',
            color: FlutterFlowTheme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: StreamBuilder<List<DailyWorkoutsListRecord>>(
          stream: queryDailyWorkoutsListRecord(
            queryBuilder: (dailyWorkoutsListRecord) => dailyWorkoutsListRecord
                .where('uid', isEqualTo: currentUserReference),
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
            List<DailyWorkoutsListRecord> columnDailyWorkoutsListRecordList =
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(columnDailyWorkoutsListRecordList.length,
                  (columnIndex) {
                final columnDailyWorkoutsListRecord =
                    columnDailyWorkoutsListRecordList[columnIndex];
                return InkWell(
                  onTap: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutDescWidget(
                          topicName: columnDailyWorkoutsListRecord.topicName,
                          sectionName:
                              columnDailyWorkoutsListRecord.sectionName,
                          topicIconURL:
                              columnDailyWorkoutsListRecord.topicIconURL,
                        ),
                      ),
                      (r) => false,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 30, 0),
                        child: CachedNetworkImage(
                          imageUrl: columnDailyWorkoutsListRecord.topicIconURL,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Text(
                              columnDailyWorkoutsListRecord.topicName,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Raleway',
                                color: FlutterFlowTheme.primaryColor,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Text(
                            columnDailyWorkoutsListRecord.sectionName,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Raleway',
                              color: Color(0x9DE5ECE9),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
            ).animated([animationsMap['columnOnPageLoadAnimation']]);
          },
        ),
      ),
    );
  }
}
