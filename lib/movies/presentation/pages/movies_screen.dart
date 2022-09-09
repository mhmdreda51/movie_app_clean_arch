import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services_locator/services_locator.dart';
import '../../../core/utils/app_strings.dart';
import '../components/now_playing_components.dart';
import '../components/popular_components.dart';
import '../components/top_rated_components.dart';
import '../controller/Movies/movies_bloc.dart';
import '../widgets/category_header.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponents(),
              CategoryHeader(
                onTap: () {},
                title: AppStrings.popular,
              ),
              const PopularComponents(),
              CategoryHeader(
                onTap: () {},
                title: AppStrings.topRated,
              ),
              const TopRatedComponents(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
