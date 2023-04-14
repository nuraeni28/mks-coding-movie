import 'package:http/http.dart' as http;
import 'package:mks_coding_movie/models/movie.dart';

class Services {
  static const String BASE_URL = 'https://imdb-api.com';
  static const String API_KEY = 'k_jz5aw6k4';
  static const String PopularMovie =
      '${BASE_URL}/en/API/MostPopularMovies/${API_KEY}';
  static const String DETAIL_MOVIE = '${BASE_URL}/en/API/Title/${API_KEY}';
  // https://imdb-api.com'/en/API/MostPopularMovies/'k_jz5aw6k4'

  static Future<List<Item>> getMovies() async {
    try {
      final response = await http.get(Uri.parse(PopularMovie));
      if (response.statusCode == 200) {
        final Movie listMovies = movieFromJson(response.body);
        return listMovies.items;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // static Future<DetailMovie> getDetailMovie(String id) async {
  //   print('justajhsdjahsd ${DETAIL_MOVIE}/${id}');
  //   try {
  //     final response = await http.get(Uri.parse('${DETAIL_MOVIE}/${id}'));
  //     if (response.statusCode == 200) {
  //       final DetailMovie detailMovie = detailMovieFromJson(response.body);
  //       return detailMovie;
  //     } else {
  //       return DetailMovie();
  //     }
  //   } catch (e) {
  //     return DetailMovie();
  //   }
  // }
}
