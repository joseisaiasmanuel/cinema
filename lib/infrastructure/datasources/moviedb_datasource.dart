
import 'package:cinema/domain/entities/movie.dart';
import 'package:cinema/infrastructure/mappers/movie_mapper.dart';
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


  @override
  Future<List<Movie>> getNowPlaying({int page = 0}
  
  ) async {
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page':page
    }
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movie =movieDBResponse.results.where((moviedb) => (moviedb.posterPath != 'no-poster'))
    .map(
      (moviedb)=> MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movie;
  }





}