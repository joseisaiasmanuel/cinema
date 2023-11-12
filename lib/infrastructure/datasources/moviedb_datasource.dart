
import 'package:cinema/domain/entities/movie.dart';
import 'package:cinema/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema/infrastructure/models/moviedb/movie_details.dart';
import 'package:dio/dio.dart';

import '../../config/contantants/environment.dart';
import '../../domain/datasources/movie_datasource.dart';
import '../models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
   final dio = Dio(BaseOptions(
     baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-Mx'
    }
   )
     
   );
  
  List<Movie> _jsonToMovies (Map<String, dynamic> json){
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movie = movieDBResponse.results
        .where((moviedb) => (moviedb.posterPath != 'no-poster'))
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movie;
     
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 0}
  
  ) async {
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page':page
    }
    );
   
   return _jsonToMovies(response.data);
  }
  
 @override
  Future<List<Movie>> getPopular({int page = 0}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 0}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    
    return _jsonToMovies(response.data);
  }

   @override
  Future<List<Movie>> getRated({int page = 0}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

 @override
  Future<Movie> getMovieById (String id) async {
    final response = await dio.get('/movie$id}');
    if(response.statusCode != 200) throw Exception('movie with id: $id not found');
    final movieDetails= MovieDetails.fromJson(response.data);
    final movie = MovieMapper.movieDetailsToEntity(movieDetails);
    
    return movie;
  }
  





}