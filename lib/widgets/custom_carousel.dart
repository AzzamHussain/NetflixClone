import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/constants/utils.dart';
import 'package:netflixclone/models/tv_models.dart';

class CustomCarousel extends StatelessWidget {
  final TvSeriesModel data;
  const CustomCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realindex) {
          var url = data.results[index].backdropPath.toString();
          return GestureDetector(
            //////////////////////////////////////////////
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: "$imageurl$url",
                  imageBuilder: (context, imageProvider) => Container(
                    width: size.width * 0.8, // Adjust width as needed
                    height: (size.height * 0.33 < 250)
                        ? 250
                        : size.height * 0.25, // Adjust height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 20),
                Text(
                  data.results[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ////////////////////////////////////////////////
          );
        },
        options: CarouselOptions(
            height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
            aspectRatio: 16 / 9,
            reverse: false,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 300),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal),
      ),
    );
  }
}
