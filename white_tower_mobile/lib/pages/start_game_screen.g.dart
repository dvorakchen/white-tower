// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_game_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PageCtl)
const pageCtlProvider = PageCtlProvider._();

final class PageCtlProvider extends $NotifierProvider<PageCtl, void> {
  const PageCtlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pageCtlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pageCtlHash();

  @$internal
  @override
  PageCtl create() => PageCtl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$pageCtlHash() => r'd8fc3811f0182c6fcc9ea309d7d1305e927788fc';

abstract class _$PageCtl extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

@ProviderFor(AnswerResult)
const answerResultProvider = AnswerResultProvider._();

final class AnswerResultProvider
    extends $NotifierProvider<AnswerResult, AnswerResultState> {
  const AnswerResultProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'answerResultProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$answerResultHash();

  @$internal
  @override
  AnswerResult create() => AnswerResult();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnswerResultState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnswerResultState>(value),
    );
  }
}

String _$answerResultHash() => r'bcc0a6cbca2bfb0fca837331ec0e0ed097d7c17d';

abstract class _$AnswerResult extends $Notifier<AnswerResultState> {
  AnswerResultState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AnswerResultState, AnswerResultState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AnswerResultState, AnswerResultState>,
              AnswerResultState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(GameQuestion)
const gameQuestionProvider = GameQuestionFamily._();

final class GameQuestionProvider
    extends $AsyncNotifierProvider<GameQuestion, List<GameQuestionModel>> {
  const GameQuestionProvider._({
    required GameQuestionFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gameQuestionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameQuestionHash();

  @override
  String toString() {
    return r'gameQuestionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GameQuestion create() => GameQuestion();

  @override
  bool operator ==(Object other) {
    return other is GameQuestionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameQuestionHash() => r'553fa832680521e0755e883918f5f93df5c3d2ee';

final class GameQuestionFamily extends $Family
    with
        $ClassFamilyOverride<
          GameQuestion,
          AsyncValue<List<GameQuestionModel>>,
          List<GameQuestionModel>,
          FutureOr<List<GameQuestionModel>>,
          int
        > {
  const GameQuestionFamily._()
    : super(
        retry: null,
        name: r'gameQuestionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GameQuestionProvider call(int gameLevelId) =>
      GameQuestionProvider._(argument: gameLevelId, from: this);

  @override
  String toString() => r'gameQuestionProvider';
}

abstract class _$GameQuestion extends $AsyncNotifier<List<GameQuestionModel>> {
  late final _$args = ref.$arg as int;
  int get gameLevelId => _$args;

  FutureOr<List<GameQuestionModel>> build(int gameLevelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<GameQuestionModel>>,
              List<GameQuestionModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<GameQuestionModel>>,
                List<GameQuestionModel>
              >,
              AsyncValue<List<GameQuestionModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
