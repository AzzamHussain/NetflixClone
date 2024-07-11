import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovieWidget extends StatelessWidget {
  final String imageurl;
  final String overview;
  final String logourl;
  final String month;
  final String day;

  const ComingSoonMovieWidget(
      {super.key,
      required this.imageurl,
      required this.overview,
      required this.logourl,
      required this.month,
      required this.day});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                month,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    letterSpacing: 5),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: imageurl),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                    child: CachedNetworkImage(
                      imageUrl: logourl,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.notifications_none_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        "Remind me",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        "Info",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    "coming on $month $day",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
