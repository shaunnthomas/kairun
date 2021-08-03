import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'daily_workouts_list_record.g.dart';

abstract class DailyWorkoutsListRecord
    implements Built<DailyWorkoutsListRecord, DailyWorkoutsListRecordBuilder> {
  static Serializer<DailyWorkoutsListRecord> get serializer =>
      _$dailyWorkoutsListRecordSerializer;

  @nullable
  DocumentReference get uid;

  @nullable
  String get sectionName;

  @nullable
  String get topicName;

  @nullable
  String get topicIconURL;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DailyWorkoutsListRecordBuilder builder) =>
      builder
        ..sectionName = ''
        ..topicName = ''
        ..topicIconURL = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dailyWorkoutsList');

  static Stream<DailyWorkoutsListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DailyWorkoutsListRecord._();
  factory DailyWorkoutsListRecord(
          [void Function(DailyWorkoutsListRecordBuilder) updates]) =
      _$DailyWorkoutsListRecord;

  static DailyWorkoutsListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createDailyWorkoutsListRecordData({
  DocumentReference uid,
  String sectionName,
  String topicName,
  String topicIconURL,
}) =>
    serializers.toFirestore(
        DailyWorkoutsListRecord.serializer,
        DailyWorkoutsListRecord((d) => d
          ..uid = uid
          ..sectionName = sectionName
          ..topicName = topicName
          ..topicIconURL = topicIconURL));
