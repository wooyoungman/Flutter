class MovieDetailModel {
  final String title, thumb, overview;
  final num id, runtime, vote;
  final List<String> genres;

  MovieDetailModel.fromJson(Map<dynamic, dynamic> json)
      : title = json['title'],
        thumb = json['poster_path'],
        runtime = json['runtime'],
        id = json['id'],
        overview = json['overview'],
        genres = List<String>.from(
            json['genres']?.map((genre) => genre['name'] ?? '') ?? []),
        vote = json['vote_average'];
}
