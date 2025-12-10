import 'package:flutter/material.dart';
import 'package:medicourse_mobile/pages/game_level_screen.dart';
import 'package:medicourse_mobile/services/subject_service.dart';
import 'package:circular_page_transition/circular_page_transition.dart';

// --- 1. 状态模型 ---

// 定义一个类来表示图片上的一个“空位”和它的状态
class DiagramSpot {
  final String label; // 正确的名称
  final double top; // Stack中的定位 Top
  final double left; // Stack中的定位 Left
  String? currentLabel; // 当前填充的名称 (如果为空则为null)
  final bool isAnswer;

  DiagramSpot({
    required this.label,
    this.top = 0,
    this.left = 0,
    required this.isAnswer,
    this.currentLabel,
  });
}

class TableOfSubjectScreen extends StatefulWidget {
  final Subject subject;
  const TableOfSubjectScreen({super.key, required this.subject});

  @override
  State<TableOfSubjectScreen> createState() => _TableOfSubjectScreen();
}

class _TableOfSubjectScreen extends State<TableOfSubjectScreen> {
  // 肺部结构图的空位数据列表

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          createCircularRevealTransition(page: GameOfLevelScreen(subject: widget.subject))
        );
      },
      child: Container(
        color: Colors.black38,
        child: Image.asset('assets/images/map.png'),
      ),
    );
  }
}
