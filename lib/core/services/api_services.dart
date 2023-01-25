import 'dart:convert';

import 'package:cleanarcitecture113/core/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class ApiService{
  Future<Map<String,dynamic>> getData(String url,Map<String,dynamic> queryParams);
}
class ApiServiceImpl implements ApiService {

  final Dio _dio = sl<Dio>();


  @override
  Future<Map<String, dynamic>> getData(String url,Map<String,dynamic> queryParams) async {

    final Response response = await _dio.get(url,queryParameters: queryParams);
    // final http.Response response = await http.get(Uri.parse(url).replace(
    //   queryParameters: queryParams,
    // ));
    if(response.statusCode ==200 ){
      return response.data as Map<String,dynamic>;
      // return json.decode(response.data) as Map<String,dynamic>;
    }else{
      throw Exception("Status code: ${response.statusCode}");
    }
  }
}