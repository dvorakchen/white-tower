import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:white_tower_mobile/net/http.dart';
import 'package:white_tower_mobile/services/audio_service.dart';
import 'package:white_tower_mobile/services/question_service.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/themes/common.dart';
import 'package:white_tower_mobile/themes/primary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/routes.dart';

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
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'SmileySans',
          colorScheme: primaryColorScheme,
          textTheme: defaultTextTheme,
        ),
        themeMode: ThemeMode.light,
        title: '白塔',
        routerConfig: router,
      ),
    ),
  );
}

void registerDependencies() {
  final getit = GetIt.instance;
  final String baseUrl = dotenv.env['BASE_URL']!;
  getit.registerSingleton<Http>(DioHttp(baseUrl));
  getit.registerFactory<SubjectService>(() => MedicineSubject(getit<Http>()));
  getit.registerFactory<QuestionService>(
    () => MedicineQuestionService(getit<Http>()),
  );
  getit.registerSingleton<AudioService>(CommonAudioService());
}
