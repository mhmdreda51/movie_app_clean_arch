class AppConstants {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "1b5bda39abf630f836cdabe3be6b46d6";
  static const nowPlayingPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";

  static movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static movieRecommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
