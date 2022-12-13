// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RoomRepository implements RoomRepository {
  _RoomRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://172.25.96.1:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Room> detailRoom({
    required roomId,
    required userId,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Room>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/detail/${roomId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Room.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Room> findByMyIdRoom({required roomId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Room>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/{userId}/myrooms',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Room.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RoomList> findAllRoom({required userId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<RoomList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RoomList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Room> findJoinRooms({required userId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Room>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/joins',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Room.fromJson(_result.data!);
    return value;
  }

  @override
  Future<KickUserParty> kickUser({
    required userId,
    required roomId,
    required kickUserParty,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(kickUserParty.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<KickUserParty>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/kick/${roomId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KickUserParty.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EndRoomParty> endRoom({
    required userId,
    required roomId,
    required endRoomParty,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(endRoomParty.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<EndRoomParty>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/end/${roomId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EndRoomParty.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ExitRoomParty> exitRoom({
    required userId,
    required roomId,
    required exitRoomParty,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(exitRoomParty.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ExitRoomParty>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/exit/${roomId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExitRoomParty.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GenerateRoomParty> createRoom({
    required userId,
    required roomId,
    required generateRoomParty,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(generateRoomParty.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GenerateRoomParty>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/create/${roomId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenerateRoomParty.fromJson(_result.data!);
    return value;
  }

  @override
  Future<JoinRoomParty> joinRoom({
    required userId,
    required roomId,
    required joinRoomParty,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(joinRoomParty.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<JoinRoomParty>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/party/user/${userId}/join/${roomId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JoinRoomParty.fromJson(_result.data!);
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
