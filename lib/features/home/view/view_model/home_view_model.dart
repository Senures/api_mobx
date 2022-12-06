import 'package:mobx/mobx.dart';
import 'package:movie_app_mobx/core/entity/detail_models.dart';
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
  @observable
  PopularMoviesResponse? popularResponse;

  @observable
  DetailResponse? detailResponse;

  @observable
  NowPlayingModel? nowPlayingModel;

  @observable
  GenresResponse? genresResponse;

  @observable
  bool isLoading = false;
  //bunun değeri boşken dolucak değişicek o yüzden observable

  @observable
  String? genresId;

//notify listener aynı mantık
  @action
  getPopularMovies() async {
    isLoading = true;
    popularResponse = await AppServices().getPopularMovie();
    print(popularResponse!.results![0].posterPath.toString());
    // print("========================  " + popularResponse!.toJson().toString());
    isLoading = false;
  }

  @action
  getDetailMovies(String id) async {
    isLoading = true;
    detailResponse = await AppServices().getDetailMovie(id);
    print(detailResponse!.toJson());
    // print("========================  " + popularResponse!.toJson().toString());
    isLoading = false;
  }

  @action
  getNowPlaying() async {
    isLoading = true;
    nowPlayingModel = await AppServices().getNowPlaying();
    print(nowPlayingModel!.toJson());
    // print("========================  " + popularResponse!.toJson().toString());
    isLoading = false;
  }

  @action
  getGenreList() async {
    isLoading = true;
    genresResponse = await AppServices().getGenresList();
    print(genresResponse!.toJson());
    // print("========================  " + popularResponse!.toJson().toString());
    isLoading = false;
  }

  @action
  setGenresId(String id) {
    genresId = id;
  }
}
