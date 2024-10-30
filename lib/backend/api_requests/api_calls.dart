import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Talk Docs Group Code

class TalkDocsGroup {
  static String getBaseUrl() =>
      'https://t2x-api-1099239419018.us-central1.run.app';
  // static String getBaseUrl() =>
  //     'https://test-misha-deploy-841488258821.us-central1.run.app';
  static Map<String, String> headers = {};
  static CreateProjectCall createProjectCall = CreateProjectCall();
  static ProjectDetailsCall projectDetailsCall = ProjectDetailsCall();
  static ChangePromptCall changePromptCall = ChangePromptCall();
  static AllProjectsCall allProjectsCall = AllProjectsCall();
  static ImportStatusCall importStatusCall = ImportStatusCall();
  static ChatCall chatCall = ChatCall();
  static GetExtractedDocCall getExtractedDocCall = GetExtractedDocCall();
  static PreviousChatCall previousChatCall = PreviousChatCall();
  static RemoveDocumentsCall removeDocumentsCall = RemoveDocumentsCall();
  static DebugResponseCall debugResponseCall = DebugResponseCall();
  static ClearChatCall clearChatCall = ClearChatCall();
  static UploadFilesToProjectCall uploadFilesToProjectCall =
      UploadFilesToProjectCall();
}

class CreateProjectCall {
  Future<ApiCallResponse> call({
    String? projectName = '',
    String? userId = '',
    List<FFUploadedFile>? filesList,
    String? questions = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();
    final files = filesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'CreateProject',
      apiUrl: '${baseUrl}/create_project/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'project_name': projectName,
        'user_id': userId,
        'files': files,
        'questions': questions,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProjectDetailsCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? userId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ProjectDetails',
      apiUrl: '${baseUrl}/project_details/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'project_id': projectId,
        'user_id': userId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? projectDetail(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  List? promptConfigList(dynamic response) => getJsonField(
        response,
        r'''$.prompt_configuration''',
        true,
      ) as List?;
  List? docsList(dynamic response) => getJsonField(
        response,
        r'''$.documents''',
        true,
      ) as List?;
  List<String>? questionsList(dynamic response) => (getJsonField(
        response,
        r'''$.questions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ChangePromptCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? userId = '',
    String? promptName = '',
    String? promptValue = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ChangePrompt',
      apiUrl: '${baseUrl}/change_prompt/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'project_id': projectId,
        'user_id': userId,
        'prompt_name': promptName,
        'prompt_value': promptValue,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllProjectsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'AllProjects',
      apiUrl: '${baseUrl}/all_projects/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? projectsList(dynamic response) => getJsonField(
        response,
        r'''$.all_projects''',
        true,
      ) as List?;
}

class ImportStatusCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? projectId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "client_project_id": "${projectId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ImportStatus',
      apiUrl: '${baseUrl}/import_status',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? pendingLRO(dynamic response) => (getJsonField(
        response,
        r'''$.lros_pending_list''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ChatCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? userId = '',
    String? clientProjectId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Chat',
      apiUrl: '${baseUrl}/chat/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'message': message,
        'user_id': userId,
        'client_project_id': clientProjectId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetExtractedDocCall {
  Future<ApiCallResponse> call({
    String? documentId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getExtractedDoc',
      apiUrl: '${baseUrl}/document/${documentId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'document_id': documentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? documentId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.document_id''',
      ));
  String? context(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.context''',
      ));
}

class PreviousChatCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? clientProjectId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "client_project_id": "${clientProjectId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PreviousChat',
      apiUrl: '${baseUrl}/previous_chat/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveDocumentsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? documentId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "document_ids": [
    "${documentId}"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RemoveDocuments',
      apiUrl: '${baseUrl}/remove_documents',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DebugResponseCall {
  Future<ApiCallResponse> call({
    String? responseId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'DebugResponse',
      apiUrl: '${baseUrl}/debug_response/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'response_id': responseId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? previousContext(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.previous_context''',
      ));
  String? question(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.question''',
      ));
  String? finalResponse(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.final_response''',
      ));
  int? confidenceScore(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.confidence_score''',
      ));
  String? timeTaken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.time_taken''',
      ));
  List? roundsInfoList(dynamic response) => getJsonField(
        response,
        r'''$.rounds_information''',
        true,
      ) as List?;
  List<String>? roundDocsList(dynamic response) => (getJsonField(
        response,
        r'''$.rounds_information[:].retrieved_document_details''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ClearChatCall {
  Future<ApiCallResponse> call({
    String? clientProjectId = '',
    String? userId = '',
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ClearChat',
      apiUrl: '${baseUrl}/clear_chat/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'client_project_id': clientProjectId,
        'user_id': userId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class UploadFilesToProjectCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? clientProjectId = '',
    List<FFUploadedFile>? filesList,
  }) async {
    final baseUrl = TalkDocsGroup.getBaseUrl();
    final files = filesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'UploadFilesToProject',
      apiUrl: '${baseUrl}/index_files',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'user_id': userId,
        'client_project_id': clientProjectId,
        'files': files,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Talk Docs Group Code

class UploadFileCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? filename,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'uploadFile',
      apiUrl: 'https://v2.convertapi.com/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'filename': filename,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
