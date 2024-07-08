import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/movies_details.dart';
import 'package:netflixclone/models/now_playing.dart';
import 'package:netflixclone/models/recommendation_model.dart';
import 'package:netflixclone/models/search_model.dart';
import 'package:netflixclone/models/tv_models.dart';
import 'package:netflixclone/models/upcoming_models.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$ApiKey";

class ApiServices {
  ///**********************UPCOMING MOVIES************************************************************ */
  Future<UpcomingModels> getUpcomingModels() async {
    final endpoint = "movie/upcoming";
    final url = "$baseUrl$endpoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success");
      return UpcomingModels.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }

  ///******************************NOW PLAYING********************************s */

  Future<NowPlaying> getNowPlaying() async {
    final endpoint = "tv/on_the_air";
    final url = "$baseUrl$endpoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success");
      return NowPlaying.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load NowPlaying movies");
  }

  //*********************Tv Series****************** */
  Future<TvSeriesModel> getTopRatedMovies() async {
    final endpoint = "discover/tv";
    final url = "$baseUrl$endpoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load NowPlaying movies");
  }

  ///******************************************SearchMovies******************************/

  Future<Search> getSearchMovies(String searchText) async {
    final endpoint = "search/movie?query=";
    final url = "$baseUrl$endpoint$key";
    print("Search url is:$url");

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNTIyMTcyNzVkMzAyNzJmZjNkNWFiYTUwOGY3NTk4NyIsIm5iZiI6MTcyMDA0MzUzOC43Mzc5MzMsInN1YiI6IjY2ODQwNjI1OTFmNThkNDQ4OTFlNjQ2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HQeuTcAsZkwXiMxIjDbjfyiWZ_r6pWvptsD1iLsG8Q4"
    });
    if (response.statusCode == 200) {
      log("success");
      return Search.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Search movies");
  }

  //*********************Recommendation****************** */
  Future<Recommendation> getTopSearchMovies() async {
    final endpoint = "tv/top_rated";
    final url = "$baseUrl$endpoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("success");
      return Recommendation.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load NowPlaying movies");
  }

  ///******************************************SearchMovies******************************/

  Future<MovieDetails> getMovieDetails(int movie_id) async {
    final endpoint = "movie/$movie_id";
    final url = "$baseUrl$endpoint$key";
    print("Search url is:$url");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("success");
      return MovieDetails.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Search movies");
  }
}
