import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_question_response_record.g.dart';

abstract class UserQuestionResponseRecord
    implements
        Built<UserQuestionResponseRecord, UserQuestionResponseRecordBuilder> {
  static Serializer<UserQuestionResponseRecord> get serializer =>
      _$userQuestionResponseRecordSerializer;

  @nullable
  DocumentReference get uid;

  @nullable
  DocumentReference get questionID;

  @nullable
  String get userResponse;

  @nullable
  double get timeTaken;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserQuestionResponseRecordBuilder builder) =>
      builder
        ..userResponse = ''
        ..timeTaken = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userQuestionResponse');

  static Stream<UserQuestionResponseRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserQuestionResponseRecord._();
  factory UserQuestionResponseRecord(
          [void Function(UserQuestionResponseRecordBuilder) updates]) =
      _$UserQuestionResponseRecord;

  static UserQuestionResponseRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserQuestionResponseRecordData({
  DocumentReference uid,
  DocumentReference questionID,
  String userResponse,
  double timeTaken,
}) =>
    serializers.toFirestore(
        UserQuestionResponseRecord.serializer,
        UserQuestionResponseRecord((u) => u
          ..uid = uid
          ..questionID = questionID
          ..userResponse = userResponse
          ..timeTaken = timeTaken));
