// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_of_subject_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TableOfSubjectPagination)
const tableOfSubjectPaginationProvider = TableOfSubjectPaginationFamily._();

final class TableOfSubjectPaginationProvider
    extends
        $NotifierProvider<TableOfSubjectPagination, Pagination<TableLevel>> {
  const TableOfSubjectPaginationProvider._({
    required TableOfSubjectPaginationFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'tableOfSubjectPaginationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tableOfSubjectPaginationHash();

  @override
  String toString() {
    return r'tableOfSubjectPaginationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TableOfSubjectPagination create() => TableOfSubjectPagination();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Pagination<TableLevel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Pagination<TableLevel>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TableOfSubjectPaginationProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tableOfSubjectPaginationHash() =>
    r'4bfa49718967dc8382a2fc8d8937e60b7471f868';

final class TableOfSubjectPaginationFamily extends $Family
    with
        $ClassFamilyOverride<
          TableOfSubjectPagination,
          Pagination<TableLevel>,
          Pagination<TableLevel>,
          Pagination<TableLevel>,
          int
        > {
  const TableOfSubjectPaginationFamily._()
    : super(
        retry: null,
        name: r'tableOfSubjectPaginationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TableOfSubjectPaginationProvider call(int subjectId) =>
      TableOfSubjectPaginationProvider._(argument: subjectId, from: this);

  @override
  String toString() => r'tableOfSubjectPaginationProvider';
}

abstract class _$TableOfSubjectPagination
    extends $Notifier<Pagination<TableLevel>> {
  late final _$args = ref.$arg as int;
  int get subjectId => _$args;

  Pagination<TableLevel> build(int subjectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<Pagination<TableLevel>, Pagination<TableLevel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Pagination<TableLevel>, Pagination<TableLevel>>,
              Pagination<TableLevel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
