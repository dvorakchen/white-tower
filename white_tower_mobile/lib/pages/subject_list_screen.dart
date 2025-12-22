// import 'package:animations/animations.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/models/pagination.dart';
import 'package:white_tower_mobile/pages/table_of_subject_screen.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:white_tower_mobile/themes/common.dart';
import 'package:white_tower_mobile/widgets/show_loading.dart';
import 'package:white_tower_mobile/widgets/subject_card.dart';

// 定义强调色
const Color kPrimaryColor = Color(0xFF17A2B8); // 用于图标和强调
const Color kAccentColor = Color(0xFFE0F7FA); // 用于背景或边框

final subjectListProvider = FutureProvider<Pagination<Subject>>((ref) async {
  final subjectService = GetIt.instance<SubjectService>();
  return await subjectService.fetchSubjects();
});

// --- 3. 主页面 Widget (SubjectListScreen) ---
class SubjectListScreen extends HookConsumerWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSubjectList = ref.watch(subjectListProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CommonColor.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '白塔',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black54),
            onPressed: () {
              // 处理搜索逻辑
            },
          ),
        ],
      ),
      backgroundColor: CommonColor.white,
      body: Container(
        padding: .symmetric(horizontal: 20),
        child: asyncSubjectList.when(
          loading: () => const ShowLoading(),
          error: (error, stackTrace) => Text('Error $error'),
          data: (data) => ListView.builder(
            itemCount: data.list.length,
            itemBuilder: (context, index) {
              final subject = data.list[index];
              return ListItem(subject: subject);
            },
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Subject subject;

  const ListItem({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: .symmetric(vertical: 10),
      child: OpenContainer(
        closedColor: cs.surface,
        openColor: cs.surface,
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
