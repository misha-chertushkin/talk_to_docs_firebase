// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptConfigurationStruct extends FFFirebaseStruct {
  PromptConfigurationStruct({
    String? promptName,
    String? promptValue,
    String? promptDisplayName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _promptName = promptName,
        _promptValue = promptValue,
        _promptDisplayName = promptDisplayName,
        super(firestoreUtilData);

  // "prompt_name" field.
  String? _promptName;
  String get promptName => _promptName ?? '';
  set promptName(String? val) => _promptName = val;

  bool hasPromptName() => _promptName != null;

  // "prompt_value" field.
  String? _promptValue;
  String get promptValue => _promptValue ?? '';
  set promptValue(String? val) => _promptValue = val;

  bool hasPromptValue() => _promptValue != null;

  // "prompt_display_name" field.
  String? _promptDisplayName;
  String get promptDisplayName => _promptDisplayName ?? '';
  set promptDisplayName(String? val) => _promptDisplayName = val;

  bool hasPromptDisplayName() => _promptDisplayName != null;

  static PromptConfigurationStruct fromMap(Map<String, dynamic> data) =>
      PromptConfigurationStruct(
        promptName: data['prompt_name'] as String?,
        promptValue: data['prompt_value'] as String?,
        promptDisplayName: data['prompt_display_name'] as String?,
      );

  static PromptConfigurationStruct? maybeFromMap(dynamic data) => data is Map
      ? PromptConfigurationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prompt_name': _promptName,
        'prompt_value': _promptValue,
        'prompt_display_name': _promptDisplayName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'prompt_name': serializeParam(
          _promptName,
          ParamType.String,
        ),
        'prompt_value': serializeParam(
          _promptValue,
          ParamType.String,
        ),
        'prompt_display_name': serializeParam(
          _promptDisplayName,
          ParamType.String,
        ),
      }.withoutNulls;

  static PromptConfigurationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PromptConfigurationStruct(
        promptName: deserializeParam(
          data['prompt_name'],
          ParamType.String,
          false,
        ),
        promptValue: deserializeParam(
          data['prompt_value'],
          ParamType.String,
          false,
        ),
        promptDisplayName: deserializeParam(
          data['prompt_display_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PromptConfigurationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PromptConfigurationStruct &&
        promptName == other.promptName &&
        promptValue == other.promptValue &&
        promptDisplayName == other.promptDisplayName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([promptName, promptValue, promptDisplayName]);
}

PromptConfigurationStruct createPromptConfigurationStruct({
  String? promptName,
  String? promptValue,
  String? promptDisplayName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PromptConfigurationStruct(
      promptName: promptName,
      promptValue: promptValue,
      promptDisplayName: promptDisplayName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PromptConfigurationStruct? updatePromptConfigurationStruct(
  PromptConfigurationStruct? promptConfiguration, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    promptConfiguration
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPromptConfigurationStructData(
  Map<String, dynamic> firestoreData,
  PromptConfigurationStruct? promptConfiguration,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (promptConfiguration == null) {
    return;
  }
  if (promptConfiguration.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && promptConfiguration.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final promptConfigurationData =
      getPromptConfigurationFirestoreData(promptConfiguration, forFieldValue);
  final nestedData =
      promptConfigurationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      promptConfiguration.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPromptConfigurationFirestoreData(
  PromptConfigurationStruct? promptConfiguration, [
  bool forFieldValue = false,
]) {
  if (promptConfiguration == null) {
    return {};
  }
  final firestoreData = mapToFirestore(promptConfiguration.toMap());

  // Add any Firestore field values
  promptConfiguration.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPromptConfigurationListFirestoreData(
  List<PromptConfigurationStruct>? promptConfigurations,
) =>
    promptConfigurations
        ?.map((e) => getPromptConfigurationFirestoreData(e, true))
        .toList() ??
    [];
