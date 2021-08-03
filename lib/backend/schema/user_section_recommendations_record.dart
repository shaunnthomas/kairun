import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_section_recommendations_record.g.dart';

abstract class UserSectionRecommendationsRecord
    implements
        Built<UserSectionRecommendationsRecord,
            UserSectionRecommendationsRecordBuilder> {
  static Serializer<UserSectionRecommendationsRecord> get serializer =>
      _$userSectionRecommendationsRecordSerializer;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'recommendation_type')
  String get recommendationType;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(
          UserSectionRecommendationsRecordBuilder builder) =>
      builder
        ..uid = ''
        ..recommendationType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_section_recommendations');

  static Stream<UserSectionRecommendationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserSectionRecommendationsRecord._();
  factory UserSectionRecommendationsRecord(
          [void Function(UserSectionRecommendationsRecordBuilder) updates]) =
      _$UserSectionRecommendationsRecord;

  static UserSectionRecommendationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserSectionRecommendationsRecordData({
  String uid,
  String recommendationType,
}) =>
    serializers.toFirestore(
        UserSectionRecommendationsRecord.serializer,
        UserSectionRecommendationsRecord((u) => u
          ..uid = uid
          ..recommendationType = recommendationType));
