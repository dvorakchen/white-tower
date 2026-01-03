import 'package:white_tower_mobile/services/question_service.dart';

class GameResultState {
  final List<GameResultItem> list;

  GameResultState({required this.list});
}

class GameResultItem {
  GameQuestionModel gameQuestionModel;
  String answer;
  bool isCorrect = false;

  GameResultItem(this.gameQuestionModel, this.answer, this.isCorrect);
}

/// 答题结果
///
class GameResult {
  int subjectId = 0;
  final List<GameResultItem> list = [];

  void add({
    required GameQuestionModel model,
    required String answer,
    required bool isCorrect,
  }) {
    list.add(GameResultItem(model, answer, isCorrect));
  }

  void clean() {
    list.clear();
  }
}
