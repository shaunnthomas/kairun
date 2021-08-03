import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'section_results_record.g.dart';

abstract class SectionResultsRecord
    implements Built<SectionResultsRecord, SectionResultsRecordBuilder> {
  static Serializer<SectionResultsRecord> get serializer =>
      _$sectionResultsRecordSerializer;

  @nullable
  DocumentReference get uid;

  @nullable
  BuiltList<int> get accuracyRecord;

  @nullable
  BuiltList<double> get avgSpeedRecord;

  @nullable
  String get topicName;

  @nullable
  BuiltList<DocumentReference> get questionCompleted;

  @nullable
  int get workoutsCompleted;

  @nullable
  String get topicIconURL;

  @nullable
  BuiltList<String> get subTopicsList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SectionResultsRecordBuilder builder) => builder
    ..accuracyRecord = ListBuilder()
    ..avgSpeedRecord = ListBuilder()
    ..topicName = ''
    ..questionCompleted = ListBuilder()
    ..workoutsCompleted = 0
    ..topicIconURL = ''
    ..subTopicsList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sectionResults');

  static Stream<SectionResultsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SectionResultsRecord._();
  factory SectionResultsRecord(
          [void Function(SectionResultsRecordBuilder) updates]) =
      _$SectionResultsRecord;

  static SectionResultsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createSectionResultsRecordData({
  DocumentReference uid,
  String topicName,
  int workoutsCompleted,
  String topicIconURL,
}) =>
    serializers.toFirestore(
        SectionResultsRecord.serializer,
        SectionResultsRecord((s) => s
          ..uid = uid
          ..accuracyRecord = null
          ..avgSpeedRecord = null
          ..topicName = topicName
          ..questionCompleted = null
          ..workoutsCompleted = workoutsCompleted
          ..topicIconURL = topicIconURL
          ..subTopicsList = null));
