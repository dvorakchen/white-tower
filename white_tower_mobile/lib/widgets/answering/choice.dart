import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/services/question_service.dart';

/// 选择题
///

class ChoiceQuestion extends HookConsumerWidget {
  final ChoiceQuestionModel model;

  const ChoiceQuestion({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: .symmetric(horizontal: 50),
      child: Column(
        children: [
          Wrap(
            children: [
              RichText(
                // 自动换行是 RichText 的默认行为
                text: TextSpan(children: _buildSpans(context, model.question)),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}

List<InlineSpan> _buildSpans(BuildContext context, List<String?> question) {
  List<InlineSpan> spans = [];

  for (final item in question) {
    if (item is String) {
      // 渲染字符串为 TextSpan
      spans.add(
        TextSpan(
          text: item,
          style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    } else if (item == null) {
      // 渲染 null 为 WidgetSpan (下划线)
      spans.add(
        WidgetSpan(
          // 使用 Container 模拟下划线/空格
          child: Container(
            // 关键：设置一个固定的宽度，使其看起来像一个空格
            width: 80,
            height: 20,
            margin: const .symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // 下划线颜色
                  width: 2.0, // 下划线粗细
                ),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              ' ', // 确保 Widget 内部有内容，以在某些情况下正确占位
              style: TextStyle(fontSize: 18),
            ),
          ),
          // 将 Widget 居中或置于基线，以保证下划线与文本底部的对齐
          alignment: PlaceholderAlignment.bottom,
        ),
      );
    }
  }

  return spans;
}
