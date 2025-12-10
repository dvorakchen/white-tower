import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:medicourse_mobile/net/http.dart';
import 'package:medicourse_mobile/pages/subject_list_screen.dart';
import 'package:medicourse_mobile/services/subject_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/config/.env");
  final String baseUrl = dotenv.env['BASE_URL']!;

  final getit = GetIt.instance;
  getit.registerSingleton<Http>(DioHttp(baseUrl));
  getit.registerFactory<SubjectService>(() => MedicineSubject(getit<Http>()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: '肺部结构', home: SubjectListScreen());
  }
}

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

class LungDiagramPuzzle extends StatefulWidget {
  const LungDiagramPuzzle({super.key});

  @override
  State<LungDiagramPuzzle> createState() => _LungDiagramPuzzleState();
}

class _LungDiagramPuzzleState extends State<LungDiagramPuzzle> {
  // 肺部结构图的空位数据列表
  final List<DiagramSpot> _spots = [
    DiagramSpot(label: '气管', top: 10, left: 270, isAnswer: true),
    DiagramSpot(label: '右肺上叶支气管', top: 50, left: 5, isAnswer: true),
    DiagramSpot(label: '右肺中叶支气管', top: 90, left: 5, isAnswer: true),
    DiagramSpot(label: '右肺下叶支气管', top: 250, left: 20, isAnswer: true),
    DiagramSpot(label: '右主支气管', top: 210, left: 60, isAnswer: true),
    DiagramSpot(label: '左主支气管', top: 180, left: 100, isAnswer: true),
    DiagramSpot(label: '左肺上叶', top: 90, left: 300, isAnswer: true),
    DiagramSpot(label: '左肺斜裂', top: 115, left: 330, isAnswer: true),
    DiagramSpot(label: '心切迹', top: 140, left: 330, isAnswer: true),
    DiagramSpot(label: '左肺下叶', top: 170, left: 330, isAnswer: true),
    DiagramSpot(label: '膈', top: 260, left: 250, isAnswer: true),
    DiagramSpot(label: '心脏', isAnswer: false),
  ];

  List<DiagramSpot> get _answers =>
      _spots.where((spot) => spot.isAnswer).toList();

  // 待选的名词列表
  List<String> get _options => _spots.map((spot) => spot.label).toList();

  // 记录哪些选项已经被正确使用，防止重复拖拽
  late final Map<String, bool> _optionsUsed = {
    for (var spot in _spots) spot.label: false,
  };

  // --- 2. 核心方法 ---

  // 处理 DragTarget 接收到 Draggable 时的逻辑
  void _handleAccept(String draggedData, DiagramSpot targetSpot) {
    // 1. 检查拖拽的数据是否正确
    if (draggedData == targetSpot.label) {
      // 2. 更新状态
      setState(() {
        // 更新空位：填充正确的名称
        targetSpot.currentLabel = draggedData;
        // 更新选项：标记该名词已被使用
        _optionsUsed[draggedData] = true;
      });
      // 3. 提示成功
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('✅ 成功填充: ${targetSpot.label}')));
    }
  }

  // --- 3. UI 构建方法 ---

  // 构建单个 DragTarget (挖空区域)
  Widget _buildDiagramSpot(DiagramSpot spot) {
    // 定义空位区域的固定尺寸
    const double spotWidth = 120;
    const double spotHeight = 30;

    // 显示已填充的 Widget
    Widget filledWidget = Container(
      width: spotWidth,
      height: spotHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: spot.currentLabel == spot.label
            ? Colors.green[100]
            : Colors.red[100],
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        spot.currentLabel ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );

    // 显示空位区域的 Widget
    Widget emptyWidget = Container(
      width: spotWidth,
      height: spotHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: const Text('拖拽至此', style: TextStyle(color: Colors.grey)),
    );

    return Positioned(
      top: spot.top,
      left: spot.left,
      child: DragTarget<String>(
        // builder: 根据当前状态显示不同的UI
        builder: (context, candidateData, rejectedData) {
          // 如果已被填充，显示填充的 Widget
          if (spot.currentLabel != null) {
            return filledWidget;
          }
          // 否则，显示空位或悬停时的效果
          return candidateData.isNotEmpty
              ? Container(
                  width: spotWidth,
                  height: spotHeight,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '可以放置',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              : emptyWidget;
        },
        // 允许接收任何 String 类型的数据
        onWillAcceptWithDetails: (data) => true,
        // 接收数据时，调用核心处理方法
        onAcceptWithDetails: (data) {
          // 只有当该空位还未被填充时才处理
          if (spot.currentLabel == null) {
            _handleAccept(data.data, spot);
          }
        },
      ),
    );
  }

  // 构建单个 Draggable (名词选项)
  Widget _buildOption(String name) {
    // 如果这个名词已经被正确使用，则不显示 Draggable
    if (_optionsUsed[name] == true) {
      return const SizedBox(width: 100, height: 40); // 占位保持布局
    }

    // Draggable 的通用样式
    Widget content = Container(
      width: 100,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Text(name, style: const TextStyle(fontSize: 14)),
    );

    return Draggable<String>(
      data: name, // 拖拽时携带的数据
      // feedback: 拖拽时的跟随效果
      feedback: Material(
        elevation: 4.0,
        child: Container(
          width: 100,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            name,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
      // childWhenDragging: 拖拽时原位置的显示
      childWhenDragging: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      // child: 选项在原位置时的显示
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('肺部结构拖拽游戏'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          // 4. 图片和拖拽目标区域 (使用 Expanded 占据大部分空间)
          Expanded(
            flex: 3,
            child:
                // 底层：放置图片
                Center(
                  // ⚠️ 注意：你需要将你的图片文件放在 assets 文件夹中，并在 pubspec.yaml 中声明
                  // 为简化，这里假设你使用了一张与原始图尺寸相似的图片
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/lung_diagram.png', // **请替换为你的图片路径**
                        fit: BoxFit.contain,
                      ),
                      ..._answers.map((spot) => _buildDiagramSpot(spot)),
                    ],
                  ),
                ),

            // 叠加层：遍历所有空位，创建 DragTarget

            // 💡 提示：如果需要复杂的引导线，这里应使用 CustomPaint
          ),
          // 分隔线
          const Divider(height: 1, thickness: 1),
          // 5. 拖拽选项区域 (使用 Padding 和 Row 布局)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 16.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: _options.map((name) => _buildOption(name)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => {
                Navigator.of(
                  context,
                ).push(CupertinoPageRoute(builder: (context) => MyApp())),
              },
              child: Text('Next'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
