// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentsStruct extends FFFirebaseStruct {
  DocumentsStruct({
    String? documentId,
    String? documentFilename,
    String? documentClientProjectId,
    String? documentUri,
    bool? isAddDocBtn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _documentId = documentId,
        _documentFilename = documentFilename,
        _documentClientProjectId = documentClientProjectId,
        _documentUri = documentUri,
        _isAddDocBtn = isAddDocBtn,
        super(firestoreUtilData);

  // "document_id" field.
  String? _documentId;
  String get documentId => _documentId ?? '';
  set documentId(String? val) => _documentId = val;

  bool hasDocumentId() => _documentId != null;

  // "document_filename" field.
  String? _documentFilename;
  String get documentFilename => _documentFilename ?? '';
  set documentFilename(String? val) => _documentFilename = val;

  bool hasDocumentFilename() => _documentFilename != null;

  // "document_client_project_id" field.
  String? _documentClientProjectId;
  String get documentClientProjectId => _documentClientProjectId ?? '';
  set documentClientProjectId(String? val) => _documentClientProjectId = val;

  bool hasDocumentClientProjectId() => _documentClientProjectId != null;

  // "document_uri" field.
  String? _documentUri;
  String get documentUri => _documentUri ?? '';
  set documentUri(String? val) => _documentUri = val;

  bool hasDocumentUri() => _documentUri != null;

  // "isAddDocBtn" field.
  bool? _isAddDocBtn;
  bool get isAddDocBtn => _isAddDocBtn ?? false;
  set isAddDocBtn(bool? val) => _isAddDocBtn = val;

  bool hasIsAddDocBtn() => _isAddDocBtn != null;

  static DocumentsStruct fromMap(Map<String, dynamic> data) => DocumentsStruct(
        documentId: data['document_id'] as String?,
        documentFilename: data['document_filename'] as String?,
        documentClientProjectId: data['document_client_project_id'] as String?,
        documentUri: data['document_uri'] as String?,
        isAddDocBtn: data['isAddDocBtn'] as bool?,
      );

  static DocumentsStruct? maybeFromMap(dynamic data) => data is Map
      ? DocumentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'document_id': _documentId,
        'document_filename': _documentFilename,
        'document_client_project_id': _documentClientProjectId,
        'document_uri': _documentUri,
        'isAddDocBtn': _isAddDocBtn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'document_id': serializeParam(
          _documentId,
          ParamType.String,
        ),
        'document_filename': serializeParam(
          _documentFilename,
          ParamType.String,
        ),
        'document_client_project_id': serializeParam(
          _documentClientProjectId,
          ParamType.String,
        ),
        'document_uri': serializeParam(
          _documentUri,
          ParamType.String,
        ),
        'isAddDocBtn': serializeParam(
          _isAddDocBtn,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DocumentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DocumentsStruct(
        documentId: deserializeParam(
          data['document_id'],
          ParamType.String,
          false,
        ),
        documentFilename: deserializeParam(
          data['document_filename'],
          ParamType.String,
          false,
        ),
        documentClientProjectId: deserializeParam(
          data['document_client_project_id'],
          ParamType.String,
          false,
        ),
        documentUri: deserializeParam(
          data['document_uri'],
          ParamType.String,
          false,
        ),
        isAddDocBtn: deserializeParam(
          data['isAddDocBtn'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DocumentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DocumentsStruct &&
        documentId == other.documentId &&
        documentFilename == other.documentFilename &&
        documentClientProjectId == other.documentClientProjectId &&
        documentUri == other.documentUri &&
        isAddDocBtn == other.isAddDocBtn;
  }

  @override
  int get hashCode => const ListEquality().hash([
        documentId,
        documentFilename,
        documentClientProjectId,
        documentUri,
        isAddDocBtn
      ]);
}

DocumentsStruct createDocumentsStruct({
  String? documentId,
  String? documentFilename,
  String? documentClientProjectId,
  String? documentUri,
  bool? isAddDocBtn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DocumentsStruct(
      documentId: documentId,
      documentFilename: documentFilename,
      documentClientProjectId: documentClientProjectId,
      documentUri: documentUri,
      isAddDocBtn: isAddDocBtn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DocumentsStruct? updateDocumentsStruct(
  DocumentsStruct? documents, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    documents
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDocumentsStructData(
  Map<String, dynamic> firestoreData,
  DocumentsStruct? documents,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (documents == null) {
    return;
  }
  if (documents.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && documents.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final documentsData = getDocumentsFirestoreData(documents, forFieldValue);
  final nestedData = documentsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = documents.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDocumentsFirestoreData(
  DocumentsStruct? documents, [
  bool forFieldValue = false,
]) {
  if (documents == null) {
    return {};
  }
  final firestoreData = mapToFirestore(documents.toMap());

  // Add any Firestore field values
  documents.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDocumentsListFirestoreData(
  List<DocumentsStruct>? documentss,
) =>
    documentss?.map((e) => getDocumentsFirestoreData(e, true)).toList() ?? [];
