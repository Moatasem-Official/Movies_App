import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/cubits/lang/cubit/locale_cubit.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/discover_movies/data/models/cached_category_genre_model.dart';
import 'package:movies_app/features/home/data/models/cached_movies_model.dart';
import 'package:movies_app/features/see_all_movies/data/models/cached_see_all_movies_model.dart';
import 'package:movies_app/features/watch_list/data/models/hive_movie_model.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/generated/l10n.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AddMovieToWatchListAsLocalDataCubit>(
              create: (context) => getIt<AddMovieToWatchListAsLocalDataCubit>()
                ..getAllWatchListMovies()),
          BlocProvider<LocaleCubit>(create: (context) => LocaleCubit())
        ],
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp(
              locale: locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme:
                  ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        ));
  }
}
