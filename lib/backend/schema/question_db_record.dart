import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'question_db_record.g.dart';

abstract class QuestionDbRecord
    implements Built<QuestionDbRecord, QuestionDbRecordBuilder> {
  static Serializer<QuestionDbRecord> get serializer =>
      _$questionDbRecordSerializer;

  @nullable
  String get passage;

  @nullable
  String get section;

  @nullable
  @BuiltValueField(wireName: 'option_1')
  String get option1;

  @nullable
  @BuiltValueField(wireName: 'option_2')
  String get option2;

  @nullable
  @BuiltValueField(wireName: 'option_3')
  String get option3;

  @nullable
  @BuiltValueField(wireName: 'option_4')
  String get option4;

  @nullable
  @BuiltValueField(wireName: 'correct_solution')
  String get correctSolution;

  @nullable
  @BuiltValueField(wireName: 'solution_descp')
  String get solutionDescp;

  @nullable
  @BuiltValueField(wireName: 'previous_year_cat')
  bool get previousYearCat;

  @nullable
  String get topic;

  @nullable
  @BuiltValueField(wireName: 'tita_solution')
  String get titaSolution;

  @nullable
  String get questiondescp;

  @nullable
  @BuiltValueField(wireName: 'question_ref')
  DocumentReference get questionRef;

  @nullable
  int get correctAttempts;

  @nullable
  int get incorrectAttempts;

  @nullable
  int get questionid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(QuestionDbRecordBuilder builder) => builder
    ..passage = ''
    ..section = ''
    ..option1 = ''
    ..option2 = ''
    ..option3 = ''
    ..option4 = ''
    ..correctSolution = ''
    ..solutionDescp = ''
    ..previousYearCat = false
    ..topic = ''
    ..titaSolution = ''
    ..questiondescp = ''
    ..correctAttempts = 0
    ..incorrectAttempts = 0
    ..questionid = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question_db');

  static Stream<QuestionDbRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  QuestionDbRecord._();
  factory QuestionDbRecord([void Function(QuestionDbRecordBuilder) updates]) =
      _$QuestionDbRecord;

  static QuestionDbRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createQuestionDbRecordData({
  String passage,
  String section,
  String option1,
  String option2,
  String option3,
  String option4,
  String correctSolution,
  String solutionDescp,
  bool previousYearCat,
  String topic,
  String titaSolution,
  String questiondescp,
  DocumentReference questionRef,
  int correctAttempts,
  int incorrectAttempts,
  int questionid,
}) =>
    serializers.toFirestore(
        QuestionDbRecord.serializer,
        QuestionDbRecord((q) => q
          ..passage = passage
          ..section = section
          ..option1 = option1
          ..option2 = option2
          ..option3 = option3
          ..option4 = option4
          ..correctSolution = correctSolution
          ..solutionDescp = solutionDescp
          ..previousYearCat = previousYearCat
          ..topic = topic
          ..titaSolution = titaSolution
          ..questiondescp = questiondescp
          ..questionRef = questionRef
          ..correctAttempts = correctAttempts
          ..incorrectAttempts = incorrectAttempts
          ..questionid = questionid));
