import 'package:flutter/material.dart';
import 'package:woo_f/models/now_in_cinema_movie_model.dart';
import 'package:woo_f/models/popular_movie_model.dart';
import 'package:woo_f/models/coming_soon_movie_model.dart';
import 'package:woo_f/widgets/now_in_cinema_movie.dart';
import 'package:woo_f/widgets/popular_moive.dart';
import 'package:woo_f/widgets/coming_soon_movie.dart';
import 'package:woo_f/services/movie_service.dart';

class HomeScreen3 extends StatelessWidget {
  HomeScreen3({super.key});

  final Future<List<PopularMovie>> movies = ApiService.getPopularMoives();
  final Future<List<NowInCinemaMovie>> cinema = ApiService.getCinemas();
  final Future<List<ComingSoonMovie>> soon = ApiService.getSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Popular Movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              FutureBuilder(
                future: movies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 240,
                          child: makeList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: Text("error"), // CircularProgressIndicator(),
                  );
                },
              ),
              const Text(
                'Now in Cinema',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              FutureBuilder(
                future: cinema,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 260,
                          child: makeCinemaList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: Text("error"), // CircularProgressIndicator(),
                  );
                },
              ),
              const Text(
                'Comming Soon',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              FutureBuilder(
                future: soon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: makeSoonList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: Text("Loading...."), // CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<PopularMovie>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
          thumb: movie.thumb,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }

  ListView makeCinemaList(AsyncSnapshot<List<NowInCinemaMovie>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return CinemaMovie(
          thumb: movie.thumb,
          id: movie.id,
          title: movie.title,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }

  ListView makeSoonList(AsyncSnapshot<List<ComingSoonMovie>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return SoonMovie(
          thumb: movie.thumb,
          id: movie.id,
          title: movie.title,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }
}
