import 'package:cinema/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/movies/movies_providers.dart';
import 'package:cinema/presentation/widgets/widgets.dart';

import '../../providers/movies/movies_slideshow_provider.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(ratedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies= ref.watch(upcomingMoviesProvider);
    final ratedMovies= ref.watch(ratedMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppbar(),

            MoviesSlideshow(movies: slideShowMovies),

            MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),

                MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Próximamente',
                subTitle: 'este mês',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage()),
              

            MovieHorizontalListview(
                movies: popularMovies,
                title: 'Populares',
                //subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage()),

            MovieHorizontalListview(
                movies: ratedMovies,
                title: 'Qualificados',
                subTitle: 'todos os tempos',
                loadNextPage: () =>
                    ref.read(ratedMoviesProvider.notifier).loadNextPage()),

            const SizedBox(height: 10),
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
