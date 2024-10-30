// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateProjectResponseModelStruct extends FFFirebaseStruct {
  CreateProjectResponseModelStruct({
    String? clientProjectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _clientProjectId = clientProjectId,
        super(firestoreUtilData);

  // "client_project_id" field.
  String? _clientProjectId;
  String get clientProjectId => _clientProjectId ?? '';
  set clientProjectId(String? val) => _clientProjectId = val;

  bool hasClientProjectId() => _clientProjectId != null;

  static CreateProjectResponseModelStruct fromMap(Map<String, dynamic> data) =>
      CreateProjectResponseModelStruct(
        clientProjectId: data['client_project_id'] as String?,
      );

  static CreateProjectResponseModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? CreateProjectResponseModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'client_project_id': _clientProjectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'client_project_id': serializeParam(
          _clientProjectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreateProjectResponseModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreateProjectResponseModelStruct(
        clientProjectId: deserializeParam(
          data['client_project_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreateProjectResponseModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateProjectResponseModelStruct &&
        clientProjectId == other.clientProjectId;
  }

  @override
  int get hashCode => const ListEquality().hash([clientProjectId]);
}

CreateProjectResponseModelStruct createCreateProjectResponseModelStruct({
  String? clientProjectId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreateProjectResponseModelStruct(
      clientProjectId: clientProjectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreateProjectResponseModelStruct? updateCreateProjectResponseModelStruct(
  CreateProjectResponseModelStruct? createProjectResponseModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    createProjectResponseModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreateProjectResponseModelStructData(
  Map<String, dynamic> firestoreData,
  CreateProjectResponseModelStruct? createProjectResponseModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (createProjectResponseModel == null) {
    return;
  }
  if (createProjectResponseModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      createProjectResponseModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final createProjectResponseModelData =
      getCreateProjectResponseModelFirestoreData(
          createProjectResponseModel, forFieldValue);
  final nestedData = createProjectResponseModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      createProjectResponseModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreateProjectResponseModelFirestoreData(
  CreateProjectResponseModelStruct? createProjectResponseModel, [
  bool forFieldValue = false,
]) {
  if (createProjectResponseModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(createProjectResponseModel.toMap());

  // Add any Firestore field values
  createProjectResponseModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreateProjectResponseModelListFirestoreData(
  List<CreateProjectResponseModelStruct>? createProjectResponseModels,
) =>
    createProjectResponseModels
        ?.map((e) => getCreateProjectResponseModelFirestoreData(e, true))
        .toList() ??
    [];
