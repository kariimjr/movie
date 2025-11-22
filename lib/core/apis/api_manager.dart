import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/core/apis/models/movie_response.dart';
import 'package:movie/core/routes/app_routes_name.dart';

import '../../main.dart';

class ApiManager {
  static final _dio = Dio(
    BaseOptions(
      followRedirects: false,
      headers: {"x-api-key" : "d8d8b78d149c4e1b854a84991ac67d34"},
      baseUrl: "https://yts.lt/api/v2/",
      validateStatus: (status){
        if(status == 401){
          Navigator.pushReplacementNamed(
            navigatorKey.currentContext!,
            RouteName.Login
          );
        }
        return true;
      }
    )
  );

  Future<List<Movies>> getMovies() async {
    try {
      var response = await _dio.get("list_movies.json");
      if (response.statusCode == 200) {
        List<Movies> movies = [];
        var data = response.data["data"]["movies"];
        for (var e in data) {
          movies.add(Movies.fromJson(e));
        }
        return movies;
      } else {
        throw response.data;
      }
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }
  Future<Set<String>> getMoviesGenres() async {
    try {
      var response = await _dio.get("list_movies.json");
      if (response.statusCode == 200) {
        Set<String> genres = {};
        var movies = response.data["data"]["movies"];

        for (var movie in movies) {
          if (movie['genres'] != null) {
            for (var genre in movie['genres']) {
              genres.add(genre);
            }
          }
        }

        return genres;
      } else {
        throw response.data;
      }
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }


}