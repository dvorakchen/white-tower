import 'package:white_tower_mobile/net/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_service.g.dart';

enum GameQuestionType { singleChoice, fillInBlank }

@JsonSerializable()
class GameQuestionModel {
  final int id;

  /// 游戏关卡ID
  final int tableLevelId;

  /// 科目ID
  final int subjectId;
  final GameQuestionType type;

  /// 问题
  final String question;

  /// 答案选项
  final List<String> options;

  /// 正确答案
  final List<String> answers;

  GameQuestionModel({
    required this.question,
    required this.options,
    required this.answers,
    required this.id,
    required this.tableLevelId,
    required this.subjectId,
    required this.type,
  });

  factory GameQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$GameQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameQuestionModelToJson(this);
}

abstract interface class QuestionService {
  Future<List<GameQuestionModel>> fetchQuestionsByGameLevelId(int gameLevelId);
}

class MedicineQuestionService implements QuestionService {
  final Http _http;
  MedicineQuestionService(this._http);

  @override
  Future<List<GameQuestionModel>> fetchQuestionsByGameLevelId(
    int gameLevelId,
  ) async {
    await Future.delayed(Duration(seconds: 1));

    final List<GameQuestionModel> mockQuestions = [
      GameQuestionModel(
        id: 1,
        tableLevelId: gameLevelId,
        subjectId: 101,
        type: GameQuestionType.singleChoice,
        question: '人体的“生命中枢”位于哪个部位？',
        options: ['大脑皮层', '小脑', '脑干', '脊髓'],
        answers: ['脑干'], // <--- 改为 List<String>
      ),
      GameQuestionModel(
        id: 2,
        tableLevelId: gameLevelId,
        subjectId: 101,
        type: GameQuestionType.singleChoice,
        question: '血液中负责运输氧气的细胞是？',
        options: ['白细胞', '红细胞', '血小板', '淋巴细胞'],
        answers: ['红细胞'],
      ),
      GameQuestionModel(
        id: 3,
        tableLevelId: gameLevelId,
        subjectId: 102,
        type: GameQuestionType.singleChoice,
        question: '以下哪种维生素缺乏可能导致夜盲症？',
        options: ['维生素B1', '维生素C', '维生素D', '维生素A'],
        answers: ['维生素A'],
      ),
      GameQuestionModel(
        id: 4,
        tableLevelId: gameLevelId,
        subjectId: 102,
        type: GameQuestionType.singleChoice,
        question: '青霉素的主要作用机制是？',
        options: ['抑制蛋白质合成', '破坏细胞膜', '抑制细胞壁合成', '干扰核酸复制'],
        answers: ['抑制细胞壁合成'],
      ),
      GameQuestionModel(
        id: 5,
        tableLevelId: gameLevelId,
        subjectId: 103,
        type: GameQuestionType.fillInBlank,
        question: '正常成年人的心率范围（次/分）是：',
        options: [],
        // 对于填空题，包含多个可能的正确答案
        answers: ['60-100', '60 到 100', '60 至 100'], // <--- 支持多个答案
      ),
      GameQuestionModel(
        id: 6,
        tableLevelId: gameLevelId,
        subjectId: 103,
        type: GameQuestionType.singleChoice,
        question: '高血压的诊断标准收缩压（mmHg）一般大于等于：',
        options: ['120', '130', '140', '150'],
        answers: ['140'],
      ),
      GameQuestionModel(
        id: 7,
        tableLevelId: gameLevelId,
        subjectId: 101,
        type: GameQuestionType.singleChoice,
        question: '人体最大的内分泌腺是？',
        options: ['垂体', '肾上腺', '甲状腺', '胰腺'],
        answers: ['甲状腺'],
      ),
      GameQuestionModel(
        id: 8,
        tableLevelId: gameLevelId,
        subjectId: 102,
        type: GameQuestionType.singleChoice,
        question: '阿司匹林的常见不良反应是？',
        options: ['皮疹', '肝功能异常', '胃肠道反应', '关节疼痛'],
        // 假设 '胃部不适' 或 '胃肠道刺激' 也算正确
        answers: ['胃肠道反应', '胃部不适', '胃肠道刺激'], // <--- 支持多个答案
      ),
      GameQuestionModel(
        id: 9,
        tableLevelId: gameLevelId,
        subjectId: 103,
        type: GameQuestionType.fillInBlank,
        question: '以下是常见的抗生素分类之一：',
        options: [],
        // 假设 '头孢类', '青霉素类' 或 '大环内酯类' 都可能作为例子被接受
        answers: ['头孢类', '青霉素类', '大环内酯类'], // <--- 支持多个答案
      ),
      GameQuestionModel(
        id: 10,
        tableLevelId: gameLevelId,
        subjectId: 101,
        type: GameQuestionType.singleChoice,
        question: '尿液生成的主要器官是？',
        options: ['膀胱', '肾脏', '输尿管', '肝脏'],
        answers: ['肾脏'],
      ),
    ];

    // 实际项目中，这里会是网络请求并解析 JSON 的逻辑，例如：
    // final response = await _http.get('/api/questions?levelId=$gameLevelId');
    // return (response.data as List).map((json) => GameQuestionModel.fromJson(json)).toList();

    // 返回假数据
    return mockQuestions;
  }
}
