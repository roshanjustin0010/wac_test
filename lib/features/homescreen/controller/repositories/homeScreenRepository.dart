import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:wac_test/constants/apiConstants.dart';
import 'package:wac_test/constants/appConstants.dart';

class HomeScreenRepositories {
  Future<Either<ApiExceptions, dynamic>> homeScreenRepositories() async {
    final response = await http.get(Uri.parse(ApiConstants.apiBaseUrl));
    try {
      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        return const Left(ApiExceptions.ServerError);
      }
    } catch (e) {
      return const Left(ApiExceptions.NetworkError);
      ;
    }
  }
}
