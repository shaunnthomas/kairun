import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'quant_activities_record.g.dart';

abstract class QuantActivitiesRecord
    implements Built<QuantActivitiesRecord, QuantActivitiesRecordBuilder> {
  static Serializer<QuantActivitiesRecord> get serializer =>
      _$quantActivitiesRecordSerializer;

  @nullable
  int get topicName;

  @nullable
  int get completedWorkouts;

  @nullable
  DocumentReference get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(QuantActivitiesRecordBuilder builder) =>
      builder
        ..topicName = 0
        ..completedWorkouts = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quant_activities');

  static Stream<QuantActivitiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  QuantActivitiesRecord._();
  factory QuantActivitiesRecord(
          [void Function(QuantActivitiesRecordBuilder) updates]) =
      _$QuantActivitiesRecord;

  static QuantActivitiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createQuantActivitiesRecordData({
  int topicName,
  int completedWorkouts,
  DocumentReference uid,
}) =>
    serializers.toFirestore(
        QuantActivitiesRecord.serializer,
        QuantActivitiesRecord((q) => q
          ..topicName = topicName
          ..completedWorkouts = completedWorkouts
          ..uid = uid));
