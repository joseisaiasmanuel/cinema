import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';



class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({Key? key, required this.movieId}) : super(key: key);
  static const name='movie-screen';
  final String movieId;

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
   
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("actor ${widget.movieId}")
      )
    );
  }
}