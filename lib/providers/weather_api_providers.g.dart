// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentWeatherDataHash() =>
    r'cd0e146d9af710c3dd842b6b782d0f2fdbb271e7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CurrentWeatherData
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, dynamic>> {
  late final double latitude;
  late final double longitude;

  FutureOr<Map<String, dynamic>> build(
    double latitude,
    double longitude,
  );
}

/// See also [CurrentWeatherData].
@ProviderFor(CurrentWeatherData)
const currentWeatherDataProvider = CurrentWeatherDataFamily();

/// See also [CurrentWeatherData].
class CurrentWeatherDataFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [CurrentWeatherData].
  const CurrentWeatherDataFamily();

  /// See also [CurrentWeatherData].
  CurrentWeatherDataProvider call(
    double latitude,
    double longitude,
  ) {
    return CurrentWeatherDataProvider(
      latitude,
      longitude,
    );
  }

  @override
  CurrentWeatherDataProvider getProviderOverride(
    covariant CurrentWeatherDataProvider provider,
  ) {
    return call(
      provider.latitude,
      provider.longitude,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentWeatherDataProvider';
}

/// See also [CurrentWeatherData].
class CurrentWeatherDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CurrentWeatherData, Map<String, dynamic>> {
  /// See also [CurrentWeatherData].
  CurrentWeatherDataProvider(
    double latitude,
    double longitude,
  ) : this._internal(
          () => CurrentWeatherData()
            ..latitude = latitude
            ..longitude = longitude,
          from: currentWeatherDataProvider,
          name: r'currentWeatherDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentWeatherDataHash,
          dependencies: CurrentWeatherDataFamily._dependencies,
          allTransitiveDependencies:
              CurrentWeatherDataFamily._allTransitiveDependencies,
          latitude: latitude,
          longitude: longitude,
        );

  CurrentWeatherDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latitude,
    required this.longitude,
  }) : super.internal();

  final double latitude;
  final double longitude;

  @override
  FutureOr<Map<String, dynamic>> runNotifierBuild(
    covariant CurrentWeatherData notifier,
  ) {
    return notifier.build(
      latitude,
      longitude,
    );
  }

  @override
  Override overrideWith(CurrentWeatherData Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentWeatherDataProvider._internal(
        () => create()
          ..latitude = latitude
          ..longitude = longitude,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CurrentWeatherData,
      Map<String, dynamic>> createElement() {
    return _CurrentWeatherDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentWeatherDataProvider &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latitude.hashCode);
    hash = _SystemHash.combine(hash, longitude.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentWeatherDataRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `latitude` of this provider.
  double get latitude;

  /// The parameter `longitude` of this provider.
  double get longitude;
}

class _CurrentWeatherDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CurrentWeatherData,
        Map<String, dynamic>> with CurrentWeatherDataRef {
  _CurrentWeatherDataProviderElement(super.provider);

  @override
  double get latitude => (origin as CurrentWeatherDataProvider).latitude;
  @override
  double get longitude => (origin as CurrentWeatherDataProvider).longitude;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
