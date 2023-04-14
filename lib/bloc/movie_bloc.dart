import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mks_coding_movie/models/movie.dart';
import 'package:http/http.dart' as http;

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  static const String BASE_URL = 'https://imdb-api.com';
  static const String API_KEY = 'k_jz5aw6k4';
  static const String PopularMovie =
      '${BASE_URL}/en/API/MostPopularMovies/${API_KEY}';
  static const String DETAIL_MOVIE = '${BASE_URL}/en/API/Title/${API_KEY}';
  MovieBloc() : super(MovieInitial()) {
    on<GetMovieEvent>((event, emit) async {
      emit(MovieLoading());
      final response = await http.get(Uri.parse(PopularMovie));
      final Movie listMovies = movieFromJson(response.body);
      emit(MovieSuccess(movie: listMovies.items));
    });
  }
}
