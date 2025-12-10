import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medicourse_mobile/pages/game_level_screen.dart';
import 'package:medicourse_mobile/pages/table_of_subject_screen.dart';
import 'package:medicourse_mobile/services/subject_service.dart';

// 定义强调色
const Color kPrimaryColor = Color(0xFF17A2B8); // 用于图标和强调
const Color kAccentColor = Color(0xFFE0F7FA); // 用于背景或边框

// --- 2. 列表项 Widget (SubjectCard) ---
class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Card(
      // 使用 Card 实现圆角和轻微阴影效果
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2, // 轻微阴影
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        // InkWell 提供点击水波纹效果
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 左侧图标区域
              const SizedBox(width: 16.0),
              // 中间文字区域
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      subject.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subject.subtitle,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // 右侧箭头
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 3. 主页面 Widget (SubjectListScreen) ---
class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectService = GetIt.instance<SubjectService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // 移除 AppBar 阴影
        centerTitle: true,
        title: const Text(
          '白色巨塔',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        // 模拟设计图中的返回和搜索按钮
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            // Navigator.pop(context); // 实际应用中用于返回
          },
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
      backgroundColor: Colors.grey[50], // 轻微的背景色以突出卡片
      body: FutureBuilder(
        future: subjectService.fetchSubjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(padding: EdgeInsets.all(8.0), child: Text('数据加载中...')),
              ],
            );
          }
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 60),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('错误: ${snapshot.error}'),
                ),
              ],
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final subject = snapshot.data![index];
                return OpenContainer(
                  closedBuilder: (context, action) {
                    return SubjectCard(subject: subject);
                  },
                  openBuilder: (context, action) {
                    // return GameOfLevelScreen(subject: subject);
                    return TableOfSubjectScreen(subject: subject);
                  },
                );
              },
            );
          }

          return const Text('Future is null or in unexpected state.');
        },
      ),
    );
  }
}
