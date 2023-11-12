
import 'package:cinema/domain/datasources/movie_datasource.dart';
import 'package:cinema/domain/entities/movie.dart';
import 'package:cinema/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

    @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

    @override
  Future<List<Movie>>getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

    @override
  Future<List<Movie>> getRated({int page = 1}) {
    return datasource.getRated(page: page);
  }
 
   @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
  

  
}
