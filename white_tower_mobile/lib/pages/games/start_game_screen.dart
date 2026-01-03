import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/models/game.dart';
import 'package:white_tower_mobile/services/audio_service.dart';
import 'package:white_tower_mobile/services/question_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';
import 'package:white_tower_mobile/widgets/components/button.dart';
import 'package:white_tower_mobile/widgets/games/single_choice.dart';
import 'package:white_tower_mobile/widgets/show_error.dart';
import 'package:white_tower_mobile/widgets/show_loading.dart';

part 'start_game_screen.g.dart';
part 'start_game_screen.freezed.dart';

class StartGameScreen extends HookConsumerWidget {
  final int tableLevelId;
  final String tableLevelTitle;

  const StartGameScreen({
    super.key,
    required this.tableLevelId,
    required this.tableLevelTitle,
  });

  static int _answerredCount = 0;
  static int _questionCount = 0;
  static GameResult _gameresult = GameResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);
    final state = ref.watch(_gameQuestionProvider(tableLevelId));
    final answerResultState = ref.watch(_answerResultProvider);

    return Container(
      color: cs.base100,
      child: Stack(
        children: [
          Column(
            children: [
              _TopBar(title: tableLevelTitle),
              Expanded(
                child: Padding(
                  padding: .only(top: 20),
                  child: state.when(
                    loading: () => const ShowLoading(),
                    error: (err, stack) => ShowError(error: err),
                    data: (questions) {
                      _questionCount = questions.length;
                      if (questions.isEmpty) {
                        return const Center(child: Text('本关卡暂无题目'));
                      }
                      return ShowQuestionList(questions: questions);
                    },
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.ease,
            bottom: answerResultState.isShowMessage ? 0 : -230,
            left: 0,
            right: 0,
            child: _AnswerResultMessage(type: answerResultState.type),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends ConsumerWidget {
  final String title;

  const _TopBar({required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);

    return Container(
      decoration: BoxDecoration(color: cs.base100),
      child: SafeArea(
        child: Row(
          spacing: 20,
          children: [
            IconButton(
              icon: const Text('✖️'),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashRadius: 20.0,
              onPressed: () => context.pop(),
            ),
            Text(title, style: TextStyle(fontSize: 20, fontWeight: .w500)),
          ],
        ),
      ),
    );
  }
}

enum AnswerResultMessageType { success, warning, wrong }

class _AnswerResultMessage extends HookConsumerWidget {
  final AnswerResultMessageType type;

  const _AnswerResultMessage({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);
    final pageCtl = ref.read(pageCtlProvider.notifier);
    final answerResultNotify = ref.read(_answerResultProvider.notifier);
    final answerResultState = ref.read(_answerResultProvider);

    final isCorrect = type == .success;

    var textColor = Color.lerp(cs.success, Colors.black, 0.5)!;
    var bgColor = Color.lerp(cs.success, Colors.white, 0.7);

    if (type == .wrong) {
      textColor = Color.lerp(cs.error, Colors.black, 0.5)!;
      bgColor = Color.lerp(cs.error, Colors.white, 0.7);
    } else if (type == .warning) {
      textColor = Color.lerp(cs.warning, Colors.black, 0.5)!;
      bgColor = Color.lerp(cs.warning, Colors.white, 0.7);
    }

    void nextQuestion() {
      debugPrint(
        'question count: ${StartGameScreen._questionCount}, answerred count: ${StartGameScreen._answerredCount}',
      );
      answerResultNotify.hideAnswerResultMessage();

      if (StartGameScreen._answerredCount >= StartGameScreen._questionCount) {
        StartGameScreen._questionCount = StartGameScreen._answerredCount = 0;
        final extra = StartGameScreen._gameresult;
        context.pushReplacementNamed('game_result', extra: extra);
        StartGameScreen._gameresult = GameResult();
        return;
      }

      pageCtl.getPageController()?.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: DefaultTextStyle(
        style: TextStyle(color: textColor, fontWeight: .w500),
        child: Padding(
          padding: .only(left: 20, right: 20, top: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Text(
                isCorrect ? '✔️ 回答正确！' : '✖️ 回答错误！',
                style: TextStyle(fontSize: 24),
              ),
              if (answerResultState.message.isNotEmpty)
                Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    // Text('正确答案：', style: TextStyle(fontSize: 18)),
                    Text(
                      answerResultState.message,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              Align(
                alignment: .bottomCenter,
                child: Button(
                  onPress: nextQuestion,
                  label: '继续',
                  type: type == .success ? .success : .wrong,
                ),
              ),
            ],
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
    final audioService = GetIt.instance<AudioService>();

    final answerResultNotify = ref.read(_answerResultProvider.notifier);
    final pageCtl = ref.read(pageCtlProvider.notifier);

    void onSingleChoiceSelected(
      String selectedValue,
      bool isCorrect,
      GameQuestionModel model,
    ) async {
      debugPrint(selectedValue);

      if (isCorrect) {
        await audioService.playAnswerCorrect();
        answerResultNotify.showAnswerResultForCorrect();
      } else {
        await audioService.playAnswerWrong();
        answerResultNotify.showAnswerResultForWrong(model.explanation);
      }

      StartGameScreen._answerredCount++;
      StartGameScreen._gameresult.list.add(
        GameResultItem(model, selectedValue, isCorrect),
      );
    }

    final pageController = usePageController();
    pageCtl.setPageController(pageController);

    if (questions.isEmpty) {
      return const Center(child: Text('本关卡暂无题目'));
    }
    // 数据加载成功，渲染第一个题目或题目列表
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final item = questions[index];
        if (item.type == .singleChoice) {
          return SingleChoice(
            model: item,
            onSelect: (value, isCorrect) {
              onSingleChoiceSelected(value, isCorrect, item);
            },
          );
        }
        return Column(
          children: [
            Text(item.question),
            TextButton(
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
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

@freezed
abstract class CurrentAnswerResultState with _$CurrentAnswerResultState {
  const factory CurrentAnswerResultState({
    required bool isShowMessage,
    required AnswerResultMessageType type,
    required String message,
  }) = _CurrentAnswerResultState;
}

@riverpod
class PageCtl extends _$PageCtl {
  PageController? _pageController;

  @override
  void build() {}

  void setPageController(PageController ctl) {
    _pageController = ctl;
  }

  PageController? getPageController() {
    return _pageController;
  }
}

@riverpod
class _AnswerResult extends _$AnswerResult {
  @override
  CurrentAnswerResultState build() {
    return CurrentAnswerResultState(
      isShowMessage: false,
      type: .success,
      message: '',
    );
  }

  void showAnswerResultForCorrect() {
    state = state.copyWith(isShowMessage: true, type: .success, message: '');
  }

  void showAnswerResultForWrong(String msg) {
    state = state.copyWith(isShowMessage: true, type: .wrong, message: msg);
  }

  void hideAnswerResultMessage() {
    state = state.copyWith(isShowMessage: false, message: '');
  }
}

@riverpod
class _GameQuestion extends _$GameQuestion {
  late QuestionService service;

  @override
  Future<List<GameQuestionModel>> build(int gameLevelId) async {
    service = GetIt.instance<QuestionService>();
    final list = service.fetchQuestionsByGameLevelId(gameLevelId);
    return list;
  }
}
