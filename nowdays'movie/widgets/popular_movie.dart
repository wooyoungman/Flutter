import 'package:flutter/material.dart';
import 'package:woo_f/screens/detail_screen2.dart';

class Movie extends StatelessWidget {
  final String thumb;
  final String? title;
  final num id;

  const Movie({
    super.key,
    required this.thumb,
    required this.id,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ]),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/$thumb",
              width: 240,
              height: 190,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
