// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllMentorsHash() => r'c39ad6b6b08be4cf1fd262457202c6a18c469a69';

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

/// See also [getAllMentors].
@ProviderFor(getAllMentors)
const getAllMentorsProvider = GetAllMentorsFamily();

/// See also [getAllMentors].
class GetAllMentorsFamily extends Family<AsyncValue<MentorAllModel>> {
  /// See also [getAllMentors].
  const GetAllMentorsFamily();

  /// See also [getAllMentors].
  GetAllMentorsProvider call(
    String searchValue,
  ) {
    return GetAllMentorsProvider(
      searchValue,
    );
  }

  @override
  GetAllMentorsProvider getProviderOverride(
    covariant GetAllMentorsProvider provider,
  ) {
    return call(
      provider.searchValue,
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
  String? get name => r'getAllMentorsProvider';
}

/// See also [getAllMentors].
class GetAllMentorsProvider extends AutoDisposeFutureProvider<MentorAllModel> {
  /// See also [getAllMentors].
  GetAllMentorsProvider(
    String searchValue,
  ) : this._internal(
          (ref) => getAllMentors(
            ref as GetAllMentorsRef,
            searchValue,
          ),
          from: getAllMentorsProvider,
          name: r'getAllMentorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllMentorsHash,
          dependencies: GetAllMentorsFamily._dependencies,
          allTransitiveDependencies:
              GetAllMentorsFamily._allTransitiveDependencies,
          searchValue: searchValue,
        );

  GetAllMentorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchValue,
  }) : super.internal();

  final String searchValue;

  @override
  Override overrideWith(
    FutureOr<MentorAllModel> Function(GetAllMentorsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllMentorsProvider._internal(
        (ref) => create(ref as GetAllMentorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchValue: searchValue,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MentorAllModel> createElement() {
    return _GetAllMentorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllMentorsProvider && other.searchValue == searchValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllMentorsRef on AutoDisposeFutureProviderRef<MentorAllModel> {
  /// The parameter `searchValue` of this provider.
  String get searchValue;
}

class _GetAllMentorsProviderElement
    extends AutoDisposeFutureProviderElement<MentorAllModel>
    with GetAllMentorsRef {
  _GetAllMentorsProviderElement(super.provider);

  @override
  String get searchValue => (origin as GetAllMentorsProvider).searchValue;
}

String _$getMentorSessionsHash() => r'6d1cdb50fa16c2b9ffc37725107e6412691cf4c9';

/// See also [getMentorSessions].
@ProviderFor(getMentorSessions)
const getMentorSessionsProvider = GetMentorSessionsFamily();

/// See also [getMentorSessions].
class GetMentorSessionsFamily
    extends Family<AsyncValue<GetMentorSessionDataModel>> {
  /// See also [getMentorSessions].
  const GetMentorSessionsFamily();

  /// See also [getMentorSessions].
  GetMentorSessionsProvider call(
    String mentorId,
  ) {
    return GetMentorSessionsProvider(
      mentorId,
    );
  }

  @override
  GetMentorSessionsProvider getProviderOverride(
    covariant GetMentorSessionsProvider provider,
  ) {
    return call(
      provider.mentorId,
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
  String? get name => r'getMentorSessionsProvider';
}

/// See also [getMentorSessions].
class GetMentorSessionsProvider
    extends AutoDisposeFutureProvider<GetMentorSessionDataModel> {
  /// See also [getMentorSessions].
  GetMentorSessionsProvider(
    String mentorId,
  ) : this._internal(
          (ref) => getMentorSessions(
            ref as GetMentorSessionsRef,
            mentorId,
          ),
          from: getMentorSessionsProvider,
          name: r'getMentorSessionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMentorSessionsHash,
          dependencies: GetMentorSessionsFamily._dependencies,
          allTransitiveDependencies:
              GetMentorSessionsFamily._allTransitiveDependencies,
          mentorId: mentorId,
        );

  GetMentorSessionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mentorId,
  }) : super.internal();

  final String mentorId;

  @override
  Override overrideWith(
    FutureOr<GetMentorSessionDataModel> Function(GetMentorSessionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMentorSessionsProvider._internal(
        (ref) => create(ref as GetMentorSessionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mentorId: mentorId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GetMentorSessionDataModel> createElement() {
    return _GetMentorSessionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMentorSessionsProvider && other.mentorId == mentorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mentorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMentorSessionsRef
    on AutoDisposeFutureProviderRef<GetMentorSessionDataModel> {
  /// The parameter `mentorId` of this provider.
  String get mentorId;
}

class _GetMentorSessionsProviderElement
    extends AutoDisposeFutureProviderElement<GetMentorSessionDataModel>
    with GetMentorSessionsRef {
  _GetMentorSessionsProviderElement(super.provider);

  @override
  String get mentorId => (origin as GetMentorSessionsProvider).mentorId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
