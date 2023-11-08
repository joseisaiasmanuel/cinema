import '../entities/movie.dart';

abstract class MoviesDatasource {

Future<List<Movie>> getNowPlaying ({int page= 0});

Future<List<Movie>> getPopular({int page = 0});

Future<List<Movie>> getUpcoming({int page = 0});

Future<List<Movie>> getRated({int page = 0});







  
}