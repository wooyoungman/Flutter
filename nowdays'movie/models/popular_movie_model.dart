class PopularMovie {
  late final dynamic thumb, id;

  PopularMovie.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    thumb = json['poster_path'];
  }
}
