import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/users_record.dart';
import 'schema/question_db_record.dart';
import 'schema/saved_question_record.dart';
import 'schema/varc_activities_record.dart';
import 'schema/user_section_recommendations_record.dart';
import 'schema/daily_workouts_list_record.dart';
import 'schema/section_results_record.dart';
import 'schema/topic_recommendations_record.dart';
import 'schema/dilr_activities_record.dart';
import 'schema/quant_activities_record.dart';
import 'schema/user_feedback_record.dart';
import 'schema/subscription_plans_record.dart';
import 'schema/user_question_response_record.dart';
import 'schema/serializers.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/users_record.dart';
export 'schema/question_db_record.dart';
export 'schema/saved_question_record.dart';
export 'schema/varc_activities_record.dart';
export 'schema/user_section_recommendations_record.dart';
export 'schema/daily_workouts_list_record.dart';
export 'schema/section_results_record.dart';
export 'schema/topic_recommendations_record.dart';
export 'schema/dilr_activities_record.dart';
export 'schema/quant_activities_record.dart';
export 'schema/user_feedback_record.dart';
export 'schema/subscription_plans_record.dart';
export 'schema/user_question_response_record.dart';

Stream<List<UsersRecord>> queryUsersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<QuestionDbRecord>> queryQuestionDbRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(QuestionDbRecord.collection, QuestionDbRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<SavedQuestionRecord>> querySavedQuestionRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        SavedQuestionRecord.collection, SavedQuestionRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<VarcActivitiesRecord>> queryVarcActivitiesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        VarcActivitiesRecord.collection, VarcActivitiesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<UserSectionRecommendationsRecord>>
    queryUserSectionRecommendationsRecord(
            {Query Function(Query) queryBuilder,
            int limit = -1,
            bool singleRecord = false}) =>
        queryCollection(UserSectionRecommendationsRecord.collection,
            UserSectionRecommendationsRecord.serializer,
            queryBuilder: queryBuilder,
            limit: limit,
            singleRecord: singleRecord);

Stream<List<DailyWorkoutsListRecord>> queryDailyWorkoutsListRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        DailyWorkoutsListRecord.collection, DailyWorkoutsListRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<SectionResultsRecord>> querySectionResultsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        SectionResultsRecord.collection, SectionResultsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<TopicRecommendationsRecord>> queryTopicRecommendationsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(TopicRecommendationsRecord.collection,
        TopicRecommendationsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<DilrActivitiesRecord>> queryDilrActivitiesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        DilrActivitiesRecord.collection, DilrActivitiesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<QuantActivitiesRecord>> queryQuantActivitiesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        QuantActivitiesRecord.collection, QuantActivitiesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<UserFeedbackRecord>> queryUserFeedbackRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        UserFeedbackRecord.collection, UserFeedbackRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<SubscriptionPlansRecord>> querySubscriptionPlansRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        SubscriptionPlansRecord.collection, SubscriptionPlansRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<UserQuestionResponseRecord>> queryUserQuestionResponseRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UserQuestionResponseRecord.collection,
        UserQuestionResponseRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<T>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

// Creates a Firestore record representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
