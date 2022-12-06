import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:movie_app_mobx/core/entity/detail_models.dart';
import 'package:movie_app_mobx/core/entity/genresId_models.dart';
import 'package:movie_app_mobx/core/entity/genres_models.dart';
import 'package:movie_app_mobx/core/entity/now_playing.dart';
import 'package:movie_app_mobx/core/entity/popular_movie_models.dart';
import 'package:movie_app_mobx/features/services/app_services.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

/// buraya bişey eklersen
/// altta watch diye bişey var ona tıklaman lazım
/// sonra o da ne yapacak kon generate edicek
/// isloading vs şeylerin gelmesi için anladın mı ?
/// he yeni eklenen şeylerin .g dart dosyasına eklenmesi için mi
/// aynen öyle aşkım ya tüm gün bunla ugrastık
/// foto path yanlıştı onuda düzenledim haberin olsun tamam  ben hızlcıa çekim detayınıda sana sorum olursa derim
abstract class _HomeViewModelBase with Store {
  _HomeViewModelBase() {
    getData();
  }

  @observable
  PopularMoviesResponse? popularResponse;

  @observable
  DetailResponse? detailResponse;

  @observable
  NowPlayingModel? nowPlayingModel;

  @observable
  GenresResponse? genresResponse;

  @observable
  GenresIdResponse? genresIdResponse;

  @observable
  bool isLoading = false;
  //bunun değeri boşken dolucak değişicek o yüzden observable

  @observable
  String? genresId;

  @observable
  bool isGenre = false;

  @action
  setIsGenre(bool b) {
    isGenre = b;
  }

//notify listener aynı mantık
  @action
  getPopularMovies() async {
    popularResponse = await AppServices().getPopularMovie();
  }

  @action
  getDetailMovies(String id) async {
    isLoading = true;

    detailResponse = await AppServices().getDetailMovie(id);

    isLoading = false;
  }

  @action
  getNowPlaying() async {
    nowPlayingModel = await AppServices().getNowPlaying();
  }

  @action
  getGenreList() async {
    genresResponse = await AppServices().getGenresList();
  }

  @action
  getGenreListBody(String id) async {
    isLoading = true;
    genresIdResponse = await AppServices().getGenresListBody(id);
    log(genresIdResponse!.toJson().toString());
    isLoading = false;
  }

  @action
  setGenresId(String id) {
    genresId = id;
  }

  @action
  getData() async {
    isLoading = true;
    await getPopularMovies();
    await getNowPlaying();
    await getGenreList();
    isLoading = false;
  }
}
