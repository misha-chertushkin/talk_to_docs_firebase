// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatListModelStruct extends FFFirebaseStruct {
  ChatListModelStruct({
    String? projectName,
    List<ChatStruct>? chatList,
    List<String>? questions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectName = projectName,
        _chatList = chatList,
        _questions = questions,
        super(firestoreUtilData);

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  // "chat_list" field.
  List<ChatStruct>? _chatList;
  List<ChatStruct> get chatList => _chatList ?? const [];
  set chatList(List<ChatStruct>? val) => _chatList = val;

  void updateChatList(Function(List<ChatStruct>) updateFn) {
    updateFn(_chatList ??= []);
  }

  bool hasChatList() => _chatList != null;

  // "questions" field.
  List<String>? _questions;
  List<String> get questions => _questions ?? const [];
  set questions(List<String>? val) => _questions = val;

  void updateQuestions(Function(List<String>) updateFn) {
    updateFn(_questions ??= []);
  }

  bool hasQuestions() => _questions != null;

  static ChatListModelStruct fromMap(Map<String, dynamic> data) =>
      ChatListModelStruct(
        projectName: data['project_name'] as String?,
        chatList: getStructList(
          data['chat_list'],
          ChatStruct.fromMap,
        ),
        questions: getDataList(data['questions']),
      );

  static ChatListModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatListModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'project_name': _projectName,
        'chat_list': _chatList?.map((e) => e.toMap()).toList(),
        'questions': _questions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'project_name': serializeParam(
          _projectName,
          ParamType.String,
        ),
        'chat_list': serializeParam(
          _chatList,
          ParamType.DataStruct,
          isList: true,
        ),
        'questions': serializeParam(
          _questions,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ChatListModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatListModelStruct(
        projectName: deserializeParam(
          data['project_name'],
          ParamType.String,
          false,
        ),
        chatList: deserializeStructParam<ChatStruct>(
          data['chat_list'],
          ParamType.DataStruct,
          true,
          structBuilder: ChatStruct.fromSerializableMap,
        ),
        questions: deserializeParam<String>(
          data['questions'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ChatListModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatListModelStruct &&
        projectName == other.projectName &&
        listEquality.equals(chatList, other.chatList) &&
        listEquality.equals(questions, other.questions);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([projectName, chatList, questions]);
}

ChatListModelStruct createChatListModelStruct({
  String? projectName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatListModelStruct(
      projectName: projectName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatListModelStruct? updateChatListModelStruct(
  ChatListModelStruct? chatListModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatListModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatListModelStructData(
  Map<String, dynamic> firestoreData,
  ChatListModelStruct? chatListModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatListModel == null) {
    return;
  }
  if (chatListModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatListModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatListModelData =
      getChatListModelFirestoreData(chatListModel, forFieldValue);
  final nestedData =
      chatListModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatListModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatListModelFirestoreData(
  ChatListModelStruct? chatListModel, [
  bool forFieldValue = false,
]) {
  if (chatListModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatListModel.toMap());

  // Add any Firestore field values
  chatListModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatListModelListFirestoreData(
  List<ChatListModelStruct>? chatListModels,
) =>
    chatListModels
        ?.map((e) => getChatListModelFirestoreData(e, true))
        .toList() ??
    [];
