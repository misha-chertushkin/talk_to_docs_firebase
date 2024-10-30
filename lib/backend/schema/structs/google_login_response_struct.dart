// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleLoginResponseStruct extends FFFirebaseStruct {
  GoogleLoginResponseStruct({
    String? displayName,
    String? photoUrl,
    String? id,
    String? email,
    String? serverAuthCode,
    String? errorMsg,
    bool? responseStatus,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _displayName = displayName,
        _photoUrl = photoUrl,
        _id = id,
        _email = email,
        _serverAuthCode = serverAuthCode,
        _errorMsg = errorMsg,
        _responseStatus = responseStatus,
        _image = image,
        super(firestoreUtilData);

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "serverAuthCode" field.
  String? _serverAuthCode;
  String get serverAuthCode => _serverAuthCode ?? '';
  set serverAuthCode(String? val) => _serverAuthCode = val;

  bool hasServerAuthCode() => _serverAuthCode != null;

  // "errorMsg" field.
  String? _errorMsg;
  String get errorMsg => _errorMsg ?? '';
  set errorMsg(String? val) => _errorMsg = val;

  bool hasErrorMsg() => _errorMsg != null;

  // "responseStatus" field.
  bool? _responseStatus;
  bool get responseStatus => _responseStatus ?? false;
  set responseStatus(bool? val) => _responseStatus = val;

  bool hasResponseStatus() => _responseStatus != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static GoogleLoginResponseStruct fromMap(Map<String, dynamic> data) =>
      GoogleLoginResponseStruct(
        displayName: data['displayName'] as String?,
        photoUrl: data['photoUrl'] as String?,
        id: data['id'] as String?,
        email: data['email'] as String?,
        serverAuthCode: data['serverAuthCode'] as String?,
        errorMsg: data['errorMsg'] as String?,
        responseStatus: data['responseStatus'] as bool?,
        image: data['image'] as String?,
      );

  static GoogleLoginResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? GoogleLoginResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'displayName': _displayName,
        'photoUrl': _photoUrl,
        'id': _id,
        'email': _email,
        'serverAuthCode': _serverAuthCode,
        'errorMsg': _errorMsg,
        'responseStatus': _responseStatus,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'displayName': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'photoUrl': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'serverAuthCode': serializeParam(
          _serverAuthCode,
          ParamType.String,
        ),
        'errorMsg': serializeParam(
          _errorMsg,
          ParamType.String,
        ),
        'responseStatus': serializeParam(
          _responseStatus,
          ParamType.bool,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static GoogleLoginResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GoogleLoginResponseStruct(
        displayName: deserializeParam(
          data['displayName'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photoUrl'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        serverAuthCode: deserializeParam(
          data['serverAuthCode'],
          ParamType.String,
          false,
        ),
        errorMsg: deserializeParam(
          data['errorMsg'],
          ParamType.String,
          false,
        ),
        responseStatus: deserializeParam(
          data['responseStatus'],
          ParamType.bool,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GoogleLoginResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoogleLoginResponseStruct &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        id == other.id &&
        email == other.email &&
        serverAuthCode == other.serverAuthCode &&
        errorMsg == other.errorMsg &&
        responseStatus == other.responseStatus &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([
        displayName,
        photoUrl,
        id,
        email,
        serverAuthCode,
        errorMsg,
        responseStatus,
        image
      ]);
}

GoogleLoginResponseStruct createGoogleLoginResponseStruct({
  String? displayName,
  String? photoUrl,
  String? id,
  String? email,
  String? serverAuthCode,
  String? errorMsg,
  bool? responseStatus,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GoogleLoginResponseStruct(
      displayName: displayName,
      photoUrl: photoUrl,
      id: id,
      email: email,
      serverAuthCode: serverAuthCode,
      errorMsg: errorMsg,
      responseStatus: responseStatus,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GoogleLoginResponseStruct? updateGoogleLoginResponseStruct(
  GoogleLoginResponseStruct? googleLoginResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    googleLoginResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGoogleLoginResponseStructData(
  Map<String, dynamic> firestoreData,
  GoogleLoginResponseStruct? googleLoginResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (googleLoginResponse == null) {
    return;
  }
  if (googleLoginResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && googleLoginResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final googleLoginResponseData =
      getGoogleLoginResponseFirestoreData(googleLoginResponse, forFieldValue);
  final nestedData =
      googleLoginResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      googleLoginResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGoogleLoginResponseFirestoreData(
  GoogleLoginResponseStruct? googleLoginResponse, [
  bool forFieldValue = false,
]) {
  if (googleLoginResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(googleLoginResponse.toMap());

  // Add any Firestore field values
  googleLoginResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGoogleLoginResponseListFirestoreData(
  List<GoogleLoginResponseStruct>? googleLoginResponses,
) =>
    googleLoginResponses
        ?.map((e) => getGoogleLoginResponseFirestoreData(e, true))
        .toList() ??
    [];
