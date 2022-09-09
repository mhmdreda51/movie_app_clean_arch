import 'package:movie_app_ddp_arch/movies/domain/entities/movies.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["original_title"],
        id: json["id"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        overview: json["overview"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
