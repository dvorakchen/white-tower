// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_choice.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_SingleChoice)
const _singleChoiceProvider = _SingleChoiceProvider._();

final class _SingleChoiceProvider
    extends $NotifierProvider<_SingleChoice, SingleChoiceState> {
  const _SingleChoiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_singleChoiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_singleChoiceHash();

  @$internal
  @override
  _SingleChoice create() => _SingleChoice();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SingleChoiceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SingleChoiceState>(value),
    );
  }
}

String _$_singleChoiceHash() => r'e78457fa79ef8ca84b2fbe2a4fdb74f1100c3850';

abstract class _$SingleChoice extends $Notifier<SingleChoiceState> {
  SingleChoiceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SingleChoiceState, SingleChoiceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SingleChoiceState, SingleChoiceState>,
              SingleChoiceState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
