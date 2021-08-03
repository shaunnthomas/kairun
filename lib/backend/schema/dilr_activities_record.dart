import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'dilr_activities_record.g.dart';

abstract class DilrActivitiesRecord
    implements Built<DilrActivitiesRecord, DilrActivitiesRecordBuilder> {
  static Serializer<DilrActivitiesRecord> get serializer =>
      _$dilrActivitiesRecordSerializer;

  @nullable
  int get completedWorkouts;

  @nullable
  int get topicName;

  @nullable
  DocumentReference get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DilrActivitiesRecordBuilder builder) => builder
    ..completedWorkouts = 0
    ..topicName = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dilr_activities');

  static Stream<DilrActivitiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DilrActivitiesRecord._();
  factory DilrActivitiesRecord(
          [void Function(DilrActivitiesRecordBuilder) updates]) =
      _$DilrActivitiesRecord;

  static DilrActivitiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createDilrActivitiesRecordData({
  int completedWorkouts,
  int topicName,
  DocumentReference uid,
}) =>
    serializers.toFirestore(
        DilrActivitiesRecord.serializer,
        DilrActivitiesRecord((d) => d
          ..completedWorkouts = completedWorkouts
          ..topicName = topicName
          ..uid = uid));
