# White Tower Mobile - AI Coding Agent Instructions

## Project Overview

**White Tower Mobile** is a Flutter medical education quiz application (医学知识学习应用) with an interactive game-based learning system. Users progress through subjects, select game levels (table levels), answer questions, and receive real-time feedback.

**Stack**: Flutter (Dart), GoRouter (navigation), Riverpod (state management), Freezed (serialization), Dio (HTTP)

---

## Architecture & Data Flow

### Three-Layer Service Architecture

1. **HTTP Layer** (`lib/net/http.dart`): Abstract `Http` interface with `DioHttp` implementation
   - Handles all network requests with Dio configuration
   - Custom exceptions: `UnauthorizedException`, `NotFoundException`, `NetworkException`
   - BASE_URL loaded from `assets/config/.env` via `flutter_dotenv`

2. **Service Layer** (`lib/services/`): Domain-specific business logic
   - `QuestionService`: Fetches quiz questions by game level ID (currently returns mock data)
   - `SubjectService`: Manages subject catalog and game level hierarchies
   - `AudioService`: Plays correct/incorrect answer sounds using `audioplayers`
   - Services are registered as singletons/factories in `main.dart` via `GetIt`

3. **Model Layer** (`lib/models/`): Immutable data structures via Freezed
   - `GameResult`: Tracks answered questions and correctness during a game session
   - `GameQuestionModel`: Question data with metadata (single-choice options, fill-in-blank, explanations)
   - `Subject`/`TableLevel`: Subject catalog hierarchy with recursive children

### Navigation Flow

Routes defined in `lib/routes.dart` via GoRouter:
- `/` → `SplashScreen` (no transition)
- `/subjects` → `SubjectListScreen` → `:subject_id/games/:game_level_id/:game_level_title` → `StartGameScreen`
- `/game_result` → `GameResultScreen` (with `GameResult` passed as `state.extra`)

**Transition Pattern**: Slide from right-to-left (200ms) via `_rightToLeft` builder, except splash screen (no animation)

### State Management (Hooks + Riverpod)

- **Providers**: Defined with `@riverpod` annotation (code-generated via `riverpod_generator`)
- **Async Providers**: Fetch data (e.g., `_gameQuestionProvider` for questions)
- **Mutable Providers**: Track UI state (e.g., `_answerResultProvider` for feedback messages)
- **Flutter Hooks**: Used for lifecycle management in `HookWidget`/`HookConsumerWidget`
- **Key Pattern**: `ref.watch()` for reactive rebuilds, `ref.read()` for one-time access

Example from `StartGameScreen`:
```dart
final state = ref.watch(_gameQuestionProvider(tableLevelId));
final cs = ref.read(appThemeProvider);  // One-time color scheme access
```

### Theme System

Color scheme defined in `lib/themes/app_colors.dart` as Freezed immutable class with semantic naming:
- Base: `base100` (background), `base200`, `base300`, `baseContent` (text)
- Status colors: `success`/`successContent`, `error`/`errorContent`, `warning`, `info`
- Preset: `AppColors.light` (light theme only, currently no dark mode)

Access via: `ref.read(appThemeProvider)` → provides `AppColors` instance

---

## Project-Specific Patterns & Conventions

### Code Generation Workflow

**Critical**: Must run code generation BEFORE building or running:
```powershell
dart run build_runner watch    # Watch mode (recommended during development)
dart run build_runner build    # One-time build (CI/production)
```

**Generated Files** (do NOT edit directly):
- `*.g.dart`: JSON serialization (from `@JsonSerializable`, `@riverpod` annotations)
- `*.freezed.dart`: Freezed immutable class implementations
- Part directives required: `part 'filename.g.dart'` and `part 'filename.freezed.dart'`

### Service Registration Pattern

All service dependencies registered in `main.dart` `registerDependencies()`:
```dart
final getit = GetIt.instance;
getit.registerSingleton<Http>(DioHttp(baseUrl));  // Single instance
getit.registerFactory<QuestionService>(() => MedicineQuestionService(getit<Http>()));  // New each time
```

