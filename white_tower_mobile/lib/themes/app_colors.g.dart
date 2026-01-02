// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_colors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppTheme)
const appThemeProvider = AppThemeProvider._();

final class AppThemeProvider extends $NotifierProvider<AppTheme, AppColors> {
  const AppThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appThemeHash();

  @$internal
  @override
  AppTheme create() => AppTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppColors value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppColors>(value),
    );
  }
}

String _$appThemeHash() => r'dd7afc7b37e9a478581e698e0239903499607ed4';

abstract class _$AppTheme extends $Notifier<AppColors> {
  AppColors build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppColors, AppColors>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppColors, AppColors>,
              AppColors,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
