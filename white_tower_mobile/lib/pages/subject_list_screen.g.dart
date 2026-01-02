// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_list_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_SubjectList)
const _subjectListProvider = _SubjectListProvider._();

final class _SubjectListProvider
    extends $NotifierProvider<_SubjectList, Pagination<Subject>> {
  const _SubjectListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_subjectListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_subjectListHash();

  @$internal
  @override
  _SubjectList create() => _SubjectList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Pagination<Subject> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Pagination<Subject>>(value),
    );
  }
}

String _$_subjectListHash() => r'6a74ddad795e264563d66b47f1e8b448387a94ae';

abstract class _$SubjectList extends $Notifier<Pagination<Subject>> {
  Pagination<Subject> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Pagination<Subject>, Pagination<Subject>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Pagination<Subject>, Pagination<Subject>>,
              Pagination<Subject>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
