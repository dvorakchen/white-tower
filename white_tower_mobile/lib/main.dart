import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:white_tower_mobile/net/http.dart';
import 'package:white_tower_mobile/services/audio_service.dart';
import 'package:white_tower_mobile/services/question_service.dart';
import 'package:white_tower_mobile/services/subject_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:white_tower_mobile/routes.dart';
import 'package:flutter/services.dart';

part 'main.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return "Hello World";
}

void main() async {
  await dotenv.load(fileName: "assets/config/.env");

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  registerDependencies();

  const colorSchema = AppColors.light;

  runApp(
    ProviderScope(
      child: WidgetsApp.router(
        routerConfig: router,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontFamily: 'SmileySans',
                  fontSize: 14,
                  color: colorSchema.baseContent,
                ),
                child: child!,
              ),
            ),
          );
        },

        color: colorSchema.primary,
        title: '白塔',
        supportedLocales: const [Locale('zh', 'CN')],
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
