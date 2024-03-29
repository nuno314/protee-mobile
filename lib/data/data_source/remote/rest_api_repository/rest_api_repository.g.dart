// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestApiRepository implements RestApiRepository {
  _RestApiRepository(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthResponse?> registerByEmail({token = ''}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'firebaseToken': token};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<AuthResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/user/social-register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : AuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CodeResponse?> getInviteCode() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<CodeResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/invite-code',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : CodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BooleanResponse?> joinFamily({required code}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'code': code};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<BooleanResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/join',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : BooleanResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Family?> getFamilyProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>?>(_setStreamType<Family>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : Family.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<UserFamily>?> getFamilyMembers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<UserFamily>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/members',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data
        ?.map((dynamic i) => UserFamily.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<AuthResponse> refreshToken(refreshToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'refreshToken': refreshToken};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AuthResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/user/login-by-refresh-token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserLocation> addLocation({
    required name,
    required description,
    required lat,
    required lng,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'name': name,
      'description': description,
      'lat': lat,
      'long': lng,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserLocation>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'location',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserLocation.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<UserLocation>> getLocation() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<UserLocation>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'location/user',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserLocation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<User?> getUserProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>?>(_setStreamType<User>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'users/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<JoinFamilyRequest>> getJoinFamilyRequests() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<JoinFamilyRequest>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/join-requests',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            JoinFamilyRequest.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<User?> updateProfile({
    name,
    phoneNumber,
    email,
    dob,
    avatar,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'dob': dob,
      'avt': avatar,
    };
    _data.removeWhere((k, v) => v == null);
    final _result =
        await _dio.fetch<Map<String, dynamic>?>(_setStreamType<User>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'users/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<UserLocation>> getLocationNearby({
    required lat,
    required lng,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'lat': lat,
      'long': lng,
    };
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<UserLocation>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'location/get-nearly',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserLocation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<BooleanResponse?> removeMember({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'memberId': id};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<BooleanResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/remove',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : BooleanResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User?> leaveFamily() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>?>(_setStreamType<User>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/leave',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BooleanResponse?> approveJoinRequest({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'requestId': id};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<BooleanResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/approve',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : BooleanResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BooleanResponse?> rejectJoinRequest({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'requestId': id};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<BooleanResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/reject',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : BooleanResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BooleanResponse?> removeLocation({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'locationId': id};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<BooleanResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'location/user-remove',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : BooleanResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MessageResponse?> getMessages({
    required page,
    required take,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'take': take,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<MessageResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'message/messages',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : MessageResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> sendMessage({required message}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'content': message};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'message',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<FamilyStatistic?> getBasicInformation() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<FamilyStatistic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'analytics/family/basic-information',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : FamilyStatistic.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LocationResponse> getLocationHistory({
    required userId,
    from,
    to,
    required page,
    required take,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'userId': userId,
      r'fromDate': from,
      r'toDate': to,
      r'page': page,
      r'take': take,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LocationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'location/user/location-history',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LocationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LatestLocationResponse?> getLastLocation(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<LatestLocationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'location/user/last-location/${userId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null
        ? null
        : LatestLocationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NotificationResponse?> getNotification({
    required page,
    required take,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'take': take,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<NotificationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'notifications',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null
        ? null
        : NotificationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NotificationModel?> readNotification(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<NotificationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'notifications/read/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : NotificationModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BooleanResponse?> readAllNotifications() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<BooleanResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'notifications/mark-all-as-read',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : BooleanResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserFamily?> updateChild({id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {'memberId': id};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<UserFamily>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/update-child',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : UserFamily.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserFamily?> updateParent({id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {'memberId': id};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<UserFamily>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'family/update-parent',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : UserFamily.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
