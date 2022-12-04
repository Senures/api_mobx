import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:movie_app_mobx/core/entity/popular_movie_models.dart';
import 'package:movie_app_mobx/features/services/app_services.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  PopularMoviesResponse? popularResponse;
  //bunun değeri boşken dolucak değişicek o yüzden observable

  @action
  //notify listener aynı mantık
  getPopularMovies() async {
    popularResponse = await AppServices().getPopularMovie();
    log(popularResponse!.toJson().toString());
  }
}
