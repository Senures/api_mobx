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

  @override
  String toString() {
    return '''
popularResponse: ${popularResponse},
detailResponse: ${detailResponse},
isLoading: ${isLoading}
    ''';
  }
}
