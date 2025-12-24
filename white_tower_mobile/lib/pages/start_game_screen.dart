import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/services/audio_service.dart';
import 'package:white_tower_mobile/services/question_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/themes/common.dart';
import 'package:white_tower_mobile/widgets/games/single_choice.dart';
import 'package:white_tower_mobile/widgets/show_error.dart';
import 'package:white_tower_mobile/widgets/show_loading.dart';

part 'start_game_screen.g.dart';

class StartGameScreen extends HookConsumerWidget {
  final int tableLevelId;
  final String tableLevelTitle;

  StartGameScreen({
    super.key,
    required this.tableLevelId,
    required this.tableLevelTitle,
  });

  void back(BuildContext context) {
    context.pop();
  }

  final GlobalKey _messageKey = GlobalKey();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final state = ref.watch(gameQuestionProvider(tableLevelId));
    final answerResultState = ref.watch(answerResultProvider);
    var height = 230.0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_messageKey.currentContext != null) {
        final renderBox =
            _messageKey.currentContext!.findRenderObject() as RenderBox;
        height = renderBox.size.height;
      }
    });

    return Scaffold(
      backgroundColor: cs.surface,
      // 建议使用 Scaffold 而不是裸露的 Container
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('✖️'),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashRadius: 20.0,
          onPressed: () => back(context),
        ),
        title: Text(tableLevelTitle),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: .only(top: 20),
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
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.ease,
            bottom: answerResultState.isShowMessage ? 0 : -height,
            left: 0,
            right: 0,
            child: AnswerResultMessage(
              key: _messageKey,
              type: answerResultState.answerResultMessageType,
            ),
          ),
        ],
      ),
    );
  }
}

enum AnswerResultMessageType { success, warning, wrong }

class AnswerResultMessage extends HookConsumerWidget {
  final AnswerResultMessageType type;

  const AnswerResultMessage({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final pageCtl = ref.read(pageCtlProvider.notifier);
    final answerResultNotify = ref.read(answerResultProvider.notifier);
    final answerResultState = ref.read(answerResultProvider);

    final isCorrect = type == .success;

    var textColor = Color.lerp(CommonColor.success, Colors.black, 0.5)!;
    var bgColor = Color.lerp(CommonColor.success, Colors.white, 0.7);
    var btnBgColor = CommonColor.success;
    var btnTxtColor = CommonColor.onSuccess;
    var btnBdrColor = Color.lerp(CommonColor.success, Colors.black, 0.5)!;

    if (!isCorrect) {
      textColor = Color.lerp(cs.error, Colors.black, 0.5)!;
      bgColor = Color.lerp(cs.error, Colors.white, 0.7);
      btnBgColor = cs.error;
      btnTxtColor = cs.onError;
      btnBdrColor = Color.lerp(cs.error, Colors.black, 0.5)!;
    }

    void nextQuestion() {
      answerResultNotify.hideAnswerResultMessage();
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
              if (answerResultState.errorMessage.isNotEmpty)
                Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Text('正确答案：', style: TextStyle(fontSize: 18)),
                    Text(
                      answerResultState.errorMessage,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              Align(
                alignment: .bottomCenter,
                child: GestureDetector(
                  onTap: nextQuestion,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    padding: .all(5),
                    decoration: BoxDecoration(
                      color: btnBgColor,
                      border: Border(
                        bottom: BorderSide(color: btnBdrColor, width: 3),
                      ),
                      borderRadius: .circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '继续',
                        style: TextStyle(fontSize: 20, color: btnTxtColor),
                      ),
                    ),
                  ),
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

    final answerResultNotify = ref.read(answerResultProvider.notifier);
    final pageCtl = ref.read(pageCtlProvider.notifier);

    void onSingleChoiceSelected(
      String selectedValue,
      GameQuestionModel model,
    ) async {
      debugPrint(selectedValue);
      if (model.answers.contains(selectedValue)) {
        await audioService.playAnswerCorrect();
        answerResultNotify.showAnswerResultForCorrect();
      } else {
        await audioService.playAnswerWrong();
        answerResultNotify.showAnswerResultForWrong(model.answers[0]);
      }
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
            onSelected: (value) {
              onSingleChoiceSelected(value, item);
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

class AnswerResultState {
  bool isShowMessage = false;
  AnswerResultMessageType answerResultMessageType = .success;
  String errorMessage = '';
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
class AnswerResult extends _$AnswerResult {
  @override
  AnswerResultState build() {
    return AnswerResultState();
  }

  void showAnswerResultForCorrect() {
    state = AnswerResultState()
      ..isShowMessage = true
      ..answerResultMessageType = .success;
  }

  void showAnswerResultForWrong(String msg) {
    state = AnswerResultState()
      ..isShowMessage = true
      ..errorMessage = msg
      ..answerResultMessageType = .wrong;
  }

  void hideAnswerResultMessage() {
    state = AnswerResultState()
      ..isShowMessage = false
      ..answerResultMessageType = state.answerResultMessageType;
  }
}

@riverpod
class GameQuestion extends _$GameQuestion {
  late QuestionService service;
  bool isShowMessage = false;
  AnswerResultMessageType answerResultMessageType = .success;

  @override
  Future<List<GameQuestionModel>> build(int gameLevelId) async {
    service = GetIt.instance<QuestionService>();
    return service.fetchQuestionsByGameLevelId(gameLevelId);
  }
}
