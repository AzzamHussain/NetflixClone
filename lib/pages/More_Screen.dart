import 'package:flutter/material.dart';
import 'package:netflixclone/widgets/coming_soon_movie_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title:
                const Text("New & hot", style: TextStyle(color: Colors.white)),
            actions: [
              const Icon(Icons.cast, color: Colors.white),
              const SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 25,
                  width: 25,
                ),
              ),
              const SizedBox(width: 20),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(text: "Coming Soon"),
                Tab(text: "Everyone"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: const [
                    ComingSoonMovieWidget(
                      imageurl:
                          'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                      overview:
                          'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                      logourl:
                          'https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg',
                      month: "Jun",
                      day: "19",
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageurl:
                          'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                      overview:
                          'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                      logourl:
                          'https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg',
                      month: "Mar",
                      day: "07",
                    ),
                  ],
                ),
              ),
              const ComingSoonMovieWidget(
                imageurl:
                    'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                overview:
                    'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                logourl:
                    'https://logowik.com/content/uploads/images/stranger-things4286.jpg',
                month: "Feb",
                day: "20",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
