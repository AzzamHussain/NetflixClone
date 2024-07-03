import 'package:flutter/material.dart';
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/now_playing.dart';
import 'package:netflixclone/models/upcoming_models.dart';
import 'package:netflixclone/services/api_services.dart';
import 'package:netflixclone/widgets/movie_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingModels> upcomingFuture;
  late Future<NowPlaying> nowPlayingFuture;

  final ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingModels();
    nowPlayingFuture = apiServices.getNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbackgroundcolor,
        title: Image.asset("assets/logo.png", height: 50, width: 120),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 25,
              width: 25,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 260,
              child: MovieCards(
                  future: upcomingFuture, headlineText: "Upcoming Movies"),
            ),
            SizedBox(
              height: 260,
              child: MovieCards(
                  future: nowPlayingFuture, headlineText: "Now Playing"),
            ),

            //
          ],
        ),
      ),
    );
  }
}
