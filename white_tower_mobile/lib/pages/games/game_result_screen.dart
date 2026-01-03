import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/models/game.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';
import 'package:white_tower_mobile/widgets/components/button.dart';

class GameResultScreen extends ConsumerWidget {
  final GameResult gameResult;
  const GameResultScreen({super.key, required this.gameResult});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);

    final correctCount = gameResult.list.where((t) => t.isCorrect).length;
    final totalCount = gameResult.list.length;
    final scorePercentage = totalCount > 0
        ? (correctCount / totalCount * 100).toStringAsFixed(1)
        : '0.0';

    return Container(
      color: cs.base100,
      child: SafeArea(
        child: Column(
          children: [
            // Header Bar
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              decoration: BoxDecoration(color: cs.primary),
              child: Center(
                child: Text(
                  '答题结果',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: cs.primaryContent,
                  ),
                ),
              ),
            ),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    // Score Card
                    _ScoreCard(
                      correctCount: correctCount,
                      totalCount: totalCount,
                      scorePercentage: scorePercentage,
                      cs: cs,
                    ),
                    const SizedBox(height: 24),

                    // Stats Grid
                    _StatsGrid(
                      correctCount: correctCount,
                      wrongCount: totalCount - correctCount,
                      cs: cs,
                    ),
                    const SizedBox(height: 24),

                    // Result List
                    if (gameResult.list.isNotEmpty)
                      _ResultList(gameResult: gameResult, cs: cs),

                    const SizedBox(height: 24),

                    // Button
                    Button(
                      onPress: () {
                        context.pop();
                      },
                      label: '返回',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Score Card - 显示总分
class _ScoreCard extends StatelessWidget {
  final int correctCount;
  final int totalCount;
  final String scorePercentage;
  final AppColors cs;

  const _ScoreCard({
    required this.correctCount,
    required this.totalCount,
    required this.scorePercentage,
    required this.cs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [cs.primary, Color.lerp(cs.primary, cs.accent, 0.3)!],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '恭喜完成！',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: cs.primaryContent,
            ),
          ),
          const SizedBox(height: 16),

          // 大分数显示
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                scorePercentage,
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w800,
                  color: cs.primaryContent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: cs.primaryContent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 进度条 (自定义，不使用 Material 组件)
          _ProgressBar(
            progress: totalCount > 0 ? correctCount / totalCount : 0,
            backgroundColor: cs.primaryContent.withValues(alpha: 0.2),
            valueColor: cs.success,
          ),
          const SizedBox(height: 12),

          Text(
            '$correctCount / $totalCount',
            style: TextStyle(
              fontSize: 14,
              color: cs.primaryContent.withValues(alpha: 0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Stats Grid - 统计信息网格
class _StatsGrid extends StatelessWidget {
  final int correctCount;
  final int wrongCount;
  final AppColors cs;

  const _StatsGrid({
    required this.correctCount,
    required this.wrongCount,
    required this.cs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: '答对',
            count: correctCount,
            backgroundColor: cs.success,
            textColor: cs.successContent,
            icon: '✓',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            title: '答错',
            count: wrongCount,
            backgroundColor: cs.error,
            textColor: cs.errorContent,
            icon: '✕',
          ),
        ),
      ],
    );
  }
}

/// Individual Stat Card
class _StatCard extends StatelessWidget {
  final String title;
  final int count;
  final Color backgroundColor;
  final Color textColor;
  final String icon;

  const _StatCard({
    required this.title,
    required this.count,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: 0.1),
        border: Border.all(color: backgroundColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: backgroundColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: backgroundColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: backgroundColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Result List - 答题详情列表
class _ResultList extends StatelessWidget {
  final GameResult gameResult;
  final AppColors cs;

  const _ResultList({required this.gameResult, required this.cs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '答题详情',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: cs.baseContent,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gameResult.list.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final result = gameResult.list[index];
            final isCorrect = result.isCorrect;

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isCorrect
                    ? cs.success.withValues(alpha: 0.05)
                    : cs.error.withValues(alpha: 0.05),
                border: Border(
                  left: BorderSide(
                    color: isCorrect ? cs.success : cs.error,
                    width: 4,
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: isCorrect ? cs.success : cs.error,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            isCorrect ? '✓' : '✕',
                            style: TextStyle(
                              color: isCorrect
                                  ? cs.successContent
                                  : cs.errorContent,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Q${index + 1}: ${result.gameQuestionModel.question}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: cs.baseContent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '你的答案: ${result.answer}',
                          style: TextStyle(
                            fontSize: 12,
                            color: cs.baseContent.withValues(alpha: 0.7),
                          ),
                        ),
                        if (!isCorrect &&
                            result.gameQuestionModel.metadata.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '正确答案: ${result.gameQuestionModel.metadata['answer'] ?? '见解析'}',
                              style: TextStyle(
                                fontSize: 12,
                                color: cs.success,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Custom Progress Bar - 自定义进度条，不依赖 Material
class _ProgressBar extends StatelessWidget {
  final double progress; // 0.0 - 1.0
  final Color backgroundColor;
  final Color valueColor;

  const _ProgressBar({
    required this.progress,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 88) * progress,
            decoration: BoxDecoration(
              color: valueColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
