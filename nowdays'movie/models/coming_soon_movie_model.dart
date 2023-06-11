class ComingSoonMovie {
  late final dynamic title, thumb, id;

  ComingSoonMovie.fromJson(Map<dynamic, dynamic> json)
      : title = json['title'],
        thumb = json['poster_path'],
        id = json['id'];
}
