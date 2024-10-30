// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectStruct extends FFFirebaseStruct {
  ProjectStruct({
    String? projectName,
    String? createdOn,
    String? updatedOn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectName = projectName,
        _createdOn = createdOn,
        _updatedOn = updatedOn,
        super(firestoreUtilData);

  // "projectName" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  // "createdOn" field.
  String? _createdOn;
  String get createdOn => _createdOn ?? '';
  set createdOn(String? val) => _createdOn = val;

  bool hasCreatedOn() => _createdOn != null;

  // "updatedOn" field.
  String? _updatedOn;
  String get updatedOn => _updatedOn ?? '';
  set updatedOn(String? val) => _updatedOn = val;

  bool hasUpdatedOn() => _updatedOn != null;

  static ProjectStruct fromMap(Map<String, dynamic> data) => ProjectStruct(
        projectName: data['projectName'] as String?,
        createdOn: data['createdOn'] as String?,
        updatedOn: data['updatedOn'] as String?,
      );

  static ProjectStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProjectStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'projectName': _projectName,
        'createdOn': _createdOn,
        'updatedOn': _updatedOn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'projectName': serializeParam(
          _projectName,
          ParamType.String,
        ),
        'createdOn': serializeParam(
          _createdOn,
          ParamType.String,
        ),
        'updatedOn': serializeParam(
          _updatedOn,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectStruct(
        projectName: deserializeParam(
          data['projectName'],
          ParamType.String,
          false,
        ),
        createdOn: deserializeParam(
          data['createdOn'],
          ParamType.String,
          false,
        ),
        updatedOn: deserializeParam(
          data['updatedOn'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectStruct &&
        projectName == other.projectName &&
        createdOn == other.createdOn &&
        updatedOn == other.updatedOn;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([projectName, createdOn, updatedOn]);
}

ProjectStruct createProjectStruct({
  String? projectName,
  String? createdOn,
  String? updatedOn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectStruct(
      projectName: projectName,
      createdOn: createdOn,
      updatedOn: updatedOn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectStruct? updateProjectStruct(
  ProjectStruct? project, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    project
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectStructData(
  Map<String, dynamic> firestoreData,
  ProjectStruct? project,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (project == null) {
    return;
  }
  if (project.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && project.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectData = getProjectFirestoreData(project, forFieldValue);
  final nestedData = projectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = project.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectFirestoreData(
  ProjectStruct? project, [
  bool forFieldValue = false,
]) {
  if (project == null) {
    return {};
  }
  final firestoreData = mapToFirestore(project.toMap());

  // Add any Firestore field values
  project.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectListFirestoreData(
  List<ProjectStruct>? projects,
) =>
    projects?.map((e) => getProjectFirestoreData(e, true)).toList() ?? [];
