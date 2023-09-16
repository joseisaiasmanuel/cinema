import '../entities/movie.dart';

abstract class MovieDatasources {

Future<List<Movie>> getNowPlaying ({int page= 0});










  
}