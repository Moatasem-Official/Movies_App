import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/cubits/lang/cubit/locale_cubit.dart';
import 'package:movies_app/core/cubits/network/cubit/network_cubit.dart';
import 'package:movies_app/core/cubits/network/cubit/network_state.dart';
import 'package:movies_app/core/cubits/theme/cubit/theme_cubit.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/discover_movies/data/models/cached_category_genre_model.dart';
import 'package:movies_app/features/discover_movies/presentation/helpers/custom_snack_bar_widget.dart';
import 'package:movies_app/features/home/data/models/cached_movies_model.dart';
import 'package:movies_app/features/see_all_movies/data/models/cached_see_all_movies_model.dart';
import 'package:movies_app/features/watch_list/data/models/hive_movie_model.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveMovieModelAdapter());
  Hive.registerAdapter(CachedMoviesModelAdapter());
  Hive.registerAdapter(CachedSeeAllMoviesModelAdapter());
  Hive.registerAdapter(CachedCategoryGenreModelAdapter());
  await setupMoviesInjection();
  final locale = getIt<SharedPreferences>().getString('locale');
  final theme = getIt<SharedPreferences>().getString('theme');
  final themeMode = theme == ThemeMode.dark.toString()
      ? ThemeMode.dark
      : theme == ThemeMode.light.toString()
          ? ThemeMode.light
          : ThemeMode.dark;
  getIt<ThemeCubit>().changeTheme(themeMode);
  getIt<LocaleCubit>().changeLocale(Locale(locale ?? 'en'));
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  bool _hasShownInitialSnackBar = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddMovieToWatchListAsLocalDataCubit>(
          create: (context) => getIt<AddMovieToWatchListAsLocalDataCubit>()
            ..getAllWatchListMovies(),
        ),
        BlocProvider<LocaleCubit>(create: (context) => getIt<LocaleCubit>()),
        BlocProvider<ThemeCubit>(create: (context) => getIt<ThemeCubit>()),
        BlocProvider<NetworkCubit>(create: (context) => getIt<NetworkCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                scaffoldMessengerKey: scaffoldMessengerKey,
                locale: locale,
                themeMode: themeMode,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en'), Locale('ar')],
                theme: ThemeData(
                    fontFamily:
                        locale.languageCode == 'en' ? 'Poppins' : 'Cairo'),
                darkTheme: ThemeData(
                  fontFamily: locale.languageCode == 'en' ? 'Poppins' : 'Cairo',
                  brightness: Brightness.dark,
                ),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter.onGenerateRoute,
                builder: (context, child) {
                  return BlocListener<NetworkCubit, NetworkState>(
                    listener: (context, state) {
                      // أول Emit عند فتح التطبيق
                      if (!_hasShownInitialSnackBar) {
                        _hasShownInitialSnackBar = true;
                        // لو disconnected أول مرة، اعرض SnackBar فورًا
                        if (state is Disconnected) {
                          scaffoldMessengerKey.currentState?.showSnackBar(
                            customSnackBar(
                              duration: 5,
                              icon: Icons.wifi_off,
                              message: S.of(context).noInternetConnection,
                            ),
                          );
                        }
                        return;
                      }

                      scaffoldMessengerKey.currentState?.showSnackBar(
                        customSnackBar(
                          duration: 5,
                          icon:
                              state is Connected ? Icons.wifi : Icons.wifi_off,
                          message: state.when(
                            connected: (_) => S.of(context).connectedToInternet,
                            disconnected: () =>
                                S.of(context).noInternetConnection,
                          ),
                        ),
                      );
                    },
                    child: child, // ده أي صفحة هتجيلك من onGenerateRoute
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
