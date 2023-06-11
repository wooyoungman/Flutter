class NowInCinemaMovie {
  late final dynamic title, thumb, id;

  NowInCinemaMovie.fromJson(Map<dynamic, dynamic> json)
      : title = json['title'],
        thumb = json['poster_path'],
        id = json['id'];
}
