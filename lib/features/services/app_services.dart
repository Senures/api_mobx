import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app_mobx/core/entity/detail_models.dart';
import 'package:movie_app_mobx/core/entity/popular_movie_models.dart';
import 'package:movie_app_mobx/core/init/dio_init.dart';
import 'package:movie_app_mobx/main.dart';

import '../../core/const/apikey.dart';

class AppServices {
  // Dio dio=NetworkManagerDio.instance.dio;

  Future<PopularMoviesResponse?> getPopularMovie() async {
    var response = await dio.get(
      "popular?api_key=$API_KEY&language=en-US&page=1",
    );

    if (response.statusCode == 200) {
      return PopularMoviesResponse.fromJson(response.data);
    } else {
      log("NEW RELEASES ERROR ===  ${response.statusCode}");
    }

    return null;
  }
   Future<DetailResponse?> getDetailMovie(String id) async {
    var response = await dio.get(
      "$id?api_key=eb2dfe5fb23e1bdcd3dbf005750c38be&language=en-US",
    );

    if (response.statusCode == 200) {
      return DetailResponse.fromJson(response.data);
    } else {
      log("NEW RELEASES ERROR ===  ${response.statusCode}");
    }

    return null;
  }
}
