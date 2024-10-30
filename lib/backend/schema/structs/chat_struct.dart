// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends FFFirebaseStruct {
  ChatStruct({
    String? message,
    bool? isAi,
    String? responseId,
    bool? isDebugVisible,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _isAi = isAi,
        _responseId = responseId,
        _isDebugVisible = isDebugVisible,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "is_ai" field.
  bool? _isAi;
  bool get isAi => _isAi ?? false;
  set isAi(bool? val) => _isAi = val;

  bool hasIsAi() => _isAi != null;

  // "response_id" field.
  String? _responseId;
  String get responseId => _responseId ?? '';
  set responseId(String? val) => _responseId = val;

  bool hasResponseId() => _responseId != null;

  // "isDebugVisible" field.
  bool? _isDebugVisible;
  bool get isDebugVisible => _isDebugVisible ?? true;
  set isDebugVisible(bool? val) => _isDebugVisible = val;

  bool hasIsDebugVisible() => _isDebugVisible != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        message: data['message'] as String?,
        isAi: data['is_ai'] as bool?,
        responseId: data['response_id'] as String?,
        isDebugVisible: data['isDebugVisible'] as bool?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'is_ai': _isAi,
        'response_id': _responseId,
        'isDebugVisible': _isDebugVisible,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'is_ai': serializeParam(
          _isAi,
          ParamType.bool,
        ),
        'response_id': serializeParam(
          _responseId,
          ParamType.String,
        ),
        'isDebugVisible': serializeParam(
          _isDebugVisible,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        isAi: deserializeParam(
          data['is_ai'],
          ParamType.bool,
          false,
        ),
        responseId: deserializeParam(
          data['response_id'],
          ParamType.String,
          false,
        ),
        isDebugVisible: deserializeParam(
          data['isDebugVisible'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStruct &&
        message == other.message &&
        isAi == other.isAi &&
        responseId == other.responseId &&
        isDebugVisible == other.isDebugVisible;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([message, isAi, responseId, isDebugVisible]);
}

ChatStruct createChatStruct({
  String? message,
  bool? isAi,
  String? responseId,
  bool? isDebugVisible,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatStruct(
      message: message,
      isAi: isAi,
      responseId: responseId,
      isDebugVisible: isDebugVisible,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatStruct? updateChatStruct(
  ChatStruct? chat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatStructData(
  Map<String, dynamic> firestoreData,
  ChatStruct? chat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chat == null) {
    return;
  }
  if (chat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && chat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatData = getChatFirestoreData(chat, forFieldValue);
  final nestedData = chatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatFirestoreData(
  ChatStruct? chat, [
  bool forFieldValue = false,
]) {
  if (chat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chat.toMap());

  // Add any Firestore field values
  chat.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatListFirestoreData(
  List<ChatStruct>? chats,
) =>
    chats?.map((e) => getChatFirestoreData(e, true)).toList() ?? [];
