import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/now_playing.dart';
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
}
