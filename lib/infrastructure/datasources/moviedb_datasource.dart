
import 'package:cinema/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../config/contantants/environment.dart';
import '../../domain/datasources/movie_datasource.dart';

class MoviedbDatasource extends MovieDatasources {
   final dio = Dio(BaseOptions(
     baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-Mx'
    }
   )
     
   );


  @override
  Future<List<Movie>> getNowPlaying({int page = 0}) async {

    final response = await dio.get('/movie/now_playing');

    final List<Movie> movie =[];

    return movie;
  }





}