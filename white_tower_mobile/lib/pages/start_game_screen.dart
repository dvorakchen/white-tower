import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/services/question_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/widgets/show_loading.dart';

part 'start_game_screen.g.dart';

class StartGameScreen extends HookConsumerWidget {
  final int tableLevelId;

  const StartGameScreen({super.key, required this.tableLevelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final state = ref.watch(gameQuestionProvider(tableLevelId));

    return Scaffold(
      // 建议使用 Scaffold 而不是裸露的 Container
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(color: cs.surface),
        child: SafeArea(
          // 使用 AsyncValue 的 when 方法来处理状态
          child: state.when(
            // 1. 加载中状态
            loading: () => const ShowLoading(),

            // 2. 加载失败状态
            error: (err, stack) => ShowError(error: err),

            // 3. 加载成功状态 (data)
            data: (questions) {
              if (questions.isEmpty) {
                return const Center(child: Text('本关卡暂无题目'));
              }
              // 数据加载成功，渲染第一个题目或题目列表
              return ShowQuestionList(questions: questions);
            },
          ),
        ),
      ),
    );
  }
}

class ShowQuestionList extends HookConsumerWidget {
  final List<GameQuestionModel> questions;

  const ShowQuestionList({super.key, required this.questions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    if (questions.isEmpty) {
      return const Center(child: Text('本关卡暂无题目'));
    }
    // 数据加载成功，渲染第一个题目或题目列表
    return PageView.builder(
      controller: pageController,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final item = questions[index];
        return Column(
          children: [
            Text(item.question),
            TextButton(
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }
}

class ShowError extends StatelessWidget {
  final Object error;

  const ShowError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 40, color: Colors.red),
            const SizedBox(height: 10),
            const Text(
              '问题加载失败',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              '错误信息: $error',
              textAlign: TextAlign.center,
              style: TextStyle(color: cs.error),
            ),
          ],
        ),
      ),
    );
  }
}

@riverpod
class GameQuestion extends _$GameQuestion {
  late QuestionService service;

  @override
  Future<List<GameQuestionModel>> build(int gameLevelId) async {
    service = GetIt.instance<QuestionService>();
    return service.fetchQuestionsByGameLevelId(gameLevelId);
  }
}
