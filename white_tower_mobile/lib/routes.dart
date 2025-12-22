// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:white_tower_mobile/pages/splash_screen.dart';
import 'package:white_tower_mobile/pages/start_game_screen.dart';
import 'package:white_tower_mobile/pages/subject_list_screen.dart';
// import 'package:white_tower_mobile/pages/table_of_subject_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/subjects',
      builder: (context, state) => const SubjectListScreen(),
      routes: [
        GoRoute(
          path: ':subject_id/games/:game_level_id/:game_level_title',
          builder: (context, state) => StartGameScreen(
            tableLevelId: int.parse(state.pathParameters['game_level_id']!),
            tableLevelTitle: state.pathParameters['game_level_title']!,
          ),
        ),
      ],
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
);
