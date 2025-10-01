import 'package:flutter/material.dart';
import 'package:movies_app/generated/l10n.dart';

String getGenreName(BuildContext context, String genre) {
  switch (genre) {
    case 'Adventure':
      return S.of(context).adventure;
    case 'Action':
      return S.of(context).action;
    case 'Animation':
      return S.of(context).animation;
    case 'Comedy':
      return S.of(context).comedy;
    case 'Crime':
      return S.of(context).crime;
    case 'Documentary':
      return S.of(context).documentary;
    case 'Drama':
      return S.of(context).drama;
    case 'Family':
      return S.of(context).family;
    case 'Fantasy':
      return S.of(context).fantasy;
    case 'History':
      return S.of(context).history;
    case 'Horror':
      return S.of(context).horror;
    case 'Music':
      return S.of(context).music;
    case 'Mystery':
      return S.of(context).mystery;
    case 'Romance':
      return S.of(context).romance;
    case 'Science Fiction':
      return S.of(context).scienceFiction;
    case 'TV Movie':
      return S.of(context).tvMovie;
    case 'Thriller':
      return S.of(context).thriller;
    case 'War':
      return S.of(context).war;
    case 'Western':
      return S.of(context).western;
    default:
      return genre; // fallback لو مش لاقي
  }
}
