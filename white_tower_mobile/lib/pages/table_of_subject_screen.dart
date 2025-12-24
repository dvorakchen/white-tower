import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/models/pagination.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:white_tower_mobile/themes/common.dart';
import 'package:white_tower_mobile/widgets/show_error.dart';
import 'package:white_tower_mobile/widgets/show_loading.dart';
import 'package:white_tower_mobile/widgets/subject_card.dart';

part 'table_of_subject_screen.g.dart';

class TableOfSubjectScreen extends HookConsumerWidget {
  final Subject subject;
  const TableOfSubjectScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tableOfSubjectPaginationProvider(subject.id));
    // final notifier = ref.read(
    //   tableOfSubjectPaginationProvider(subject.id).notifier,
    // );

    return SafeArea(
      child: Column(
        children: [
          TopNav(subject: subject),
          state.when(
            loading: () =>
                const Padding(padding: .only(top: 80), child: ShowLoading()),

            // 2. 加载失败状态
            error: (err, stack) => ShowError(error: err),
            data: (list) {
              if (list.list.isEmpty) {
                return const Center(child: Text('本关卡暂无题目'));
              }
              // 数据加载成功，渲染第一个题目或题目列表
              return GameLevelList(state: list);
            },
          ),
        ],
      ),
    );
  }
}

class TopNav extends StatelessWidget {
  final Subject subject;

  const TopNav({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: .fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(color: cs.surface),
      child: Column(
        spacing: 20,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  'assets/images/book-open.png',
                  semanticLabel: 'Subjects',
                  width: 32,
                  height: 32,
                ),
              ),
            ],
          ),
          Container(
            padding: .all(15),
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: CommonColor.black.withAlpha(35),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SubjectCard(subject: subject),
          ),
        ],
      ),
    );
  }
}

class GameLevelList extends StatelessWidget {
  final Pagination<TableLevel> state;

  const GameLevelList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RepaintBoundary(
        child: Container(
          padding: .symmetric(horizontal: 30),
          child: ListView.builder(
            reverse: true,
            itemCount: state.list.length + (state.isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (state.isLoading && index == state.list.length) {
                return Center(child: Text('Loading'));
              }
              final item = state.list[index];
              return EnabledGameLevelItem(index: index, tableLevel: item);
            },
          ),
        ),
      ),
    );
  }
}

class EnabledGameLevelItem extends HookConsumerWidget {
  final int index;
  final TableLevel tableLevel;
  const EnabledGameLevelItem({
    super.key,
    required this.index,
    required this.tableLevel,
  });

  final double _baseOffset = 100.0;
  final int _maxOffsetSteps = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressing = useState(false);
    final cs = Theme.of(context).colorScheme;
    final int cycleIndex = index % 4;
    final int steps = _maxOffsetSteps - (cycleIndex - _maxOffsetSteps).abs();
    final double leftPadding = steps * _baseOffset;

    // 根据状态动态计算样式
    const double buttonSize = 80.0;
    final double elevation = isPressing.value ? 1.0 : 5.0;
    final Color backgroundColor = isPressing.value
        ? CommonColor.disabled
        : cs.primaryContainer;
    final Color iconColor = isPressing.value ? CommonColor.white : cs.primary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 0, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: leftPadding),
              Column(
                crossAxisAlignment: .start,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTapDown: (_) {
                      isPressing.value = true;
                      context.go(
                        '/subjects/${tableLevel.subjectId}/games/${tableLevel.id}/${tableLevel.title}',
                      );
                    },
                    onTapUp: (_) {
                      isPressing.value = false;
                    },
                    onTapCancel: () {
                      isPressing.value = false;
                    },
                    child: Material(
                      type: .circle, // 设置为圆形
                      color: backgroundColor,
                      elevation: elevation, // 动态阴影
                      shadowColor: cs.shadow,
                      child: Container(
                        width: buttonSize,
                        height: buttonSize,
                        alignment: .center,
                        child: Icon(Icons.star, size: 40.0, color: iconColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: buttonSize,
                    child: Text(
                      tableLevel.title,
                      maxLines: 2, // 限制行数，避免垂直方向上的溢出
                      overflow: .ellipsis, // 水平方向溢出时显示省略号
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

@riverpod
class TableOfSubjectPagination extends _$TableOfSubjectPagination {
  late SubjectService service;

  @override
  Future<Pagination<TableLevel>> build(int subjectId) async {
    service = GetIt.instance<SubjectService>();
    return service.fetchTableOfSubjectBySubjectId(
      subjectId,
      1,
      Pagination.defaultSize,
    );
  }

  // Future<void> fetchList() async {
  //   state.isLoading = true;
  //   state = await service.fetchTableOfSubjectBySubjectId(
  //     subjectId,
  //     1,
  //     Pagination.defaultSize,
  //   );
  //   state.isLoading = false;
  // }

  // Future<void> nextPage() async {
  //   state.isLoading = true;
  //   final res = await service.fetchTableOfSubjectBySubjectId(
  //     subjectId,
  //     state.currentPage + 1,
  //     state.size,
  //   );

  //   state.currentPage = res.currentPage;
  //   state.size = res.size;
  //   state.hasMore = res.hasMore;
  //   state.list.addAll(res.list);
  //   state.isLoading = false;
  // }
}
