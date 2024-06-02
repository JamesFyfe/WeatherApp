// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentWeatherDataHash() =>
    r'f7866c3764412fb7a33b2a87c265efa07bc17d03';

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

String _$citySearchHash() => r'772ca9d08e34bc533b73607378c864cd4481ad60';

abstract class _$CitySearch
    extends BuildlessAutoDisposeAsyncNotifier<List<dynamic>?> {
  late final String cityName;

  FutureOr<List<dynamic>?> build(
    String cityName,
  );
}

/// See also [CitySearch].
@ProviderFor(CitySearch)
const citySearchProvider = CitySearchFamily();

/// See also [CitySearch].
class CitySearchFamily extends Family<AsyncValue<List<dynamic>?>> {
  /// See also [CitySearch].
  const CitySearchFamily();

  /// See also [CitySearch].
  CitySearchProvider call(
    String cityName,
  ) {
    return CitySearchProvider(
      cityName,
    );
  }

  @override
  CitySearchProvider getProviderOverride(
    covariant CitySearchProvider provider,
  ) {
    return call(
      provider.cityName,
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
  String? get name => r'citySearchProvider';
}

/// See also [CitySearch].
class CitySearchProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CitySearch, List<dynamic>?> {
  /// See also [CitySearch].
  CitySearchProvider(
    String cityName,
  ) : this._internal(
          () => CitySearch()..cityName = cityName,
          from: citySearchProvider,
          name: r'citySearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$citySearchHash,
          dependencies: CitySearchFamily._dependencies,
          allTransitiveDependencies:
              CitySearchFamily._allTransitiveDependencies,
          cityName: cityName,
        );

  CitySearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityName,
  }) : super.internal();

  final String cityName;

  @override
  FutureOr<List<dynamic>?> runNotifierBuild(
    covariant CitySearch notifier,
  ) {
    return notifier.build(
      cityName,
    );
  }

  @override
  Override overrideWith(CitySearch Function() create) {
    return ProviderOverride(
      origin: this,
      override: CitySearchProvider._internal(
        () => create()..cityName = cityName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityName: cityName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CitySearch, List<dynamic>?>
      createElement() {
    return _CitySearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CitySearchProvider && other.cityName == cityName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CitySearchRef on AutoDisposeAsyncNotifierProviderRef<List<dynamic>?> {
  /// The parameter `cityName` of this provider.
  String get cityName;
}

class _CitySearchProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CitySearch, List<dynamic>?>
    with CitySearchRef {
  _CitySearchProviderElement(super.provider);

  @override
  String get cityName => (origin as CitySearchProvider).cityName;
}

String _$searchQueryHash() => r'4a81f4981a852377cacaaef0daea5da3374edbaf';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = AutoDisposeNotifier<String>;
String _$showSearchHash() => r'b6b772761cd183cfc018d140a9e4068f2ceb9a85';

/// See also [ShowSearch].
@ProviderFor(ShowSearch)
final showSearchProvider =
    AutoDisposeNotifierProvider<ShowSearch, bool>.internal(
  ShowSearch.new,
  name: r'showSearchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowSearch = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
