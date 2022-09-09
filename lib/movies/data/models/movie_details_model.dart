import '../../domain/entities/movie_details.dart';
import 'generes_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.runtime,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.generes,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"],
      overview: json["overview"],
      backdropPath: json["backdrop_path"],
      id: json["id"],
      title: json["original_title"],
      generes: List<GeneresModel>.from(
        json["genres"].map((x) => GeneresModel.fromJson(x)),
      ),
      runtime: json["runtime"],
    );
  }
}
