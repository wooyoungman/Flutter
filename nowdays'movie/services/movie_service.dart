import 'dart:convert';

import 'package:woo_f/models/now_in_cinema_movie_model.dart';
import 'package:woo_f/models/movie_detail_model.dart';
import 'package:woo_f/models/popular_movie_model.dart';
import 'package:woo_f/models/coming_soon_movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static String popular = "popular";
  static String now = "now-playing";
  static String soon = "coming-soon";

  static Future<List<PopularMovie>> getPopularMoives() async {
    List<PopularMovie> movieInstances = [];
    final url = Uri.parse("$baseUrl/$popular");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<dynamic, dynamic> movies = jsonDecode(response.body);
      final List<dynamic> good = movies['results'];
      for (var movie in good) {
        movieInstances.add(PopularMovie.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<NowInCinemaMovie>> getCinemas() async {
    List<NowInCinemaMovie> movieInstances = [];
    final url = Uri.parse("$baseUrl/$now");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<dynamic, dynamic> json = jsonDecode(response.body);
      final List<dynamic> movies = json['results'];
      for (var movie in movies) {
        movieInstances.add(NowInCinemaMovie.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error;
  }

  static Future<List<ComingSoonMovie>> getSoon() async {
    List<ComingSoonMovie> movieInstances = [];
    final url = Uri.parse("$baseUrl/$soon");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<dynamic, dynamic> json = jsonDecode(response.body);
      final List<dynamic> movies = json['results'];
      for (var movie in movies) {
        movieInstances.add(ComingSoonMovie.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error;
  }

  static Future<MovieDetailModel> getDetailById(dynamic id) async {
    final url =
        Uri.parse("https://movies-api.nomadcoders.workers.dev/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
