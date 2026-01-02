import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/models/pagination.dart';
import 'package:white_tower_mobile/pages/table_of_subject_screen.dart';
import 'package:white_tower_mobile/routes.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';
import 'package:white_tower_mobile/widgets/show_loading.dart';
import 'package:white_tower_mobile/widgets/subject_card.dart';

part 'subject_list_screen.g.dart';

class SubjectListScreen extends HookConsumerWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.read(appThemeProvider);

    return ExitGuard(
      child: Container(
        color: appTheme.base100,
        child: SafeArea(
          child: Column(
            spacing: 10,
            children: [
              _Bar(),
              Expanded(child: _List()),
            ],
          ),
        ),
      ),
    );
  }
}

class _List extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_subjectListProvider);
    final notify = ref.read(_subjectListProvider.notifier);

    useEffect(() {
      Future.microtask(notify.initial);
      return null;
    }, []);

    return Container(
      padding: .symmetric(horizontal: 20),
      child: state.isLoading
          ? const ShowLoading()
          : ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final subject = state.list[index];
                return ListItem(subject: subject);
              },
            ),
    );
  }
}

class ListItem extends ConsumerWidget {
  final Subject subject;

  const ListItem({super.key, required this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);

    return Padding(
      padding: .symmetric(vertical: 10),
      child: OpenContainer(
        closedColor: cs.base100,
        openColor: cs.base100,
        middleColor: cs.base200,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        transitionType: .fadeThrough,
        closedBuilder: (context, action) => Padding(
          padding: .all(30),
          child: SubjectCard(subject: subject),
        ),
        openBuilder: (context, action) =>
            TableOfSubjectScreen(subject: subject),
      ),
    );
  }
}

class _Bar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(appThemeProvider);

    return Container(
      color: theme.base100,
      child: const Center(
        child: Text('白塔', style: TextStyle(fontSize: 24, fontWeight: .w500)),
      ),
    );
  }
}

@riverpod
class _SubjectList extends _$SubjectList {
  @override
  Pagination<Subject> build() {
    return Pagination.empty();
  }

  Future<void> initial() async {
    state = state.copyWith(isLoading: true);

    final subjectService = GetIt.instance<SubjectService>();
    var list = await subjectService.fetchSubjects();

    final hasMore = list.length >= state.size;

    state = state.copyWith(
      list: list,
      currentPage: 1,
      hasMore: hasMore,
      isLoading: false,
    );
  }
}
