import 'package:flutter/material.dart';
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/now_playing.dart';
import 'package:netflixclone/models/upcoming_models.dart';

class MovieCards<T> extends StatelessWidget {
  final Future<T> future;
  final String headlineText;

  const MovieCards({
    super.key,
    required this.future,
    required this.headlineText,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading movies'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No movies available'));
        } else {
          var data;
          if (snapshot.data is UpcomingModels) {
            data = (snapshot.data as UpcomingModels).results;
          } else if (snapshot.data is NowPlaying) {
            data = (snapshot.data as NowPlaying).results;
          } else {
            return const Center(child: Text('Unknown data type'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headlineText,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Makes it scroll horizontally
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10), // Adjust spacing as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                          Image.network("${imageurl}${data[index].posterPath}"),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
