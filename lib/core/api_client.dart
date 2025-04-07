import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/LocalizationController.dart';
import 'PreferenceUtils.dart';
import 'constants/app_constants.dart';
import 'model/error_response.dart';
import 'package:path/path.dart' as path;

class ApiClient {
  static var logoutFromInterceptors = false;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 40;

  ApiClient({required this.sharedPreferences});

  Future<Response> getData(String uri, {Map<String, dynamic>? query}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${PreferenceUtils.getToken()}');
      }
      http.Response response =
      await http.get(Uri.parse(AppConstants.appBaseUrl + uri), headers: {
        'content-type': 'application/json',
        'authorization': 'Bearer ${PreferenceUtils.getToken()}',
        'Accept-Language': '${Get.find<LocalizationController>().locale.languageCode}',

      }).timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      if (kDebugMode) {
        print('------------${e.toString()}');
      }
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody) async {
    if (kDebugMode) {
      print('====> API Call: $uri\nHeader: ');
      print('====> API Body: $body with ${multipartBody.length} picture');
    }
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(AppConstants.appBaseUrl + uri));
    request.headers.addAll({
      'content-type': 'application/json',
      'authorization': 'Bearer ${PreferenceUtils.getToken()}',
      'Accept-Language': '${Get.find<LocalizationController>().locale.languageCode}',
    });

    for (MultipartBody multipart in multipartBody) {
      if (multipart.file != null) {
        Uint8List list = await multipart.file!.readAsBytes();
        request.files.add(http.MultipartFile(
          multipart.key,
          multipart.file!.readAsBytes().asStream(),
          list.length,
          filename: path.basename(multipart.file!.path),
        ));
      }
    }
    request.fields.addAll(body);
    http.Response response = await http.Response.fromStream(await request.send());
    return handleResponse(response, uri);
  }

  Future<Response> postData(String uri,
      {Map<String, String>? headers, int? timeout, dynamic body}) async {
    try {
      http.Response response = await http
          .post(
        Uri.parse(AppConstants.appBaseUrl + uri),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer ${PreferenceUtils.getToken()}',
          'Accept-Language': '${Get.find<LocalizationController>().locale.languageCode}',


        },
        body: jsonEncode(body),
      )
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      print(AppConstants.appBaseUrl + uri);
      print('jsonEncode(body) ${jsonEncode(body)}');
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri,
      {Map<String, String>? headers, int? timeout, dynamic body}) async {
    try {
      http.Response response = await http
          .put(
        Uri.parse(AppConstants.appBaseUrl + uri),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer ${PreferenceUtils.getToken()}',
          'Accept-Language': '${Get.find<LocalizationController>().locale.languageCode}',


        },
        body: jsonEncode(body),
      )
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      print(AppConstants.appBaseUrl + uri);
      print('jsonEncode(body) ${jsonEncode(body)}');
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> patchData(String uri,
      {Map<String, String>? headers, int? timeout, dynamic body}) async {
    try {
      http.Response response = await http
          .patch(
        Uri.parse(AppConstants.appBaseUrl + uri),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer ${PreferenceUtils.getToken()}',
          'Accept-Language': '${Get.find<LocalizationController>().locale.languageCode}',

        },
        body: jsonEncode(body),
      )
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers, int? timeout, dynamic body}) async {
    try {
      http.Response response = await http
          .delete(
        Uri.parse(AppConstants.appBaseUrl + uri),
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer ${PreferenceUtils.getToken()}',
          'Accept-Language': '${Get.find<LocalizationController>().locale.languageCode}',


        },
        body: jsonEncode(body),
      )
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      if (response.headers['content-type']?.contains('application/json') ??
          false) {
        body = jsonDecode(response.body);
      } else {
        return Response(
          statusCode: response.statusCode,
          statusText:
          'Unexpected content type: ${response.headers['content-type']}',
        );
      }
    } catch (e) {
      return Response(
        statusCode: response.statusCode,
        statusText: 'Failed to decode response body',
      );
    }

    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
        headers: response.request!.headers,
        method: response.request!.method,
        url: response.request!.url,
      ),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );

    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(
          statusCode: response0.statusCode,
          body: response0.body,
          statusText: errorResponse.errors![0].message,
        );
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
          statusCode: response0.statusCode,
          body: response0.body,
          statusText: response0.body['message'],
        );
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = Response(statusCode: 0, statusText: noInternetMessage);
    }

    if (kDebugMode) {
      print('====> API Response: [${response0.statusCode}] $uri');
      if (response.statusCode != 500) {
        print('${response0.body}');
      }
    }

    return response0;
  }
}
class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}