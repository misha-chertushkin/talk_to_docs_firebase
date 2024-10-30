// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectDetailStruct extends FFFirebaseStruct {
  ProjectDetailStruct({
    String? projectName,
    String? createdOn,
    String? updatedOn,
    List<PromptConfigurationStruct>? promptConfiguration,
    List<DocumentsStruct>? documents,
    List<String>? questions,
    String? readOnly,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectName = projectName,
        _createdOn = createdOn,
        _updatedOn = updatedOn,
        _promptConfiguration = promptConfiguration,
        _documents = documents,
        _questions = questions,
        _readOnly = readOnly,
        super(firestoreUtilData);

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  // "created_on" field.
  String? _createdOn;
  String get createdOn => _createdOn ?? '';
  set createdOn(String? val) => _createdOn = val;

  bool hasCreatedOn() => _createdOn != null;

  // "updated_on" field.
  String? _updatedOn;
  String get updatedOn => _updatedOn ?? '';
  set updatedOn(String? val) => _updatedOn = val;

  bool hasUpdatedOn() => _updatedOn != null;

  // "prompt_configuration" field.
  List<PromptConfigurationStruct>? _promptConfiguration;
  List<PromptConfigurationStruct> get promptConfiguration =>
      _promptConfiguration ?? const [];
  set promptConfiguration(List<PromptConfigurationStruct>? val) =>
      _promptConfiguration = val;

  void updatePromptConfiguration(
      Function(List<PromptConfigurationStruct>) updateFn) {
    updateFn(_promptConfiguration ??= []);
  }

  bool hasPromptConfiguration() => _promptConfiguration != null;

  // "documents" field.
  List<DocumentsStruct>? _documents;
  List<DocumentsStruct> get documents => _documents ?? const [];
  set documents(List<DocumentsStruct>? val) => _documents = val;

  void updateDocuments(Function(List<DocumentsStruct>) updateFn) {
    updateFn(_documents ??= []);
  }

  bool hasDocuments() => _documents != null;

  // "questions" field.
  List<String>? _questions;
  List<String> get questions => _questions ?? const [];
  set questions(List<String>? val) => _questions = val;

  void updateQuestions(Function(List<String>) updateFn) {
    updateFn(_questions ??= []);
  }

  bool hasQuestions() => _questions != null;

  // "read_only" field.
  String? _readOnly;
  String get readOnly => _readOnly ?? '';
  set readOnly(String? val) => _readOnly = val;

  bool hasReadOnly() => _readOnly != null;

  static ProjectDetailStruct fromMap(Map<String, dynamic> data) =>
      ProjectDetailStruct(
        projectName: data['project_name'] as String?,
        createdOn: data['created_on'] as String?,
        updatedOn: data['updated_on'] as String?,
        promptConfiguration: getStructList(
          data['prompt_configuration'],
          PromptConfigurationStruct.fromMap,
        ),
        documents: getStructList(
          data['documents'],
          DocumentsStruct.fromMap,
        ),
        questions: getDataList(data['questions']),
        readOnly: data['read_only'] as String?,
      );

  static ProjectDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'project_name': _projectName,
        'created_on': _createdOn,
        'updated_on': _updatedOn,
        'prompt_configuration':
            _promptConfiguration?.map((e) => e.toMap()).toList(),
        'documents': _documents?.map((e) => e.toMap()).toList(),
        'questions': _questions,
        'read_only': _readOnly,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'project_name': serializeParam(
          _projectName,
          ParamType.String,
        ),
        'created_on': serializeParam(
          _createdOn,
          ParamType.String,
        ),
        'updated_on': serializeParam(
          _updatedOn,
          ParamType.String,
        ),
        'prompt_configuration': serializeParam(
          _promptConfiguration,
          ParamType.DataStruct,
          isList: true,
        ),
        'documents': serializeParam(
          _documents,
          ParamType.DataStruct,
          isList: true,
        ),
        'questions': serializeParam(
          _questions,
          ParamType.String,
          isList: true,
        ),
        'read_only': serializeParam(
          _readOnly,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectDetailStruct(
        projectName: deserializeParam(
          data['project_name'],
          ParamType.String,
          false,
        ),
        createdOn: deserializeParam(
          data['created_on'],
          ParamType.String,
          false,
        ),
        updatedOn: deserializeParam(
          data['updated_on'],
          ParamType.String,
          false,
        ),
        promptConfiguration: deserializeStructParam<PromptConfigurationStruct>(
          data['prompt_configuration'],
          ParamType.DataStruct,
          true,
          structBuilder: PromptConfigurationStruct.fromSerializableMap,
        ),
        documents: deserializeStructParam<DocumentsStruct>(
          data['documents'],
          ParamType.DataStruct,
          true,
          structBuilder: DocumentsStruct.fromSerializableMap,
        ),
        questions: deserializeParam<String>(
          data['questions'],
          ParamType.String,
          true,
        ),
        readOnly: deserializeParam(
          data['read_only'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProjectDetailStruct &&
        projectName == other.projectName &&
        createdOn == other.createdOn &&
        updatedOn == other.updatedOn &&
        listEquality.equals(promptConfiguration, other.promptConfiguration) &&
        listEquality.equals(documents, other.documents) &&
        listEquality.equals(questions, other.questions) &&
        readOnly == other.readOnly;
  }

  @override
  int get hashCode => const ListEquality().hash([
        projectName,
        createdOn,
        updatedOn,
        promptConfiguration,
        documents,
        questions,
        readOnly
      ]);
}

ProjectDetailStruct createProjectDetailStruct({
  String? projectName,
  String? createdOn,
  String? updatedOn,
  String? readOnly,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectDetailStruct(
      projectName: projectName,
      createdOn: createdOn,
      updatedOn: updatedOn,
      readOnly: readOnly,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectDetailStruct? updateProjectDetailStruct(
  ProjectDetailStruct? projectDetail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectDetail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectDetailStructData(
  Map<String, dynamic> firestoreData,
  ProjectDetailStruct? projectDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectDetail == null) {
    return;
  }
  if (projectDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectDetail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectDetailData =
      getProjectDetailFirestoreData(projectDetail, forFieldValue);
  final nestedData =
      projectDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = projectDetail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectDetailFirestoreData(
  ProjectDetailStruct? projectDetail, [
  bool forFieldValue = false,
]) {
  if (projectDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectDetail.toMap());

  // Add any Firestore field values
  projectDetail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectDetailListFirestoreData(
  List<ProjectDetailStruct>? projectDetails,
) =>
    projectDetails
        ?.map((e) => getProjectDetailFirestoreData(e, true))
        .toList() ??
    [];
