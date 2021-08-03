import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'saved_question_record.g.dart';

abstract class SavedQuestionRecord
    implements Built<SavedQuestionRecord, SavedQuestionRecordBuilder> {
  static Serializer<SavedQuestionRecord> get serializer =>
      _$savedQuestionRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'question_data')
  DocumentReference get questionData;

  @nullable
  DocumentReference get user;

  @nullable
  DateTime get savedTime;

  @nullable
  String get section;

  @nullable
  String get questionTitle;

  @nullable
  String get topicName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SavedQuestionRecordBuilder builder) => builder
    ..section = ''
    ..questionTitle = ''
    ..topicName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('saved_question');

  static Stream<SavedQuestionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SavedQuestionRecord._();
  factory SavedQuestionRecord(
          [void Function(SavedQuestionRecordBuilder) updates]) =
      _$SavedQuestionRecord;

  static SavedQuestionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createSavedQuestionRecordData({
  DocumentReference questionData,
  DocumentReference user,
  DateTime savedTime,
  String section,
  String questionTitle,
  String topicName,
}) =>
    serializers.toFirestore(
        SavedQuestionRecord.serializer,
        SavedQuestionRecord((s) => s
          ..questionData = questionData
          ..user = user
          ..savedTime = savedTime
          ..section = section
          ..questionTitle = questionTitle
          ..topicName = topicName));
