// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_room_party_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _JoinRoomPartyRepository implements JoinRoomPartyRepository {
  _JoinRoomPartyRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://localhost:8000';
  }

  final Dio _dio;

  String? baseUrl;

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
              '/party/user/${userId}/join/${roomId}',
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
