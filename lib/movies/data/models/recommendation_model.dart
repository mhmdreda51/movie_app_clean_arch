import '../../domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel(super.backdropPath, super.id);

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      json["backdrop_path"] ?? "/vvObT0eIWGlArLQx3K5wZ0uT812.jpg",
      json["id"],
    );
  }
}
