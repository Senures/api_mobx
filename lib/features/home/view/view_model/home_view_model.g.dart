// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$popularResponseAtom =
      Atom(name: '_HomeViewModelBase.popularResponse', context: context);

  @override
  PopularMoviesResponse? get popularResponse {
    _$popularResponseAtom.reportRead();
    return super.popularResponse;
  }

  @override
  set popularResponse(PopularMoviesResponse? value) {
    _$popularResponseAtom.reportWrite(value, super.popularResponse, () {
      super.popularResponse = value;
    });
  }

  late final _$detailResponseAtom =
      Atom(name: '_HomeViewModelBase.detailResponse', context: context);

  @override
  DetailResponse? get detailResponse {
    _$detailResponseAtom.reportRead();
    return super.detailResponse;
  }

  @override
  set detailResponse(DetailResponse? value) {
    _$detailResponseAtom.reportWrite(value, super.detailResponse, () {
      super.detailResponse = value;
    });
  }

  late final _$nowPlayingModelAtom =
      Atom(name: '_HomeViewModelBase.nowPlayingModel', context: context);

  @override
  NowPlayingModel? get nowPlayingModel {
    _$nowPlayingModelAtom.reportRead();
    return super.nowPlayingModel;
  }

  @override
  set nowPlayingModel(NowPlayingModel? value) {
    _$nowPlayingModelAtom.reportWrite(value, super.nowPlayingModel, () {
      super.nowPlayingModel = value;
    });
  }

  late final _$genresResponseAtom =
      Atom(name: '_HomeViewModelBase.genresResponse', context: context);

  @override
  GenresResponse? get genresResponse {
    _$genresResponseAtom.reportRead();
    return super.genresResponse;
  }

  @override
  set genresResponse(GenresResponse? value) {
    _$genresResponseAtom.reportWrite(value, super.genresResponse, () {
      super.genresResponse = value;
    });
  }

  late final _$genresIdResponseAtom =
      Atom(name: '_HomeViewModelBase.genresIdResponse', context: context);

  @override
  GenresIdResponse? get genresIdResponse {
    _$genresIdResponseAtom.reportRead();
    return super.genresIdResponse;
  }

  @override
  set genresIdResponse(GenresIdResponse? value) {
    _$genresIdResponseAtom.reportWrite(value, super.genresIdResponse, () {
      super.genresIdResponse = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$genresIdAtom =
      Atom(name: '_HomeViewModelBase.genresId', context: context);

  @override
  String? get genresId {
    _$genresIdAtom.reportRead();
    return super.genresId;
  }

  @override
  set genresId(String? value) {
    _$genresIdAtom.reportWrite(value, super.genresId, () {
      super.genresId = value;
    });
  }

  late final _$isGenreAtom =
      Atom(name: '_HomeViewModelBase.isGenre', context: context);

  @override
  bool get isGenre {
    _$isGenreAtom.reportRead();
    return super.isGenre;
  }

  @override
  set isGenre(bool value) {
    _$isGenreAtom.reportWrite(value, super.isGenre, () {
      super.isGenre = value;
    });
  }

  late final _$getPopularMoviesAsyncAction =
      AsyncAction('_HomeViewModelBase.getPopularMovies', context: context);

  @override
  Future getPopularMovies() {
    return _$getPopularMoviesAsyncAction.run(() => super.getPopularMovies());
  }

  late final _$getDetailMoviesAsyncAction =
      AsyncAction('_HomeViewModelBase.getDetailMovies', context: context);

  @override
  Future getDetailMovies(String id) {
    return _$getDetailMoviesAsyncAction.run(() => super.getDetailMovies(id));
  }

  late final _$getNowPlayingAsyncAction =
      AsyncAction('_HomeViewModelBase.getNowPlaying', context: context);

  @override
  Future getNowPlaying() {
    return _$getNowPlayingAsyncAction.run(() => super.getNowPlaying());
  }

  late final _$getGenreListAsyncAction =
      AsyncAction('_HomeViewModelBase.getGenreList', context: context);

  @override
  Future getGenreList() {
    return _$getGenreListAsyncAction.run(() => super.getGenreList());
  }

  late final _$getGenreListBodyAsyncAction =
      AsyncAction('_HomeViewModelBase.getGenreListBody', context: context);

  @override
  Future getGenreListBody(String id) {
    return _$getGenreListBodyAsyncAction.run(() => super.getGenreListBody(id));
  }

  late final _$getDataAsyncAction =
      AsyncAction('_HomeViewModelBase.getData', context: context);

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  dynamic setIsGenre(bool b) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setIsGenre');
    try {
      return super.setIsGenre(b);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGenresId(String id) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setGenresId');
    try {
      return super.setGenresId(id);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
popularResponse: ${popularResponse},
detailResponse: ${detailResponse},
nowPlayingModel: ${nowPlayingModel},
genresResponse: ${genresResponse},
genresIdResponse: ${genresIdResponse},
isLoading: ${isLoading},
genresId: ${genresId},
isGenre: ${isGenre}
    ''';
  }
}
