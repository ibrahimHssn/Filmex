class ApiConstance{
  static const baseUrl="https://api.themoviedb.org/3/";
  static const baseImageUrl="https://image.tmdb.org/t/p/w500";
  static const token='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTUwYTVkZjQ4NDQxZTYxMTRmZjVlNWRhOTg1YzEzNCIsInN1YiI6IjY1YzkyZmNlYjZjZmYxMDE4NWE3MmE1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aLQ9DhpFRIJq6pncg0iGr0POhsHuxDodQqEsNCY3ZEw';
  static const headers={'Authorization':ApiConstance.token, 'accept': 'application/json',};

  static const nowPlayingFilmexPath="${baseUrl}movie/now_playing";


  static const popularFilmexPath="${baseUrl}movie/popular";
  static String popularFilmexPathAll(int pageNumbering )=>"$popularFilmexPath?language=en-US&page=$pageNumbering";

  static const topRatedFilmexPath="${baseUrl}movie/top_rated";
  static String topRatedPathAll(int pageNumbering )=>"$topRatedFilmexPath?language=en-US&page=$pageNumbering";



  static String filmexDetailsPath(int movieId )=>"${baseUrl}movie/$movieId";
  static String recommendationsPath(int recommendationsId )=>"${baseUrl}movie/$recommendationsId/recommendations";

  static String imageUrl_(String path)=>"$baseImageUrl$path";
  static const imageEmpty_="https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";







}