import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:white_tower_mobile/pages/splash_screen.dart';
import 'package:white_tower_mobile/pages/start_game_screen.dart';
import 'package:white_tower_mobile/pages/subject_list_screen.dart';
// import 'package:white_tower_mobile/pages/table_of_subject_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(
      path: '/subjects',
      builder: (context, state) => SubjectListScreen(),
      routes: [
        GoRoute(
          path: ':subject_id/games/:game_level_id',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: StartGameScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
              transitionDuration: const Duration(milliseconds: 150),
              reverseTransitionDuration: const Duration(milliseconds: 150),
            );
          },
        ),
      ],
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
);
