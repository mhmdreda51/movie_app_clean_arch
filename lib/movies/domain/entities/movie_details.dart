import 'package:equatable/equatable.dart';

import 'generes.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final List<Generes> generes;
  final String backdropPath;
  final int runtime;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.runtime,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.generes,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        runtime,
        overview,
        voteAverage,
        releaseDate,
        generes,
      ];
}
