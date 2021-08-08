import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'topic_recommendations_record.g.dart';

abstract class TopicRecommendationsRecord
    implements
        Built<TopicRecommendationsRecord, TopicRecommendationsRecordBuilder> {
  static Serializer<TopicRecommendationsRecord> get serializer =>
      _$topicRecommendationsRecordSerializer;

  @nullable
  String get topicName;

  @nullable
  BuiltList<int> get questionList;

  @nullable
  DocumentReference get uid;

  @nullable
  bool get completedStatus;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TopicRecommendationsRecordBuilder builder) =>
      builder
        ..topicName = ''
        ..questionList = ListBuilder()
        ..completedStatus = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topicRecommendations');

  static Stream<TopicRecommendationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TopicRecommendationsRecord._();
  factory TopicRecommendationsRecord(
          [void Function(TopicRecommendationsRecordBuilder) updates]) =
      _$TopicRecommendationsRecord;

  static TopicRecommendationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTopicRecommendationsRecordData({
  String topicName,
  DocumentReference uid,
  bool completedStatus,
}) =>
    serializers.toFirestore(
        TopicRecommendationsRecord.serializer,
        TopicRecommendationsRecord((t) => t
          ..topicName = topicName
          ..questionList = null
          ..uid = uid
          ..completedStatus = completedStatus));
