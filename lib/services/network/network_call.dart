import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'package:equatable_testing/constants/constants.dart';
import 'package:equatable_testing/helpers/gt_exception.dart';
import 'package:equatable_testing/helpers/url_helper.dart';
import 'package:equatable_testing/services/services.dart';

import '../../models/access_token/access_token_data.dart';
import '../../models/api_failure.dart';
import '../../models/login/login_response.dart';

class NetworkCall extends INetworkService {
  NetworkCall({
    required IStorageService storage,
    required ApplicationService appService,
    required Client client,
  })
      : _client = client,
        _storage = storage,
        _appService = appService;

  final Client _client;
  final IStorageService _storage;
  final ApplicationService _appService;

  static const _header = {Api.headerContentTypeKey: Api.headerContentTypeValue};
  static const _timeout = Duration(milliseconds: Api.connectionTimeout);

  @override
  Future get({
    required String path,
    Map<String, String>? header,
  }) async {
    dynamic responseJson = {};
    try {
      final uri = Uri.parse(path);
      final _response =
      await _client.get(uri, headers: _header).timeout(_timeout);
      responseJson = _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future<Response> post({
    required String path,
    data,
    Map<String, String>? header,
  }) async {
    dynamic responseJson = {};
    try {
      final _response = await _client
          .post(
        Uri.parse(path),
        headers: _header,
        body: jsonEncode(data),
      )
          .timeout(_timeout);
      responseJson = _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future gaurdedGet({
    required String path,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
    bool useCookie = false,
  }) async {
    final _baseUrl = baseURL ?? await _loadBaseURL();
    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
      useCookie: useCookie,
    );
    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response =
      await _client.get(uri, headers: _headers).timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future gaurdedPut({
    required String path,
    data,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  }) async {
    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
    );
    final _baseUrl = baseURL ?? await _loadBaseURL();

    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response = await _client
          .put(
        uri,
        headers: _headers,
        body: data,
      )
          .timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future guardedPatch({
    required String path,
    dynamic data,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  }) async {
    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
    );
    final _baseUrl = baseURL ?? await _loadBaseURL();

    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response = await _client
          .patch(
        uri,
        headers: _headers,
        body: data,
      )
          .timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future<Response> gaurdedPost({
    required String path,
    data,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  }) async {
    final _baseUrl = baseURL ?? await _loadBaseURL();

    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
    );
    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response = await _client
          .post(
        uri,
        headers: _headers,
        body: data,
      )
          .timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future gaurdedDelete({
    required String path,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
    bool useCookie = false,
  }) async {
    final _baseUrl = baseURL ?? await _loadBaseURL();
    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
      useCookie: useCookie,
    );
    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response =
      await _client.delete(uri, headers: _headers).timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  Future<LoginResponse> _loadAuthData() async {
    late LoginResponse authData;

    if (_appService.state.userInfo == null ||
        _appService.state.userInfo == LoginResponse.empty()) {
      final userInfo = _storage.readString(key: PreferencesKeys.sLoginData);
      authData = LoginResponse.fromJson(jsonDecode(userInfo));
    } else {
      authData = _appService.state.userInfo!;
    }

    return authData;
  }

  Future<Map<String, String>> _createHeader({
    Map<String, String>? header,
    bool accessToken = true,
    bool useCookie = false,
  }) async {
    var token = '';
    header ??= {};
    if (useCookie) {
      final _cookie = _storage.readString(key: PreferencesKeys.sCookie);
      header[Api.headerContentTypeKey] = Api.headerContentTypeValue;
      header[Api.headerCookieKey] = _cookie;
      return header;
    } else {
      if (accessToken) {
        final _accessTokenInfo = await _loadAccessTokenData();
        token = _accessTokenInfo.accessToken;
      } else {
        final _authData = await _loadAuthData();
        token = _authData.idToken;
      }
      header[Api.headerContentTypeKey] = Api.headerContentTypeValue;
      header[Api.headerAuthKey] = Api.authBearer + token;
      return header;
    }
  }

  Future<AccessTokenData> _loadAccessTokenData() async {
    late AccessTokenData accessData;

    if (_appService.state.accessTokenInfo == null ||
        _appService.state.accessTokenInfo == AccessTokenData.empty()) {
      final _accessToken =
      _storage.readString(key: PreferencesKeys.sAccessTokenData);
      accessData = AccessTokenData.fromJson(jsonDecode(_accessToken));
    } else {
      accessData = _appService.state.accessTokenInfo!;
    }

    return accessData;
  }

  Future<String> _loadBaseURL() async {
    final url = _appService.getBaseUrl();

    return ExtoURLHelpers.getRestApiURL(url);
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        final message = _getErrorMessage(response);
        throw BadRequestException(message);
      case 401:
      case 403:
        final message = _getErrorMessage(response);
        throw UnauthorisedException(message);
      case 500:
      case 503:
      case 404:
      case 422:
      default:
        final message = _getErrorMessage(response);
        throw GTException(message, '');
    }
  }

  String _getErrorMessage(Response response) {
    var _errorMessage = '';
    try {
      final _apiFailure = ApiFailure.fromJson(
        jsonDecode(response.body.toString()),
      );
      final _error = _apiFailure.error;
      if (_error.mainForms.isNotEmpty || _error.subForms.isNotEmpty) {
        _errorMessage = jsonEncode(_error.toJson());
      } else if (_error.detail.isNotEmpty) {
        _errorMessage = _error.detail.join('\n');
      } else {
        _errorMessage = '${_error.summary}: ${Strings.unknownError}';
      }
    } catch (e) {
      try {
        _errorMessage =
            jsonDecode(response.body)['message'] ?? Strings.unknownError;
      } catch (_) {
        _errorMessage = response.body.replaceAll('"', '');
      }
    }
    return _errorMessage;
  }

  @override
  Future<Response> upload({
    required String path,
    required Map<String, dynamic> formData,
    String? baseURL,
    Map<String, String>? header,
  }) async {
    final _headers = await _createHeader(header: header);
    final _baseUrl = baseURL ?? await _loadBaseURL();

    dynamic responseJson = {};

    try {
      final url = Uri.parse(_baseUrl + path);
      var request = MultipartRequest(PreferencesKeys.postKeyWord, url);
      request.files.add(
        await MultipartFile.fromPath(
          PreferencesKeys.fileKeyWord,
          formData[Api.uploadFile],
        ),
      );

      request.fields[Api.uploadFileSize] =
          formData[Api.uploadFileSize].toString();

      request.fields[Api.uploadModule] = formData[Api.uploadModule];

      if (formData[Api.uploadID] != null) {
        request.fields[Api.uploadID] = formData[Api.uploadID];
      }

      if (formData[Api.uploadLinkedRefID] != null) {
        request.fields[Api.uploadLinkedRefID] = formData[Api.uploadLinkedRefID];
      }

      if (formData[Api.uploadParentID] != null) {
        request.fields[Api.uploadParentID] = formData[Api.uploadParentID];
      }

      if (formData[Api.uploadMeta] != null) {
        request.fields[Api.uploadMeta] = formData[Api.uploadMeta];
      }
      request.headers.addAll(_headers);

      final streamedResponse = await request.send();
      var response = await Response.fromStream(streamedResponse);
      responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
