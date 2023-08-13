import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/check_internet.dart';


import 'package:http/http.dart' as http;

class Crud {
Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
  try {
    if (await checkInternet()) {
      var headers = {
        'Content-Type': 'application/json', // Set the Content-Type header
      };

      var response = await http.post(
        Uri.parse(linkurl),
        headers: headers, // Pass the headers to the post method
        body: jsonEncode(data),

      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        // print(responseBody);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  } catch (_) {
    return const Left(StatusRequest.expectionFailure);
  }
}

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
              var headers = {
        'Content-Type': 'application/json', // Set the Content-Type header
      };
        var response = await http.get(
          Uri.parse(linkurl),
          headers: headers,
          
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          // print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.expectionFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  // Future<dynamic> get({required String url, @required String? token}) async {
  //   Map<String, String> headers = {};

  //   http.Response response = await http.get(Uri.parse(url), headers: headers);
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception(
  //         'there is a problem with status code ${response.statusCode}');
  //   }
  // }
}
