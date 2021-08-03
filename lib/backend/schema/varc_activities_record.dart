import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'varc_activities_record.g.dart';

abstract class VarcActivitiesRecord
    implements Built<VarcActivitiesRecord, VarcActivitiesRecordBuilder> {
  static Serializer<VarcActivitiesRecord> get serializer =>
      _$varcActivitiesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'section_name')
  String get sectionName;

  @nullable
  @BuiltValueField(wireName: 'completed_workouts')
  int get completedWorkouts;

  @nullable
  DocumentReference get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VarcActivitiesRecordBuilder builder) => builder
    ..sectionName = ''
    ..completedWorkouts = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('varc_activities');

  static Stream<VarcActivitiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VarcActivitiesRecord._();
  factory VarcActivitiesRecord(
          [void Function(VarcActivitiesRecordBuilder) updates]) =
      _$VarcActivitiesRecord;

  static VarcActivitiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createVarcActivitiesRecordData({
  String sectionName,
  int completedWorkouts,
  DocumentReference uid,
}) =>
    serializers.toFirestore(
        VarcActivitiesRecord.serializer,
        VarcActivitiesRecord((v) => v
          ..sectionName = sectionName
          ..completedWorkouts = completedWorkouts
          ..uid = uid));
