import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app_mobx/core/entity/detail_models.dart';
import 'package:movie_app_mobx/core/entity/genresId_models.dart';
import 'package:movie_app_mobx/core/entity/genres_models.dart';
import 'package:movie_app_mobx/core/entity/now_playing.dart';
import 'package:movie_app_mobx/core/entity/popular_movie_models.dart';
import 'package:movie_app_mobx/core/init/dio_init.dart';
import 'package:movie_app_mobx/main.dart';

import '../../core/const/apikey.dart';

class AppServices {
  // Dio dio=NetworkManagerDio.instance.dio;

  Future<PopularMoviesResponse?> getPopularMovie() async {
    var response = await dio.get(
      "movie/popular?api_key=$API_KEY&language=en-US&page=1",
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
      "movie/$id?api_key=$API_KEY&language=en-US",
    );

    if (response.statusCode == 200) {
      return DetailResponse.fromJson(response.data);
    } else {
      log("DetailResponse ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<NowPlayingModel?> getNowPlaying() async {
    var response = await dio.get(
      "movie/now_playing?api_key=$API_KEY&language=en-US&page=1",
    );

    if (response.statusCode == 200) {
      return NowPlayingModel.fromJson(response.data);
    } else {
      log("NowPlayingModel ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<GenresResponse?> getGenresList() async {
    var response = await dio.get(
      "genre/movie/list?api_key=$API_KEY&language=en-US",
    );

    if (response.statusCode == 200) {
      return GenresResponse.fromJson(response.data);
    } else {
      log("GenresResponse ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  Future<GenresIdResponse?> getGenresListBody(String id) async {
    var response = await dio.get(
      // "genre/movie/list?api_key=$API_KEY&language=en-US",
      "list/$id?api_key=$API_KEY&language=en-US",
    );

    if (response.statusCode == 200) {
      return GenresIdResponse.fromJson(response.data);
    } else {
      log("GenresResponse ERROR ===  ${response.statusCode}");
    }

    return null;
  }

  // https://api.themoviedb.org/3/list/28?api_key=$API_KEY&language=en-US
}
