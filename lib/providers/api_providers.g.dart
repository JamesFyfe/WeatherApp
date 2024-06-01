// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherDataHash() => r'7a267ffaecbcf6d7cce89ade45e60d289a328e99';

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

abstract class _$WeatherData
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, dynamic>> {
  late final double latitude;
  late final double longitude;
  late final String apiUrl;

  FutureOr<Map<String, dynamic>> build(
    double latitude,
    double longitude,
    String apiUrl,
  );
}

/// See also [WeatherData].
@ProviderFor(WeatherData)
const weatherDataProvider = WeatherDataFamily();

/// See also [WeatherData].
class WeatherDataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [WeatherData].
  const WeatherDataFamily();

  /// See also [WeatherData].
  WeatherDataProvider call(
    double latitude,
    double longitude,
    String apiUrl,
  ) {
    return WeatherDataProvider(
      latitude,
      longitude,
      apiUrl,
    );
  }

  @override
  WeatherDataProvider getProviderOverride(
    covariant WeatherDataProvider provider,
  ) {
    return call(
      provider.latitude,
      provider.longitude,
      provider.apiUrl,
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
  String? get name => r'weatherDataProvider';
}

/// See also [WeatherData].
class WeatherDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WeatherData, Map<String, dynamic>> {
  /// See also [WeatherData].
  WeatherDataProvider(
    double latitude,
    double longitude,
    String apiUrl,
  ) : this._internal(
          () => WeatherData()
            ..latitude = latitude
            ..longitude = longitude
            ..apiUrl = apiUrl,
          from: weatherDataProvider,
          name: r'weatherDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weatherDataHash,
          dependencies: WeatherDataFamily._dependencies,
          allTransitiveDependencies:
              WeatherDataFamily._allTransitiveDependencies,
          latitude: latitude,
          longitude: longitude,
          apiUrl: apiUrl,
        );

  WeatherDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latitude,
    required this.longitude,
    required this.apiUrl,
  }) : super.internal();

  final double latitude;
  final double longitude;
  final String apiUrl;

  @override
  FutureOr<Map<String, dynamic>> runNotifierBuild(
    covariant WeatherData notifier,
  ) {
    return notifier.build(
      latitude,
      longitude,
      apiUrl,
    );
  }

  @override
  Override overrideWith(WeatherData Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeatherDataProvider._internal(
        () => create()
          ..latitude = latitude
          ..longitude = longitude
          ..apiUrl = apiUrl,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        latitude: latitude,
        longitude: longitude,
        apiUrl: apiUrl,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WeatherData, Map<String, dynamic>>
      createElement() {
    return _WeatherDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherDataProvider &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.apiUrl == apiUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latitude.hashCode);
    hash = _SystemHash.combine(hash, longitude.hashCode);
    hash = _SystemHash.combine(hash, apiUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WeatherDataRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `latitude` of this provider.
  double get latitude;

  /// The parameter `longitude` of this provider.
  double get longitude;

  /// The parameter `apiUrl` of this provider.
  String get apiUrl;
}

class _WeatherDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WeatherData,
        Map<String, dynamic>> with WeatherDataRef {
  _WeatherDataProviderElement(super.provider);

  @override
  double get latitude => (origin as WeatherDataProvider).latitude;
  @override
  double get longitude => (origin as WeatherDataProvider).longitude;
  @override
  String get apiUrl => (origin as WeatherDataProvider).apiUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
