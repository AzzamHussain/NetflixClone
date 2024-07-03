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
                child: CachedNetworkImage(
              imageUrl: "$imageurl$url",
            ));
          },
          options: CarouselOptions()),
    );
  }
}
