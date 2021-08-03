import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_feedback_record.g.dart';

abstract class UserFeedbackRecord
    implements Built<UserFeedbackRecord, UserFeedbackRecordBuilder> {
  static Serializer<UserFeedbackRecord> get serializer =>
      _$userFeedbackRecordSerializer;

  @nullable
  DocumentReference get uid;

  @nullable
  String get feedback;

  @nullable
  DateTime get feedbackDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserFeedbackRecordBuilder builder) =>
      builder..feedback = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userFeedback');

  static Stream<UserFeedbackRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserFeedbackRecord._();
  factory UserFeedbackRecord(
          [void Function(UserFeedbackRecordBuilder) updates]) =
      _$UserFeedbackRecord;

  static UserFeedbackRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserFeedbackRecordData({
  DocumentReference uid,
  String feedback,
  DateTime feedbackDate,
}) =>
    serializers.toFirestore(
        UserFeedbackRecord.serializer,
        UserFeedbackRecord((u) => u
          ..uid = uid
          ..feedback = feedback
          ..feedbackDate = feedbackDate));