**Accessing services**: `GetIt.instance.get<QuestionService>()`

### UI State Machine Pattern

Game question screens track complex UI state via frozen state classes:
```dart
@freezed
abstract class _SomeState with _$_SomeState {
  const factory _SomeState({
    @Default(false) bool isShowMessage,
    required SomeType type,
  }) = __SomeState;
}
```

Transition via: `ref.read(provider.notifier).updateState(...)`

### Widget Composition

- **Screen-level widgets** (in `lib/pages/`): Handle routing, top-level state management
- **Component widgets** (in `lib/widgets/components/`): Reusable UI elements (Button, ErrorMessage)
- **Domain-specific widgets** (in `lib/widgets/games/`): Game-specific logic (SingleChoice, QuestionList)

**HookConsumerWidget**: For widgets mixing hooks (lifecycle) + Riverpod (state)
```dart
class SingleChoice extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() { ... }, const []);  // Run on mount
    final state = ref.watch(provider);
    ...
  }
}
```

---

## Developer Workflows

### Build & Run

```powershell
# Initial setup
flutter pub get

# Code generation (watch mode - automatically regenerates on file changes)
dart run build_runner watch

# Run app (select device when prompted)
flutter run

# Build release APK
flutter build apk

# Analyze code
flutter analyze
```

### Adding New Features

1. **New Service**: Create interface in `lib/services/`, implement, register in `main.dart`
2. **New Screen**: Create in `lib/pages/`, add route to `lib/routes.dart`, use `HookConsumerWidget`
3. **Data Model**: Use `@freezed` + `@JsonSerializable`, update `.g.dart` parts
4. **API Endpoint**: Add to `QuestionService`/`SubjectService`, call via `Http.get<T>()`
5. **Theme Colors**: Add to `AppColors` class in `lib/themes/app_colors.dart`

### Testing & Debugging

- **Hot Reload**: Preserves app state (rebuilds UI layer)
- **Hot Restart**: Resets app state (full restart, runs `main()` again)
- **Debug Prints**: Use `debugPrint()` for logs visible in Dart DevTools

---

## Key Files Reference

| File | Purpose |
|------|---------|
| `lib/main.dart` | App entry point, service registration, theme setup |
| `lib/routes.dart` | GoRouter configuration, navigation transitions |
| `lib/services/question_service.dart` | Question fetching logic |
| `lib/services/subject_service.dart` | Subject/table level hierarchy management |
| `lib/net/http.dart` | HTTP abstraction layer (Dio wrapper) |
| `lib/models/game.dart` | GameResult tracking state |
| `lib/pages/games/start_game_screen.dart` | Main game loop screen |
| `lib/themes/app_colors.dart` | Centralized color palette |
| `pubspec.yaml` | Dependencies and build config |

---

## Common Gotchas & Patterns

- **Freezed syntax**: Import both `freezed_annotation` and `riverpod_annotation`, use `factory` constructors with `_$ClassName` prefix
- **Riverpod code generation**: Changes to `@riverpod` functions require `build_runner` regeneration
- **Service async initialization**: Some services (AudioPlayer) lazy-initialize on first use; check for null before accessing
- **GoRouter path parameters**: Extract via `state.pathParameters['key']`, pass data via `state.extra`
- **Provider invalidation**: Use `ref.invalidate(provider)` to force-refetch async data
- **ColorScheme access**: Always use `ref.read(appThemeProvider)` from within build context, NOT as global variable

---

## Integration Points

- **Backend API**: Defined by `Http` interface, currently mocked in `QuestionService` with 1-second delay
- **Audio files**: Loaded from `assets/sounds/` (answer_correct.wav, answer_incorrect.wav)
- **Environment**: BASE_URL from `assets/config/.env` (must exist for production)
- **Lints**: Configured in `analysis_options.yaml` (extends `package:flutter_lints/flutter.yaml`)
