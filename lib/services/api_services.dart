import 'dart:convert';
import 'dart:developer';
//import 'dart:js_interop_unsafe';

import 'package:http/http.dart' as http;
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/upcoming_models.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$ApiKey";
late String endpoint;

class ApiServices {
  Future<UpcomingModels> getUpcomingModels() async {
    endpoint = "movie/upcoming";
    final url = "$baseUrl$endpoint$key";

    final Response = await http.get(Uri.parse(url));
    if (Response.statusCode == 200) {
      log("success");
      return UpcomingModels.fromJson(jsonDecode(Response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }
}
