import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/apis/api_manager.dart';

import '../../../../../core/apis/models/movie_response.dart';
import '../browse.dart';
import '../home/home.dart';
import '../Profile/profile.dart';
import '../search.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState>{
  LayoutCubit() : super(InitState());

  final ApiManager _apiManager = ApiManager();
  CarouselSliderController? carouselController = CarouselSliderController();
  int navIndex = 0;
  int currentIndex = 0;

  List<Movies> movies = [];
  List<Widget> screens = [Home(), Search(), Browse(), Profile()];
  Set<String> genres = {};



  Future<void> init() async {
    emit(InitState());
    await getMovies();
    await getMoviesGenres();
  }

  void onNavTap(int index) {
    navIndex = index;
    emit(OnNavTapChanged());
  }


  Future<void> getMovies() async{
    emit(GetMoviesLoadingState());
    try{
      final data = await _apiManager.getMovies();
      movies = data;
      emit(GetMoviesSuccessState());
    }catch(e){
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


  void onCarouselChanged(int index){
    currentIndex = index;
    emit(OnCarouselChanged());
  }
}