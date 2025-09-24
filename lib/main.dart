import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/discover_movies/data/models/cached_category_genre_model.dart';
import 'package:movies_app/features/home/data/models/cached_movies_model.dart';
import 'package:movies_app/features/see_all_movies/data/models/cached_see_all_movies_model.dart';
import 'package:movies_app/features/watch_list/data/models/hive_movie_model.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveMovieModelAdapter());
  Hive.registerAdapter(CachedMoviesModelAdapter());
  Hive.registerAdapter(CachedSeeAllMoviesModelAdapter());
  Hive.registerAdapter(CachedCategoryGenreModelAdapter());
  setupMoviesInjection();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMovieToWatchListAsLocalDataCubit>(
      create: (context) =>
          getIt<AddMovieToWatchListAsLocalDataCubit>()..getAllWatchListMovies(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
