import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/movies_details.dart';
import 'package:netflixclone/services/api_services.dart';

class DetailScreen extends StatefulWidget {
  final int movie_id;
  const DetailScreen({super.key, required this.movie_id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ApiServices apiServices = ApiServices();
  late Future<MovieDetails> movieDetails;

  void initState() {
    super.initState();
    FetchInitialData();
  }

  FetchInitialData() {
    movieDetails = apiServices.getMovieDetails(widget.movie_id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("movie id is${widget.movie_id}");
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: movieDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movie = snapshot.data;

                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "$imageurl${movie!.backdropPath}"))),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
