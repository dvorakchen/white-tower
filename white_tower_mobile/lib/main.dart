import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:white_tower_mobile/net/http.dart';
import 'package:white_tower_mobile/pages/subject_list_screen.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/themes/common.dart';
import 'package:white_tower_mobile/themes/primary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return "Hello World";
}

void main() async {
  await dotenv.load(fileName: "assets/config/.env");

  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();

  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: primaryColorScheme,
          textTheme: defaultTextTheme,
        ),
        title: '白塔',
        home: const SubjectListScreen(),
      ),
    ),
  );
}

void registerDependencies() {
  final getit = GetIt.instance;
  final String baseUrl = dotenv.env['BASE_URL']!;
  getit.registerSingleton<Http>(DioHttp(baseUrl));
  getit.registerFactory<SubjectService>(() => MedicineSubject(getit<Http>()));
}

class PodPage extends HookConsumerWidget {
  const PodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);

    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: primaryColorScheme,
        textTheme: defaultTextTheme,
      ),
      title: '肺部结构',
      home: const SubjectListScreen(),
    );
  }
}
