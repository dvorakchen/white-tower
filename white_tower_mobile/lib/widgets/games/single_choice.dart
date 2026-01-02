import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/services/question_service.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';

part 'single_choice.g.dart';
part 'single_choice.freezed.dart';

/// (selected value, is correct)
typedef OnSelectCb = void Function(String, bool);

class SingleChoice extends HookConsumerWidget {
  final GameQuestionModel model;
  final OnSelectCb? onSelect;

  const SingleChoice({super.key, required this.model, this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() {
        ref
            .read(_singleChoiceProvider.notifier)
            .initialize(model: model, onSelect: onSelect);
      });
      return null;
    }, const []);

    return Padding(
      padding: .symmetric(horizontal: 20),
      child: Column(
        spacing: 10,
        children: [
          _QuestionBubble(title: model.question),
          _Character(),
          SizedBox(height: 50),
          Expanded(child: AnswerList()),
        ],
      ),
    );
  }
}

class _QuestionBubble extends ConsumerWidget {
  final String title;

  const _QuestionBubble({required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          // 尖角在下方的气泡
          painter: _BubblePainter(
            bubbleColor: cs.primary,
            isBottomPointer: true, // 新增参数：表示尖角是否在下方
            isRightAligned: false, // 在下方时，这个参数可能用于控制尖角的水平位置（左/中/右）
          ),
          child: Container(
            // 增大最大宽度
            constraints: const BoxConstraints(maxWidth: 350),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            // 修改 margin：尖角在下方，所以需要为下方留出空间，同时左侧不需要为尖角留出空间
            margin: const EdgeInsets.only(
              right: 0,
              left: 0,
              bottom: 10.0, // 为尖角向下延伸留出空间
            ),
            child: Text(
              title,
              style: TextStyle(color: cs.primaryContent, fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}

//

/// 聊天气泡绘制器，支持尖角在下方，并添加了边框和简单的阴影来模拟立体感。
class _BubblePainter extends CustomPainter {
  final Color bubbleColor;
  final bool isBottomPointer; // 尖角在下方
  final bool isRightAligned; // 仅当尖角在侧面时生效，或用于控制下方尖角的水平位置

  _BubblePainter({
    required this.bubbleColor,
    this.isBottomPointer = false,
    this.isRightAligned = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double radius = 12.0;
    const double triangleHeight = 10.0;
    const double triangleWidth = 30.0;
    const double pointerXOffset = 30.0; // 尖角相对于气泡左侧的水平偏移量

    // 1. 定义气泡主体矩形
    double top = 0;
    double bottom = size.height;
    double left = 0;
    double right = size.width;

    if (isBottomPointer) {
      // 尖角在下方时，气泡主体高度需要减去尖角高度
      bottom = size.height - triangleHeight;
    } else {
      // 尖角在左/右侧时，气泡主体宽度需要减去尖角宽度
      if (isRightAligned) {
        right = size.width - triangleWidth;
      } else {
        left = triangleWidth;
      }
    }

    final RRect bubbleBody = RRect.fromLTRBAndCorners(
      left,
      top,
      right,
      bottom,
      topLeft: const Radius.circular(radius),
      topRight: const Radius.circular(radius),
      bottomLeft: const Radius.circular(radius),
      bottomRight: const Radius.circular(radius),
    );

    // 2. 定义尖角路径
    final Path trianglePath = Path();

    if (isBottomPointer) {
      // 尖角在下方
      final double pointerTipY = size.height;
      final double pointerBaseY = bottom;

      // 控制尖角在下方的位置：
      final double pointerBaseX1 = pointerXOffset;
      final double pointerBaseX2 = pointerXOffset + triangleWidth;
      final double pointerTipX = pointerXOffset + triangleWidth / 2;

      trianglePath.moveTo(pointerBaseX1, pointerBaseY); // 尖角底部的左侧点
      trianglePath.lineTo(pointerTipX, pointerTipY); // 尖角尖端点
      trianglePath.lineTo(pointerBaseX2, pointerBaseY); // 尖角底部的右侧点
      trianglePath.close();
    } else if (isRightAligned) {
      // 尖角在右侧 (侧边情况，保留作为备份)
      const double triangleOffset = 20.0;
      trianglePath.moveTo(right, size.height - triangleOffset);
      trianglePath.lineTo(
        size.width,
        size.height - triangleOffset + triangleHeight / 2,
      );
      trianglePath.lineTo(right, size.height - triangleOffset + triangleHeight);
      trianglePath.close();
    } else {
      // 尖角在左侧 (侧边情况，保留作为备份)
      const double triangleOffset = 20.0;
      trianglePath.moveTo(left, size.height - triangleOffset);
      trianglePath.lineTo(0, size.height - triangleOffset + triangleHeight / 2);
      trianglePath.lineTo(left, size.height - triangleOffset + triangleHeight);
      trianglePath.close();
    }

    // 3. 绘制阴影 (模拟立体感)
    final shadowPaint = Paint()
      ..color = Colors.black
          .withAlpha(100) // 灰色阴影
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);

    // 绘制气泡主体阴影
    canvas.drawRRect(bubbleBody.shift(const Offset(1.5, 3.5)), shadowPaint);
    // 绘制尖角阴影
    canvas.drawPath(trianglePath.shift(const Offset(1.5, 3.5)), shadowPaint);

    // 4. 绘制气泡填充
    final fillPaint = Paint()
      ..color = bubbleColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(bubbleBody, fillPaint);
    canvas.drawPath(trianglePath, fillPaint);

    // 5. 绘制灰色边框 (模拟立体边框)
    final borderPaint = Paint()
      ..color = bubbleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // 绘制气泡主体边框
    canvas.drawRRect(bubbleBody, borderPaint);
    // 绘制尖角边框
    canvas.drawPath(trianglePath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _BubblePainter oldDelegate) {
    return oldDelegate.bubbleColor != bubbleColor ||
        oldDelegate.isBottomPointer != isBottomPointer ||
        oldDelegate.isRightAligned != isRightAligned;
  }
}

class _Character extends StatelessWidget {
  const _Character();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .centerLeft,
      child: Padding(
        padding: .only(left: 20),
        child: Image.asset(
          'assets/images/character-cat-in-clothes.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class AnswerList extends HookConsumerWidget {
  const AnswerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(_singleChoiceProvider);
    var notify = ref.read(_singleChoiceProvider.notifier);

    final cs = ref.read(appThemeProvider);

    final selectedAnswer = useState('');

    void onTapAnswer(String value) {
      if (selectedAnswer.value.isNotEmpty) {
        return;
      }

      selectedAnswer.value = value;

      notify.onSelect(value);
    }

    return Container(
      padding: .symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: state.metadata.options.length,
        itemBuilder: (context, index) {
          final item = state.metadata.options[index];

          var bgColor = cs.base100;
          var borderColor = Colors.grey.shade300;

          if (selectedAnswer.value == item && state.metadata.answer == item) {
            bgColor = Color.lerp(cs.success, Colors.white, 0.85)!;
            borderColor = cs.success;
          } else if (selectedAnswer.value == item &&
              state.metadata.answer != item) {
            bgColor = Color.lerp(cs.error, Colors.white, 0.7)!;
            borderColor = cs.error;
          }

          return GestureDetector(
            onTap: () => onTapAnswer(item),
            child: Padding(
              padding: .only(top: 15),
              child: Container(
                padding: .symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: .all(color: borderColor, width: 2),
                  borderRadius: .circular(15),
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(15),
                      offset: const Offset(0, 2),
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Text(
                  item,
                  style: TextStyle(color: cs.baseContent, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

@freezed
abstract class SingleChoiceState with _$SingleChoiceState {
  factory SingleChoiceState({
    @Default(
      GameQuestionModel(
        question: '',
        metadata: {},
        explanation: '',
        id: 0,
        tableLevelId: 0,
        subjectId: 0,
        type: .singleChoice,
      ),
    )
    GameQuestionModel model,
    @Default(MetadataSingleChoice()) MetadataSingleChoice metadata,
    OnSelectCb? onSelect,
  }) = _SingleChoiceState;
}

@riverpod
class _SingleChoice extends _$SingleChoice {
  @override
  SingleChoiceState build() {
    return SingleChoiceState();
  }

  void initialize({required GameQuestionModel model, OnSelectCb? onSelect}) {
    state = state.copyWith(
      model: model,
      metadata: MetadataSingleChoice.fromJson(model.metadata),
      onSelect: onSelect,
    );
  }

  void onSelect(String value) {
    if (state.onSelect != null) {
      state.onSelect!(value, state.metadata.answer == value);
    }
  }
}
