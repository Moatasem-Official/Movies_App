// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Connected To Internet`
  String get connectedToInternet {
    return Intl.message(
      'Connected To Internet',
      name: 'connectedToInternet',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `NOW PLAYING`
  String get nowPlaying {
    return Intl.message('NOW PLAYING', name: 'nowPlaying', desc: '', args: []);
  }

  /// `Now Playing Movies`
  String get nowPlayingMovies {
    return Intl.message(
      'Now Playing Movies',
      name: 'nowPlayingMovies',
      desc: '',
      args: [],
    );
  }

  /// `Popular Movies`
  String get popularMovies {
    return Intl.message(
      'Popular Movies',
      name: 'popularMovies',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Top Rated Movies`
  String get topRatedMovies {
    return Intl.message(
      'Top Rated Movies',
      name: 'topRatedMovies',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Movies`
  String get upcomingMovies {
    return Intl.message(
      'Upcoming Movies',
      name: 'upcomingMovies',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Discover`
  String get discover {
    return Intl.message('Discover', name: 'discover', desc: '', args: []);
  }

  /// `Movies`
  String get movies {
    return Intl.message('Movies', name: 'movies', desc: '', args: []);
  }

  /// `Watchlist`
  String get watchlist {
    return Intl.message('Watchlist', name: 'watchlist', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Budget`
  String get budget {
    return Intl.message('Budget', name: 'budget', desc: '', args: []);
  }

  /// `Revenue`
  String get revenue {
    return Intl.message('Revenue', name: 'revenue', desc: '', args: []);
  }

  /// `Popularity`
  String get popularity {
    return Intl.message('Popularity', name: 'popularity', desc: '', args: []);
  }

  /// `Vote Count`
  String get voteCount {
    return Intl.message('Vote Count', name: 'voteCount', desc: '', args: []);
  }

  /// `Original Language`
  String get originalLanguage {
    return Intl.message(
      'Original Language',
      name: 'originalLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `No Production Companies Found`
  String get noProductionCompaniesFound {
    return Intl.message(
      'No Production Companies Found',
      name: 'noProductionCompaniesFound',
      desc: '',
      args: [],
    );
  }

  /// `No {title} Found`
  String noTitledFound(Object title) {
    return Intl.message(
      'No $title Found',
      name: 'noTitledFound',
      desc: '',
      args: [title],
    );
  }

  /// `No Similar Movies Found`
  String get noSimilarMoviesFound {
    return Intl.message(
      'No Similar Movies Found',
      name: 'noSimilarMoviesFound',
      desc: '',
      args: [],
    );
  }

  /// `No Movie Images Found`
  String get noMovieImagesFound {
    return Intl.message(
      'No Movie Images Found',
      name: 'noMovieImagesFound',
      desc: '',
      args: [],
    );
  }

  /// `No Movie Crew Found`
  String get noMovieCrewFound {
    return Intl.message(
      'No Movie Crew Found',
      name: 'noMovieCrewFound',
      desc: '',
      args: [],
    );
  }

  /// `No Movie Cast Found`
  String get NoMovieCastFound {
    return Intl.message(
      'No Movie Cast Found',
      name: 'NoMovieCastFound',
      desc: '',
      args: [],
    );
  }

  /// `Not Available`
  String get notAvailable {
    return Intl.message(
      'Not Available',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Not Specified`
  String get notSpecified {
    return Intl.message(
      'Not Specified',
      name: 'notSpecified',
      desc: '',
      args: [],
    );
  }

  /// `No Videos Found`
  String get noVideosFound {
    return Intl.message(
      'No Videos Found',
      name: 'noVideosFound',
      desc: '',
      args: [],
    );
  }

  /// `No Overview Available`
  String get noOverviewAvailable {
    return Intl.message(
      'No Overview Available',
      name: 'noOverviewAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No Genres Available`
  String get noGenresAvailable {
    return Intl.message(
      'No Genres Available',
      name: 'noGenresAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Official`
  String get official {
    return Intl.message('Official', name: 'official', desc: '', args: []);
  }

  /// `As ${actorCharacter}`
  String asPlusActorCharacter(Object actorCharacter) {
    return Intl.message(
      'As \$$actorCharacter',
      name: 'asPlusActorCharacter',
      desc: '',
      args: [actorCharacter],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Production Companies`
  String get productionCompanies {
    return Intl.message(
      'Production Companies',
      name: 'productionCompanies',
      desc: '',
      args: [],
    );
  }

  /// `Production Countries`
  String get productionCountries {
    return Intl.message(
      'Production Countries',
      name: 'productionCountries',
      desc: '',
      args: [],
    );
  }

  /// `Spoken Languages`
  String get spokenLanguages {
    return Intl.message(
      'Spoken Languages',
      name: 'spokenLanguages',
      desc: '',
      args: [],
    );
  }

  /// `GENRES`
  String get genres {
    return Intl.message('GENRES', name: 'genres', desc: '', args: []);
  }

  /// `CAST`
  String get cast {
    return Intl.message('CAST', name: 'cast', desc: '', args: []);
  }

  /// `KEY CREW`
  String get keyCrew {
    return Intl.message('KEY CREW', name: 'keyCrew', desc: '', args: []);
  }

  /// `MOVIE GALLERY`
  String get movieGallery {
    return Intl.message(
      'MOVIE GALLERY',
      name: 'movieGallery',
      desc: '',
      args: [],
    );
  }

  /// `Backdrops`
  String get backdrops {
    return Intl.message('Backdrops', name: 'backdrops', desc: '', args: []);
  }

  /// `Posters`
  String get posters {
    return Intl.message('Posters', name: 'posters', desc: '', args: []);
  }

  /// `Logos`
  String get logos {
    return Intl.message('Logos', name: 'logos', desc: '', args: []);
  }

  /// `MORE LIKE THIS`
  String get moreLikeThis {
    return Intl.message(
      'MORE LIKE THIS',
      name: 'moreLikeThis',
      desc: '',
      args: [],
    );
  }

  /// `VIEW ALL`
  String get viewAll {
    return Intl.message('VIEW ALL', name: 'viewAll', desc: '', args: []);
  }

  /// `VIDEOS`
  String get videos {
    return Intl.message('VIDEOS', name: 'videos', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Known For`
  String get knownFor {
    return Intl.message('Known For', name: 'knownFor', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Similar To {movieName}`
  String similarTo(Object movieName) {
    return Intl.message(
      'Similar To $movieName',
      name: 'similarTo',
      desc: '',
      args: [movieName],
    );
  }

  /// `Adventure`
  String get adventure {
    return Intl.message('Adventure', name: 'adventure', desc: '', args: []);
  }

  /// `Action`
  String get action {
    return Intl.message('Action', name: 'action', desc: '', args: []);
  }

  /// `Animation`
  String get animation {
    return Intl.message('Animation', name: 'animation', desc: '', args: []);
  }

  /// `Comedy`
  String get comedy {
    return Intl.message('Comedy', name: 'comedy', desc: '', args: []);
  }

  /// `Crime`
  String get crime {
    return Intl.message('Crime', name: 'crime', desc: '', args: []);
  }

  /// `Documentary`
  String get documentary {
    return Intl.message('Documentary', name: 'documentary', desc: '', args: []);
  }

  /// `Drama`
  String get drama {
    return Intl.message('Drama', name: 'drama', desc: '', args: []);
  }

  /// `Family`
  String get family {
    return Intl.message('Family', name: 'family', desc: '', args: []);
  }

  /// `Fantasy`
  String get fantasy {
    return Intl.message('Fantasy', name: 'fantasy', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Horror`
  String get horror {
    return Intl.message('Horror', name: 'horror', desc: '', args: []);
  }

  /// `Music`
  String get music {
    return Intl.message('Music', name: 'music', desc: '', args: []);
  }

  /// `Mystery`
  String get mystery {
    return Intl.message('Mystery', name: 'mystery', desc: '', args: []);
  }

  /// `Romance`
  String get romance {
    return Intl.message('Romance', name: 'romance', desc: '', args: []);
  }

  /// `Science Fiction`
  String get scienceFiction {
    return Intl.message(
      'Science Fiction',
      name: 'scienceFiction',
      desc: '',
      args: [],
    );
  }

  /// `TV Movie`
  String get tvMovie {
    return Intl.message('TV Movie', name: 'tvMovie', desc: '', args: []);
  }

  /// `Thriller`
  String get thriller {
    return Intl.message('Thriller', name: 'thriller', desc: '', args: []);
  }

  /// `War`
  String get war {
    return Intl.message('War', name: 'war', desc: '', args: []);
  }

  /// `Western`
  String get western {
    return Intl.message('Western', name: 'western', desc: '', args: []);
  }

  /// `Find Your Movie`
  String get findYourMovie {
    return Intl.message(
      'Find Your Movie',
      name: 'findYourMovie',
      desc: '',
      args: [],
    );
  }

  /// `Search For A Movie`
  String get searchForAMovie {
    return Intl.message(
      'Search For A Movie',
      name: 'searchForAMovie',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `No Movies Found`
  String get noMovieFound {
    return Intl.message(
      'No Movies Found',
      name: 'noMovieFound',
      desc: '',
      args: [],
    );
  }

  /// `Search For {categoryName} Movies`
  String searchFor(Object categoryName) {
    return Intl.message(
      'Search For $categoryName Movies',
      name: 'searchFor',
      desc: '',
      args: [categoryName],
    );
  }

  /// `Start Typing To Search For A Movie`
  String get startTypingToSearchForAMovie {
    return Intl.message(
      'Start Typing To Search For A Movie',
      name: 'startTypingToSearchForAMovie',
      desc: '',
      args: [],
    );
  }

  /// `Your Watchlist Is Empty`
  String get yourWatchlistIsEmpty {
    return Intl.message(
      'Your Watchlist Is Empty',
      name: 'yourWatchlistIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add Movies You Want To Watch Later`
  String get addMoviesYouWantToWatchLater {
    return Intl.message(
      'Add Movies You Want To Watch Later',
      name: 'addMoviesYouWantToWatchLater',
      desc: '',
      args: [],
    );
  }

  /// `My Watchlist`
  String get myWatchlist {
    return Intl.message(
      'My Watchlist',
      name: 'myWatchlist',
      desc: '',
      args: [],
    );
  }

  /// `APPEARANCE`
  String get appearance {
    return Intl.message('APPEARANCE', name: 'appearance', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Select Theme`
  String get selectTheme {
    return Intl.message(
      'Select Theme',
      name: 'selectTheme',
      desc: '',
      args: [],
    );
  }

  /// `CONTENT & PRIVACY`
  String get contentAndPrivacy {
    return Intl.message(
      'CONTENT & PRIVACY',
      name: 'contentAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Watchlist has been cleared successfully`
  String get clearWatchlistMessageSuccess {
    return Intl.message(
      'Watchlist has been cleared successfully',
      name: 'clearWatchlistMessageSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Clear Watchlist`
  String get clearWatchlist {
    return Intl.message(
      'Clear Watchlist',
      name: 'clearWatchlist',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Remove`
  String get remove {
    return Intl.message('Remove', name: 'remove', desc: '', args: []);
  }

  /// `Remove Movie ?`
  String get removeMovie {
    return Intl.message(
      'Remove Movie ?',
      name: 'removeMovie',
      desc: '',
      args: [],
    );
  }

  /// `This action will permanently remove the movie from your watchlist. Are you sure you want to proceed ?`
  String get removeMovieFromWatchlist {
    return Intl.message(
      'This action will permanently remove the movie from your watchlist. Are you sure you want to proceed ?',
      name: 'removeMovieFromWatchlist',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to permanently clear the watchlist?`
  String get clearWatchlistConfirmation {
    return Intl.message(
      'Are you sure you want to permanently clear the watchlist?',
      name: 'clearWatchlistConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `FEEDBACK & SUPPORT`
  String get feedbackAndSupport {
    return Intl.message(
      'FEEDBACK & SUPPORT',
      name: 'feedbackAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Report a Bug`
  String get reportABug {
    return Intl.message('Report a Bug', name: 'reportABug', desc: '', args: []);
  }

  /// `Submitting...`
  String get loadingButtonMessage {
    return Intl.message(
      'Submitting...',
      name: 'loadingButtonMessage',
      desc: '',
      args: [],
    );
  }

  /// `Report sent successfully! Thank you.`
  String get reportABugSuccessMessage {
    return Intl.message(
      'Report sent successfully! Thank you.',
      name: 'reportABugSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Describe the bug here...`
  String get describeTheBugHere {
    return Intl.message(
      'Describe the bug here...',
      name: 'describeTheBugHere',
      desc: '',
      args: [],
    );
  }

  /// `Submit Report`
  String get submitReport {
    return Intl.message(
      'Submit Report',
      name: 'submitReport',
      desc: '',
      args: [],
    );
  }

  /// `Help us improve by describing the issue you encountered.`
  String get helpUsImprove {
    return Intl.message(
      'Help us improve by describing the issue you encountered.',
      name: 'helpUsImprove',
      desc: '',
      args: [],
    );
  }

  /// `Suggest a Feature`
  String get suggestAFeature {
    return Intl.message(
      'Suggest a Feature',
      name: 'suggestAFeature',
      desc: '',
      args: [],
    );
  }

  /// `Brilliant idea! Thanks for your suggestion.`
  String get suggestAFeatureSuccessMessage {
    return Intl.message(
      'Brilliant idea! Thanks for your suggestion.',
      name: 'suggestAFeatureSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Have a brilliant idea? We'd love to hear about it!`
  String get brilliantIdea {
    return Intl.message(
      'Have a brilliant idea? We\'d love to hear about it!',
      name: 'brilliantIdea',
      desc: '',
      args: [],
    );
  }

  /// `Describe your amazing idea...`
  String get describeYourIdea {
    return Intl.message(
      'Describe your amazing idea...',
      name: 'describeYourIdea',
      desc: '',
      args: [],
    );
  }

  /// `Send Suggestion`
  String get sendSuggestion {
    return Intl.message(
      'Send Suggestion',
      name: 'sendSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Rate App`
  String get rateApp {
    return Intl.message('Rate App', name: 'rateApp', desc: '', args: []);
  }

  /// `Your Rating Is : {rating}`
  String rateAppSuccessMessage(Object rating) {
    return Intl.message(
      'Your Rating Is : $rating',
      name: 'rateAppSuccessMessage',
      desc: '',
      args: [rating],
    );
  }

  /// `How was your experience?`
  String get howWasYourExperience {
    return Intl.message(
      'How was your experience?',
      name: 'howWasYourExperience',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback helps us improve`
  String get yourFeedbackHelpsUsImprove {
    return Intl.message(
      'Your feedback helps us improve',
      name: 'yourFeedbackHelpsUsImprove',
      desc: '',
      args: [],
    );
  }

  /// `Hated it 😠`
  String get hatedIt {
    return Intl.message('Hated it 😠', name: 'hatedIt', desc: '', args: []);
  }

  /// `Disliked it 🙁`
  String get dislikedIt {
    return Intl.message(
      'Disliked it 🙁',
      name: 'dislikedIt',
      desc: '',
      args: [],
    );
  }

  /// `It's Ok 👌`
  String get itsOk {
    return Intl.message('It\'s Ok 👌', name: 'itsOk', desc: '', args: []);
  }

  /// `Liked it 😊`
  String get likedIt {
    return Intl.message('Liked it 😊', name: 'likedIt', desc: '', args: []);
  }

  /// `Loved it! 😍`
  String get lovedIt {
    return Intl.message('Loved it! 😍', name: 'lovedIt', desc: '', args: []);
  }

  /// `Submit Rating`
  String get submitRating {
    return Intl.message(
      'Submit Rating',
      name: 'submitRating',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String version(Object version) {
    return Intl.message(
      'Version $version',
      name: 'version',
      desc: '',
      args: [version],
    );
  }

  /// `Movie Added To Watchlist`
  String get movieAddedToWatchlistMessage {
    return Intl.message(
      'Movie Added To Watchlist',
      name: 'movieAddedToWatchlistMessage',
      desc: '',
      args: [],
    );
  }

  /// `Movie Removed From Watchlist`
  String get movieRemovedFromWatchlistMessage {
    return Intl.message(
      'Movie Removed From Watchlist',
      name: 'movieRemovedFromWatchlistMessage',
      desc: '',
      args: [],
    );
  }

  /// `All Movies Removed From Watchlist`
  String get allMoviesRemovedFromWatchlistMessage {
    return Intl.message(
      'All Movies Removed From Watchlist',
      name: 'allMoviesRemovedFromWatchlistMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
