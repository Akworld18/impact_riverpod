// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSessionRequestHash() => r'ea0d8ab0e443b992e9b087c1fa131ae2012c616c';

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

/// See also [getSessionRequest].
@ProviderFor(getSessionRequest)
const getSessionRequestProvider = GetSessionRequestFamily();

/// See also [getSessionRequest].
class GetSessionRequestFamily
    extends Family<AsyncValue<MentorSessionResponse>> {
  /// See also [getSessionRequest].
  const GetSessionRequestFamily();

  /// See also [getSessionRequest].
  GetSessionRequestProvider call(
    String mentorId,
  ) {
    return GetSessionRequestProvider(
      mentorId,
    );
  }

  @override
  GetSessionRequestProvider getProviderOverride(
    covariant GetSessionRequestProvider provider,
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
  String? get name => r'getSessionRequestProvider';
}

/// See also [getSessionRequest].
class GetSessionRequestProvider
    extends AutoDisposeFutureProvider<MentorSessionResponse> {
  /// See also [getSessionRequest].
  GetSessionRequestProvider(
    String mentorId,
  ) : this._internal(
          (ref) => getSessionRequest(
            ref as GetSessionRequestRef,
            mentorId,
          ),
          from: getSessionRequestProvider,
          name: r'getSessionRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSessionRequestHash,
          dependencies: GetSessionRequestFamily._dependencies,
          allTransitiveDependencies:
              GetSessionRequestFamily._allTransitiveDependencies,
          mentorId: mentorId,
        );

  GetSessionRequestProvider._internal(
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
    FutureOr<MentorSessionResponse> Function(GetSessionRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSessionRequestProvider._internal(
        (ref) => create(ref as GetSessionRequestRef),
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
  AutoDisposeFutureProviderElement<MentorSessionResponse> createElement() {
    return _GetSessionRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSessionRequestProvider && other.mentorId == mentorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mentorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSessionRequestRef
    on AutoDisposeFutureProviderRef<MentorSessionResponse> {
  /// The parameter `mentorId` of this provider.
  String get mentorId;
}

class _GetSessionRequestProviderElement
    extends AutoDisposeFutureProviderElement<MentorSessionResponse>
    with GetSessionRequestRef {
  _GetSessionRequestProviderElement(super.provider);

  @override
  String get mentorId => (origin as GetSessionRequestProvider).mentorId;
}

String _$getBookingDetailsHash() => r'b9440fb921e9d2d83a85650b3c63535a04f40162';

/// See also [getBookingDetails].
@ProviderFor(getBookingDetails)
const getBookingDetailsProvider = GetBookingDetailsFamily();

/// See also [getBookingDetails].
class GetBookingDetailsFamily
    extends Family<AsyncValue<BookingDetailsResponse>> {
  /// See also [getBookingDetails].
  const GetBookingDetailsFamily();

  /// See also [getBookingDetails].
  GetBookingDetailsProvider call(
    String bookingStatus,
  ) {
    return GetBookingDetailsProvider(
      bookingStatus,
    );
  }

  @override
  GetBookingDetailsProvider getProviderOverride(
    covariant GetBookingDetailsProvider provider,
  ) {
    return call(
      provider.bookingStatus,
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
  String? get name => r'getBookingDetailsProvider';
}

/// See also [getBookingDetails].
class GetBookingDetailsProvider
    extends AutoDisposeFutureProvider<BookingDetailsResponse> {
  /// See also [getBookingDetails].
  GetBookingDetailsProvider(
    String bookingStatus,
  ) : this._internal(
          (ref) => getBookingDetails(
            ref as GetBookingDetailsRef,
            bookingStatus,
          ),
          from: getBookingDetailsProvider,
          name: r'getBookingDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBookingDetailsHash,
          dependencies: GetBookingDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetBookingDetailsFamily._allTransitiveDependencies,
          bookingStatus: bookingStatus,
        );

  GetBookingDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookingStatus,
  }) : super.internal();

  final String bookingStatus;

  @override
  Override overrideWith(
    FutureOr<BookingDetailsResponse> Function(GetBookingDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBookingDetailsProvider._internal(
        (ref) => create(ref as GetBookingDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookingStatus: bookingStatus,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BookingDetailsResponse> createElement() {
    return _GetBookingDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBookingDetailsProvider &&
        other.bookingStatus == bookingStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookingStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetBookingDetailsRef
    on AutoDisposeFutureProviderRef<BookingDetailsResponse> {
  /// The parameter `bookingStatus` of this provider.
  String get bookingStatus;
}

class _GetBookingDetailsProviderElement
    extends AutoDisposeFutureProviderElement<BookingDetailsResponse>
    with GetBookingDetailsRef {
  _GetBookingDetailsProviderElement(super.provider);

  @override
  String get bookingStatus =>
      (origin as GetBookingDetailsProvider).bookingStatus;
}

String _$saveBookingDetailsHash() =>
    r'f28a221c51a7d50fba86153d95cd8a310274c091';

/// See also [saveBookingDetails].
@ProviderFor(saveBookingDetails)
const saveBookingDetailsProvider = SaveBookingDetailsFamily();

/// See also [saveBookingDetails].
class SaveBookingDetailsFamily
    extends Family<AsyncValue<BookingSavedResponse>> {
  /// See also [saveBookingDetails].
  const SaveBookingDetailsFamily();

  /// See also [saveBookingDetails].
  SaveBookingDetailsProvider call(
    SaveBookingModel bodyModel,
  ) {
    return SaveBookingDetailsProvider(
      bodyModel,
    );
  }

  @override
  SaveBookingDetailsProvider getProviderOverride(
    covariant SaveBookingDetailsProvider provider,
  ) {
    return call(
      provider.bodyModel,
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
  String? get name => r'saveBookingDetailsProvider';
}

/// See also [saveBookingDetails].
class SaveBookingDetailsProvider
    extends AutoDisposeFutureProvider<BookingSavedResponse> {
  /// See also [saveBookingDetails].
  SaveBookingDetailsProvider(
    SaveBookingModel bodyModel,
  ) : this._internal(
          (ref) => saveBookingDetails(
            ref as SaveBookingDetailsRef,
            bodyModel,
          ),
          from: saveBookingDetailsProvider,
          name: r'saveBookingDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveBookingDetailsHash,
          dependencies: SaveBookingDetailsFamily._dependencies,
          allTransitiveDependencies:
              SaveBookingDetailsFamily._allTransitiveDependencies,
          bodyModel: bodyModel,
        );

  SaveBookingDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bodyModel,
  }) : super.internal();

  final SaveBookingModel bodyModel;

  @override
  Override overrideWith(
    FutureOr<BookingSavedResponse> Function(SaveBookingDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveBookingDetailsProvider._internal(
        (ref) => create(ref as SaveBookingDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bodyModel: bodyModel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BookingSavedResponse> createElement() {
    return _SaveBookingDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveBookingDetailsProvider && other.bodyModel == bodyModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bodyModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveBookingDetailsRef
    on AutoDisposeFutureProviderRef<BookingSavedResponse> {
  /// The parameter `bodyModel` of this provider.
  SaveBookingModel get bodyModel;
}

class _SaveBookingDetailsProviderElement
    extends AutoDisposeFutureProviderElement<BookingSavedResponse>
    with SaveBookingDetailsRef {
  _SaveBookingDetailsProviderElement(super.provider);

  @override
  SaveBookingModel get bodyModel =>
      (origin as SaveBookingDetailsProvider).bodyModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
