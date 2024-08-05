// ignore_for_file: constant_identifier_names, unused_import

import 'package:flutter/material.dart';

// 定義 MovieType 列舉
enum MovieType { Action, Comedy, Drama, Horror, SciFi }

// 定義電影數據
final Map<MovieType, List<String>> movies = {
  MovieType.Action: [
    'Spider-Man',
    'Iron Man',
    'The Avengers',
    'Black Panther',
    'Guardians of the Galaxy'
  ],
  MovieType.Comedy: [
    'The Hangover',
    'Superbad',
    'Step Brothers',
    'Bridesmaids',
    '21 Jump Street'
  ],
  MovieType.Drama: [
    'The Shawshank Redemption',
    'Forrest Gump',
    'The Godfather',
    'Fight Club',
    'The Green Mile'
  ],
  MovieType.Horror: [
    'The Conjuring',
    'Get Out',
    'A Quiet Place',
    'It',
    'Hereditary'
  ],
  MovieType.SciFi: [
    'Inception',
    'The Matrix',
    'Interstellar',
    'Blade Runner 2049',
    'Arrival'
  ],
};
