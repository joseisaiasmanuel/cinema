
import 'package:cinema/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinema/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref){
return MovieRepositoryImpl(MoviedbDatasource());

});