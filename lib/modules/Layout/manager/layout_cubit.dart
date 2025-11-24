import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/apis/api_manager.dart';
import '../../../../core/apis/models/movie_response.dart';
import '../pages/Profile/profile.dart';
import '../pages/browse.dart';
import '../pages/home/home_screens/home.dart';

import '../pages/search.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitState());

  final ApiManager _apiManager = ApiManager();
  CarouselSliderController? carouselController = CarouselSliderController();
  int currentIndex = 0;
  bool isMarked = false;
  bool isCalled = false;
  List<Widget> screens = [Home(), Search(), Browse(), Profile()];
  List<Movies> movies = [];
  List<Movies> similar = [];
  Set<String> genres = {};

  int navIndex = 0;

  void onNavTap(int index) {
    navIndex = index;
    emit(OnNavTapChanged());
  }

  void makeMovieMarked() {
    isMarked ^= true;
    emit(OnMarkChange());
  }

  Future<void> init() async {
    emit(InitState());
    await getMovies();
    await getMoviesGenres();
  }

  Future<void> getMovies() async {
    emit(GetMoviesLoadingState());
    try {
      final data = await _apiManager.getMovies();
      movies = data;
      emit(GetMoviesSuccessState());
    } catch (e) {
      emit(GetMoviesErrorState());
      print(e);
    }
  }

  Future<void> getMoviesGenres() async {
    emit(GetMoviesGenresLoadingState());
    try {
      var data = await _apiManager.getMoviesGenres();
      genres = data;
      emit(GetMoviesGenresSuccessState());
    } catch (e, s) {
      emit(GetMoviesGenresErrorState());
      print(e);
    }
  }

  void onCarouselChanged(int index) {
    currentIndex = index;
    emit(OnCarouselChanged());
  }

  void getSimilar(Movies movie) {
    for (var e in movies) {
      for (var genre in movie.genres!) {
        if (e.genres!.contains(genre)) {
          similar.add(e);
        }
      }
    }
    print(similar.length);
    emit(GetSimilarLoading());
  }
}
