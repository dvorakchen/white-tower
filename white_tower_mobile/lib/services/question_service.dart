import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:white_tower_mobile/net/http.dart';

part 'question_service.g.dart';
part 'question_service.freezed.dart';

enum GameQuestionType { singleChoice, fillInBlank }

@freezed
abstract class GameQuestionModel with _$GameQuestionModel {
  const factory GameQuestionModel({
    /// 提问的问题
    required String question,
    required Map<String, dynamic> metadata,

    /// 对题目的解释分析
    required String explanation,
    required int id,

    /// 游戏关卡ID
    required int tableLevelId,

    /// 科目ID
    required int subjectId,
    required GameQuestionType type,
  }) = _GameQuestionModel;

  factory GameQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$GameQuestionModelFromJson(json);
}

@freezed
abstract class MetadataSingleChoice with _$MetadataSingleChoice {
  const factory MetadataSingleChoice({
    @Default([]) List<String> options,
    @Default('') String answer,
  }) = _MetadataSingleChoice;

  factory MetadataSingleChoice.fromJson(Map<String, dynamic> json) =>
      _$MetadataSingleChoiceFromJson(json);
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
        question: '人体的"生命中枢"位于哪个部位？',
        metadata: {
          'options': ['大脑皮层', '小脑', '脑干', '脊髓'],
          'answer': '脑干', // ✅ 字符串
        },
        explanation: '脑干是人体的"生命中枢"，负责控制呼吸、心跳等基本生命活动。',
      ),
      GameQuestionModel(
        id: 2,
        tableLevelId: gameLevelId,
        subjectId: 101,
        type: GameQuestionType.singleChoice,
        question: '血液中负责运输氧气的细胞是？',
        metadata: {
          'options': ['白细胞', '红细胞', '血小板', '淋巴细胞'],
          'answer': '红细胞', // ✅
        },
        explanation: '红细胞含有血红蛋白，能够与氧气结合并将其运输到全身各组织。',
      ),
      // GameQuestionModel(
      //   id: 3,
      //   tableLevelId: gameLevelId,
      //   subjectId: 102,
      //   type: GameQuestionType.singleChoice,
      //   question: '以下哪种维生素缺乏可能导致夜盲症？',
      //   metadata: {
      //     'options': ['维生素B1', '维生素C', '维生素D', '维生素A'],
      //     'answer': '维生素A', // ✅
      //   },
      //   explanation: '维生素A参与视紫红质的合成，缺乏时会导致暗适应能力下降，引发夜盲症。',
      // ),
      // GameQuestionModel(
      //   id: 4,
      //   tableLevelId: gameLevelId,
      //   subjectId: 102,
      //   type: GameQuestionType.singleChoice,
      //   question: '青霉素的主要作用机制是？',
      //   metadata: {
      //     'options': ['抑制蛋白质合成', '破坏细胞膜', '抑制细胞壁合成', '干扰核酸复制'],
      //     'answer': '抑制细胞壁合成', // ✅
      //   },
      //   explanation: '青霉素通过抑制细菌细胞壁的合成，导致细菌因渗透压改变而破裂死亡。',
      // ),
      // // ID 5: fillInBlank — 保持原样（无 answer）
      // GameQuestionModel(
      //   id: 5,
      //   tableLevelId: gameLevelId,
      //   subjectId: 103,
      //   type: GameQuestionType.fillInBlank,
      //   question: '正常成年人的心率范围（次/分）是：',
      //   metadata: {},
      //   explanation: '正常成年人在安静状态下的心率为每分钟60-100次，这反映心脏的正常节律和功能。',
      // ),
      // GameQuestionModel(
      //   id: 6,
      //   tableLevelId: gameLevelId,
      //   subjectId: 103,
      //   type: GameQuestionType.singleChoice,
      //   question: '高血压的诊断标准收缩压（mmHg）一般大于等于：',
      //   metadata: {
      //     'options': ['120', '130', '140', '150'],
      //     'answer': '140', // ✅
      //   },
      //   explanation: '根据WHO标准，收缩压≥140mmHg或舒张压≥90mmHg即可诊断为高血压。',
      // ),
      // GameQuestionModel(
      //   id: 7,
      //   tableLevelId: gameLevelId,
      //   subjectId: 101,
      //   type: GameQuestionType.singleChoice,
      //   question: '人体最大的内分泌腺是？',
      //   metadata: {
      //     'options': ['垂体', '肾上腺', '甲状腺', '胰腺'],
      //     'answer': '甲状腺', // ✅
      //   },
      //   explanation: '甲状腺是人体最大的内分泌腺，分泌甲状腺激素，调节新陈代谢和生长发育。',
      // ),
      // GameQuestionModel(
      //   id: 8,
      //   tableLevelId: gameLevelId,
      //   subjectId: 102,
      //   type: GameQuestionType.singleChoice,
      //   question: '阿司匹林的常见不良反应是？',
      //   metadata: {
      //     'options': ['皮疹', '肝功能异常', '胃肠道反应', '关节疼痛'],
      //     'answer': '胃肠道反应', // ✅
      //   },
      //   explanation: '阿司匹林会抑制胃黏膜前列腺素的合成，导致胃酸分泌增多，引发胃肠道刺激和不适。',
      // ),
      // // ID 9: fillInBlank — 保持原样（无 answer）
      // GameQuestionModel(
      //   id: 9,
      //   tableLevelId: gameLevelId,
      //   subjectId: 103,
      //   type: GameQuestionType.fillInBlank,
      //   question: '以下是常见的抗生素分类之一：',
      //   metadata: {},
      //   explanation: '常见的抗生素分类包括头孢类、青霉素类和大环内酯类等，它们通过不同机制抑制或杀灭细菌。',
      // ),
      // GameQuestionModel(
      //   id: 10,
      //   tableLevelId: gameLevelId,
      //   subjectId: 101,
      //   type: GameQuestionType.singleChoice,
      //   question: '尿液生成的主要器官是？',
      //   metadata: {
      //     'options': ['膀胱', '肾脏', '输尿管', '肝脏'],
      //     'answer': '肾脏', // ✅
      //   },
      //   explanation: '肾脏通过肾小球的滤过作用和肾小管的重吸收、分泌作用来生成尿液，排除代谢废物。',
      // ),
    ];

    // 实际项目中，这里会是网络请求并解析 JSON 的逻辑，例如：
    // final response = await _http.get('/api/questions?levelId=$gameLevelId');
    // return (response.data as List).map((json) => GameQuestionModel.fromJson(json)).toList();

    // 返回假数据
    return mockQuestions;
  }
}
