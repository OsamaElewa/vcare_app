

 // base url : https://newsapi.org/
// method (url) : v2/top-headlines?
 // queries : country=eg&category=business&apiKey=5de91158e349434ba986828607121ed3
 //https://newsapi.org/v2/everything?q=tesla&apiKey=5de91158e349434ba986828607121ed3

 import 'package:dio/dio.dart';

class DioHelper{
  static Dio dio=Dio();
  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://vcare.integration25.com/api/',
        receiveDataWhenStatusError: true,
        // headers:{
        //   'Accept' : 'application/json',
        //   'AUTHORIZATION' : token
        // },
      ),

    );
  }
  static Future<Response> getData({
  required String url,
  Map<String,dynamic>? query,
  String lang='en',
  String? token,
}) async
  {
    dio.options.headers={
      'Authorization':'bearer $token' ?? '',
      'Accept' : 'application/json',
    };
    return await dio.get(url);
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String? token,
  }) async
  {
    dio.options.headers={
      'Authorization':'bearer $token' ?? '',
      'Accept' : 'application/json',
    };
    return dio.post(url,queryParameters: query,data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang='en',
    String? token,
  }) async
  {
    dio.options.headers={
      'Authorization':token,
    };
    return dio.put(url,queryParameters: query,data: data);
  }
 }