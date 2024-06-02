// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedThemeHash() => r'23b17bb580a4aa38f47677680558b0b4703b644a';

/// See also [SelectedTheme].
@ProviderFor(SelectedTheme)
final selectedThemeProvider =
    AutoDisposeNotifierProvider<SelectedTheme, ThemeData>.internal(
  SelectedTheme.new,
  name: r'selectedThemeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedTheme = AutoDisposeNotifier<ThemeData>;
String _$savedLocationsHash() => r'4c10d29abc2d62314c1cb7cbbb6f533677af8ab7';

/// See also [SavedLocations].
@ProviderFor(SavedLocations)
final savedLocationsProvider =
    AutoDisposeNotifierProvider<SavedLocations, List<Coordinates>>.internal(
  SavedLocations.new,
  name: r'savedLocationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedLocationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SavedLocations = AutoDisposeNotifier<List<Coordinates>>;
String _$selectedUnitHash() => r'76772f4440c08e5bfeee6a7f72ee98f21cb28e6a';

/// See also [SelectedUnit].
@ProviderFor(SelectedUnit)
final selectedUnitProvider =
    AutoDisposeNotifierProvider<SelectedUnit, String>.internal(
  SelectedUnit.new,
  name: r'selectedUnitProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedUnitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedUnit = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
