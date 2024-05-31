// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloWorldHash() => r'8bbe6cff2b7b1f4e1f7be3d1820da793259f7bfc';

/// See also [helloWorld].
@ProviderFor(helloWorld)
final helloWorldProvider = AutoDisposeProvider<String>.internal(
  helloWorld,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloWorldRef = AutoDisposeProviderRef<String>;
String _$weatherDataHash() => r'1c5db3e95035dadb48e54875fa4f1b1eac5f7240';

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

  FutureOr<Map<String, dynamic>> build(
    double latitude,
    double longitude,
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
  ) {
    return WeatherDataProvider(
      latitude,
      longitude,
    );
  }

  @override
  WeatherDataProvider getProviderOverride(
    covariant WeatherDataProvider provider,
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
  String? get name => r'weatherDataProvider';
}

/// See also [WeatherData].
class WeatherDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WeatherData, Map<String, dynamic>> {
  /// See also [WeatherData].
  WeatherDataProvider(
    double latitude,
    double longitude,
  ) : this._internal(
          () => WeatherData()
            ..latitude = latitude
            ..longitude = longitude,
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
  }) : super.internal();

  final double latitude;
  final double longitude;

  @override
  FutureOr<Map<String, dynamic>> runNotifierBuild(
    covariant WeatherData notifier,
  ) {
    return notifier.build(
      latitude,
      longitude,
    );
  }

  @override
  Override overrideWith(WeatherData Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeatherDataProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WeatherData, Map<String, dynamic>>
      createElement() {
    return _WeatherDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherDataProvider &&
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

mixin WeatherDataRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `latitude` of this provider.
  double get latitude;

  /// The parameter `longitude` of this provider.
  double get longitude;
}

class _WeatherDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WeatherData,
        Map<String, dynamic>> with WeatherDataRef {
  _WeatherDataProviderElement(super.provider);

  @override
  double get latitude => (origin as WeatherDataProvider).latitude;
  @override
  double get longitude => (origin as WeatherDataProvider).longitude;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
