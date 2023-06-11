import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:woo_f/models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade400,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              episode.title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Colors.white),
          ]),
        ),
      ),
    );
  }
}
