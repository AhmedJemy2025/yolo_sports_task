import 'dart:developer';

import 'package:core/core.dart';
import 'package:dio/dio.dart';

export 'package:flutter_modular/flutter_modular.dart';

class NetworkHandler {
  final Dio dio;

  NetworkHandler(this.dio);

  Future<NetworkResponse<ResponseType>> get<ResponseType extends Mappable>(ResponseType responseType, String url, {var body}) async {
    var response;
    try {
      response = await dio.get(url, queryParameters: body);
      print("***************GET $url , query: $body ***************");
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> post<ResponseType extends Mappable>(ResponseType responseType, String url, {var body, encoding}) async {
    var response;
    print("*************** POST $url , body: $body ***************");

    try {
      dio.options.headers = {'Content-Type': 'application/json'};

      response = await dio.post(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      //  print(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> postAuth<ResponseType extends Mappable>(ResponseType responseType, String url, {var body, encoding}) async {
    var response;
    print("***************POST $url , body: $body ***************");

    try {
      dio.options.headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      response = await dio.post(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      //  print(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> put<ResponseType extends Mappable>(ResponseType responseType, String url,
      {var body, encoding, Map<String, String>? headers}) async {
    var response;
    print("*************** PUT $url , body: $body ***************  ");

    try {
      if (headers != null) {
        dio.options.headers = headers;
      }
      response = await dio.put(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      //  print(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> delete<ResponseType extends Mappable>(ResponseType responseType, String url, {var body, encoding}) async {
    var response;
    print("*************** Delete $url , body: $body ***************  ");

    try {
      response = await dio.delete(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  NetworkResponse<ResponseType> handleResponse<ResponseType extends Mappable>(Response response, ResponseType responseType) {
    print(response);
    try {
      final int statusCode = response.statusCode!;
      if (statusCode != 200) {
        log("RESPONSE   ${response.data}");
      }
      if (statusCode >= 200 && statusCode < 300) {
        // print("correrct request: " + response.toString());
        if (responseType is ListMappable) {
          return NetworkResponse<ResponseType>(Mappable(responseType, response.data) as ResponseType, true, "");
        } else {
          return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, true, "");
        }
      } else if (statusCode == 401) {
        return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, response.data['status_message']);
      } else if (statusCode == 404) {
        return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, response.data['status_message']);
      } else {
        return NetworkResponse<ResponseType>(
            Mappable(responseType, response) as ResponseType,
            false,
            // response.data['error_description']
            response.data['status_message'] ??"unexpected error");
      }
    } on DioError catch (e) {
      // print(e.toString());
      // if (e.response != null) {
      //   response = e.response;
      // }
      return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, e.message);
    } catch (e) {
      return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, e.toString());
    }
  }
}
