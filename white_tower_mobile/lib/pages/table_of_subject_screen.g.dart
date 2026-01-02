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
    extends $AsyncNotifierProvider<TableOfSubjectPagination, List<TableLevel>> {
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
    r'fd52601f49aa76425e715ad9702a541540f67e73';

final class TableOfSubjectPaginationFamily extends $Family
    with
        $ClassFamilyOverride<
          TableOfSubjectPagination,
          AsyncValue<List<TableLevel>>,
          List<TableLevel>,
          FutureOr<List<TableLevel>>,
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
    extends $AsyncNotifier<List<TableLevel>> {
  late final _$args = ref.$arg as int;
  int get subjectId => _$args;

  FutureOr<List<TableLevel>> build(int subjectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<TableLevel>>, List<TableLevel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TableLevel>>, List<TableLevel>>,
              AsyncValue<List<TableLevel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
