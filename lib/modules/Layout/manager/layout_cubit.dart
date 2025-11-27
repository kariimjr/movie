import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/apis/api_manager.dart';
import '../../../core/apis/models/movie_details.dart';

import '../../../core/apis/models/movie_response.dart';
import '../pages/Profile/profile.dart';
import '../pages/browse/browse.dart';
import '../pages/home/home_screens/home.dart';
import '../pages/search/search.dart';
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
  List<Movies> filteredMovies = [];
  Set<String> genres = {};
  List<Movies> searched = [];
  Movie? movieDetails;
  String? selectedGenre;
  int watchlistCount = 0;

  Map<String, dynamic>? profileData;

  int navIndex = 0;

  void onNavTap(int index) {
    navIndex = index;
    emit(OnNavTapChanged());
  }

  Future<void> makeMovieMarked(Movies movie) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(movie.id.toString());

    try {
      final doc = await docRef.get();

      if (doc.exists) {
        await docRef.delete();
        isMarked = false;
      } else {
        await docRef.set({
          'id': movie.id,
          'title': movie.title,
          'year': movie.year,
          'rating': movie.rating,
          'coverImage': movie.largeCoverImage,
          'backgroundImage': movie.backgroundImage,
        });
        isMarked = true;
      }

      emit(OnMarkChange());
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkIfMovieMarked(Movies movie) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(movie.id.toString())
        .get();

    isMarked = doc.exists; // true if movie is in watchlist
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
    print("getMoviesGenres");
  }

  void onCarouselChanged(int index) {
    currentIndex = index;
    emit(OnCarouselChanged());
  }

  void getSimilar(Movies movie) {
    emit(GetSimilarLoading());

    similar.clear();

    for (var e in movies) {
      if (e.id == movie.id) continue;

      bool hasSimilarGenre = e.genres!.any((g) => movie.genres!.contains(g));

      if (hasSimilarGenre) {
        similar.add(e);
      }
    }
    emit(GetSimilarSuccess()); // notify UI
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      searched.clear();
      emit(InitState());
      return;
    }

    searched = movies.where((movie) {
      return movie.title!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(SearchMovie());
  }

  Future<void> getMovieDetails(num? movieId) async {
    emit(GetMovieDetailsLoadingState());
    try {
      final data = await _apiManager.getMovieDetails(movieId);
      movieDetails = data;

      emit(GetMovieDetailsSuccessState());
    } catch (e, _) {
      emit(GetMovieDetailsErrorState());
      print(e);
    }
  }

  void onTapBar(int index) {
    selectedGenre = genres.elementAt(index);
    getFilteredMovies();
    emit(OnTapBarChange());
    print("onTapBar");
  }

  void getFilteredMovies() {
    filteredMovies = movies
        .where((m) => m.genres!.contains(selectedGenre))
        .toList();
    emit(GetFilteredMovies());
    print("getFilteredMovies");
  }

  Future<void> getProfile() async {
    emit(GetProfileLoadingState());
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(GetProfileErrorState());
      return;
    }

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      profileData = doc.data();
      emit(GetProfileSuccessState());
    } catch (e) {
      emit(GetProfileErrorState());
      print(e);
    }
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    emit(UpdateProfileLoadingState());
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(UpdateProfileErrorState());
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update(data);

      profileData = {...profileData ?? {}, ...data};

      emit(UpdateProfileSuccessState());
    } catch (e) {
      emit(UpdateProfileErrorState());
      print(e);
    }
  }

  Future<void> resetPassword() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user?.email == null) {
      throw Exception("User email not found");
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: user!.email!);
  }

  Future<void> deleteUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();
      await user.delete();
    } catch (e) {
      print('Error deleting user: $e');
    }

  }

  Future<void> addToHistory(Movies movie) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .doc(movie.id.toString());

    try {
      final doc = await docRef.get();

      if (!doc.exists) {
        await docRef.set({
          'id': movie.id,
          'title': movie.title,
          'year': movie.year,
          'rating': movie.rating,
          'coverImage': movie.largeCoverImage,
          'backgroundImage': movie.backgroundImage,
          'watchedAt': FieldValue.serverTimestamp(),
        });
      } else {
        // Movie is already in history, do nothing
        print("${movie.title} is already in history");
      }
    } catch (e) {
      print("Error adding to history: $e");
    }
  }



}
