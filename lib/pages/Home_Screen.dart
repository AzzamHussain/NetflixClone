import 'package:flutter/material.dart';
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/now_playing.dart';
import 'package:netflixclone/models/tv_models.dart';
import 'package:netflixclone/models/upcoming_models.dart';
import 'package:netflixclone/services/api_services.dart';
import 'package:netflixclone/widgets/custom_carousel.dart';
import 'package:netflixclone/widgets/movie_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingModels> upcomingFuture;
  late Future<NowPlaying> nowPlayingFuture;
  late Future<TvSeriesModel> tvSeriesFuture;

  final ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingModels();
    nowPlayingFuture = apiServices.getNowPlaying();
    tvSeriesFuture = apiServices.getTopRatedMovies();
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
            FutureBuilder<TvSeriesModel>(
              future: tvSeriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading TV series'));
                } else if (!snapshot.hasData ||
                    snapshot.data!.results.isEmpty) {
                  return const Center(child: Text('No TV series available'));
                } else {
                  return CustomCarousel(data: snapshot.data!);
                }
              },
            ),
            SizedBox(
              height: 255,
              child: MovieCards(
                  future: nowPlayingFuture, headlineText: "Now Playing"),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 255,
              child: MovieCards(
                  future: upcomingFuture, headlineText: "Upcoming Movies"),
            ),
          ],
        ),
      ),
    );
  }
}
