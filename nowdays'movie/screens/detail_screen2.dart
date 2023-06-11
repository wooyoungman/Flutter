import 'package:flutter/material.dart';
import 'package:woo_f/models/movie_detail_model.dart';
import 'package:woo_f/services/movie_service.dart';

class DetailScreen extends StatefulWidget {
  final dynamic id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailScreen> {
  late Future<MovieDetailModel> moviee;
  @override
  void initState() {
    super.initState();
    moviee = ApiService.getDetailById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text(
          "Back to List",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: moviee,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String genre = snapshot.data!.genres.join(", ");
              int starCount = (snapshot.data!.vote / 2.0).round();
              final List<Widget> stars = List.generate(
                5,
                (index) => Icon(
                  index < starCount ? Icons.star : Icons.star_border,
                  color: index < starCount ? Colors.yellow : Colors.grey,
                ),
              );
              return Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/${snapshot.data!.thumb}"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: stars,
                      ),
                      Text(
                        "Runtime : ${snapshot.data!.runtime} | $genre",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "StoryLine",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        snapshot.data!.overview,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              );
            }
            return const Text("...");
          },
        ),
      ),
    );
  }
}
