import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/models/pagination.dart';
import 'package:white_tower_mobile/pages/game_level_screen.dart';
import 'package:white_tower_mobile/services/question_service.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:circular_page_transition/circular_page_transition.dart';
import 'package:white_tower_mobile/themes/common.dart';
import 'package:white_tower_mobile/widgets/answering/choice.dart';
import 'package:white_tower_mobile/widgets/subject_card.dart';

part 'table_of_subject_screen.g.dart';

class TableOfSubjectScreen extends HookConsumerWidget {
  final Subject subject;
  const TableOfSubjectScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tableOfSubjectPaginationProvider(subject.id));
    final notifier = ref.read(
      tableOfSubjectPaginationProvider(subject.id).notifier,
    );

    useEffect(() {
      notifier.fetchList();
    }, []);

    return SafeArea(
      child: Column(
        children: [
          TopNav(subject: subject),
          GameLevelList(state: state),
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
                  color: black.withAlpha(35),
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
              if (state.isLoading && index == state.list.length ) {
                return Center(
                  child: Text('Loading')
                );
              }
              final item = state.list[index];
              return Container(padding: .all(30), child: Text(item.title));
            },
          ),
        ),
      ),
    );
  }
}

@riverpod
class TableOfSubjectPagination extends _$TableOfSubjectPagination {
  late SubjectService subjectService;

  @override
  Pagination<TableLevel> build(int subjectId) {
    subjectService = GetIt.instance<SubjectService>();
    return Pagination(
      list: [],
      currentPage: 0,
      isLoading: false,
      hasMore: true,
    );
  }

  Future<void> fetchList() async {
    state.isLoading = true;
    state = await subjectService.fetchTableOfSubjectBySubjectId(
      subjectId,
      1,
      Pagination.defaultSize,
    );
    state.isLoading = false;
  }

  Future<void> nextPage() async {
    state.isLoading = true;
    final res = await subjectService.fetchTableOfSubjectBySubjectId(
      subjectId,
      state.currentPage + 1,
      state.size,
    );

    state.currentPage = res.currentPage;
    state.size = res.size;
    state.hasMore = res.hasMore;
    state.list.addAll(res.list);
    state.isLoading = false;
  }
}
