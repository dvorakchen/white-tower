import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:white_tower_mobile/models/game.dart';
import 'package:white_tower_mobile/pages/games/game_result_screen.dart';
import 'package:white_tower_mobile/pages/splash_screen.dart';
import 'package:white_tower_mobile/pages/games/start_game_screen.dart';
import 'package:white_tower_mobile/pages/subject_list_screen.dart';

CustomTransitionPage<T> _defaultPageBuilder<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  const transitionDuration = Duration(milliseconds: 200);

  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: _rightToLeft,
    transitionDuration: transitionDuration,
  );
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashScreen()),
    ),
    GoRoute(
      path: '/subjects',
      pageBuilder: (context, state) => _defaultPageBuilder(
        context: context,
        state: state,
        child: const SubjectListScreen(),
      ),
      routes: [
        GoRoute(
          path: ':subject_id/games/:game_level_id/:game_level_title',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: StartGameScreen(
              tableLevelId: int.parse(state.pathParameters['game_level_id']!),
              tableLevelTitle: state.pathParameters['game_level_title']!,
            ),
            transitionsBuilder: _rightToLeft,
            transitionDuration: const Duration(milliseconds: 200),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/game_result',
      name: 'game_result',
      pageBuilder: (context, state) {
        return _defaultPageBuilder(
          context: context,
          state: state,

          child: GameResultScreen(gameResult: state.extra as GameResult),
        );
      },
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
);

Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
)
_rightToLeft =
    (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    };

class ExitGuard extends StatelessWidget {
  final Widget child;

  const ExitGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isMounted = context.mounted;

    return PopScope(
      canPop: false, // 禁止系统 pop
      onPopInvokedWithResult: (didPop, v) async {
        if (didPop) return;
        if (!isMounted) return;
        await Future.delayed(const Duration(seconds: 2));
        if (!isMounted) return;
      },
      child: child,
    );
  }
}
