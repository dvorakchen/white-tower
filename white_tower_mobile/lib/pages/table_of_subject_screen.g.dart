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
        $AsyncNotifierProvider<
          TableOfSubjectPagination,
          Pagination<TableLevel>
        > {
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
    r'22a4fe6bb1a03a886652e798bd1a36de4372d1f1';

final class TableOfSubjectPaginationFamily extends $Family
    with
        $ClassFamilyOverride<
          TableOfSubjectPagination,
          AsyncValue<Pagination<TableLevel>>,
          Pagination<TableLevel>,
          FutureOr<Pagination<TableLevel>>,
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
    extends $AsyncNotifier<Pagination<TableLevel>> {
  late final _$args = ref.$arg as int;
  int get subjectId => _$args;

  FutureOr<Pagination<TableLevel>> build(int subjectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<Pagination<TableLevel>>, Pagination<TableLevel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Pagination<TableLevel>>,
                Pagination<TableLevel>
              >,
              AsyncValue<Pagination<TableLevel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
