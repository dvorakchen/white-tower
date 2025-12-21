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
          path: ':subject_id/games/:game_level_id',
          builder: (context, state) => StartGameScreen(
            tableLevelId: int.parse(state.pathParameters['game_level_id']!),
          ),
          // pageBuilder: (context, state) {
          //   return CustomTransitionPage(
          //     key: state.pageKey,
          //     child: StartGameScreen(
          //       tableLevelId: int.parse(state.pathParameters['game_level_id']!),
          //     ),
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) {
          //           // 默认中心点为屏幕中央
          //           const Offset center = Offset(0.5, 0.5); // 0.5, 0.5 表示屏幕中心

          //           // 使用 AnimatedBuilder 监听动画变化
          //           return AnimatedBuilder(
          //             animation: animation,
          //             builder: (context, child) {
          //               // 获取当前动画进度，从 0.0 到 1.0
          //               final double fraction = animation.value;

          //               // ClipPath 使用我们自定义的 Clipper
          //               return ClipPath(
          //                 // 传递当前进度和中心点
          //                 clipper: CircleRevealClipper(
          //                   fraction,
          //                   center.translate(
          //                     MediaQuery.of(context).size.width *
          //                         (center.dx - 0.5),
          //                     MediaQuery.of(context).size.height *
          //                         (center.dy - 0.5),
          //                   ),
          //                 ),
          //                 child: child,
          //               );
          //             },
          //             child: child,
          //           );
          //         },
          //     transitionDuration: const Duration(
          //       milliseconds: 500,
          //     ), // 增加过渡时间以便观察
          //     reverseTransitionDuration: const Duration(milliseconds: 500),
          //   );
          // },
        ),
      ],
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
);
