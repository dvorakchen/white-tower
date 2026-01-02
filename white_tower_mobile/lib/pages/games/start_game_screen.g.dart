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

@ProviderFor(_AnswerResult)
const _answerResultProvider = _AnswerResultProvider._();

final class _AnswerResultProvider
    extends $NotifierProvider<_AnswerResult, CurrentAnswerResultState> {
  const _AnswerResultProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_answerResultProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_answerResultHash();

  @$internal
  @override
  _AnswerResult create() => _AnswerResult();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CurrentAnswerResultState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CurrentAnswerResultState>(value),
    );
  }
}

String _$_answerResultHash() => r'b6e8dcd2d035859c874f4e6c82fef2d34e3e2b67';

abstract class _$AnswerResult extends $Notifier<CurrentAnswerResultState> {
  CurrentAnswerResultState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<CurrentAnswerResultState, CurrentAnswerResultState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CurrentAnswerResultState, CurrentAnswerResultState>,
              CurrentAnswerResultState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(_GameQuestion)
const _gameQuestionProvider = _GameQuestionFamily._();

final class _GameQuestionProvider
    extends $AsyncNotifierProvider<_GameQuestion, List<GameQuestionModel>> {
  const _GameQuestionProvider._({
    required _GameQuestionFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'_gameQuestionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_gameQuestionHash();

  @override
  String toString() {
    return r'_gameQuestionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  _GameQuestion create() => _GameQuestion();

  @override
  bool operator ==(Object other) {
    return other is _GameQuestionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_gameQuestionHash() => r'77aeb2cb5de463ea2fc633b2e5b5ffc67946643d';

final class _GameQuestionFamily extends $Family
    with
        $ClassFamilyOverride<
          _GameQuestion,
          AsyncValue<List<GameQuestionModel>>,
          List<GameQuestionModel>,
          FutureOr<List<GameQuestionModel>>,
          int
        > {
  const _GameQuestionFamily._()
    : super(
        retry: null,
        name: r'_gameQuestionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _GameQuestionProvider call(int gameLevelId) =>
      _GameQuestionProvider._(argument: gameLevelId, from: this);

  @override
  String toString() => r'_gameQuestionProvider';
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
