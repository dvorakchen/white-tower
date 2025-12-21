// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_game_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$gameQuestionHash() => r'd671a25a5a7fb6a8466317cb7917133f412ff0e8';

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
