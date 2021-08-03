import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subscription_plans_record.g.dart';

abstract class SubscriptionPlansRecord
    implements Built<SubscriptionPlansRecord, SubscriptionPlansRecordBuilder> {
  static Serializer<SubscriptionPlansRecord> get serializer =>
      _$subscriptionPlansRecordSerializer;

  @nullable
  int get months3;

  @nullable
  int get months6;

  @nullable
  int get months12;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SubscriptionPlansRecordBuilder builder) =>
      builder
        ..months3 = 0
        ..months6 = 0
        ..months12 = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptionPlans');

  static Stream<SubscriptionPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SubscriptionPlansRecord._();
  factory SubscriptionPlansRecord(
          [void Function(SubscriptionPlansRecordBuilder) updates]) =
      _$SubscriptionPlansRecord;

  static SubscriptionPlansRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createSubscriptionPlansRecordData({
  int months3,
  int months6,
  int months12,
}) =>
    serializers.toFirestore(
        SubscriptionPlansRecord.serializer,
        SubscriptionPlansRecord((s) => s
          ..months3 = months3
          ..months6 = months6
          ..months12 = months12));
