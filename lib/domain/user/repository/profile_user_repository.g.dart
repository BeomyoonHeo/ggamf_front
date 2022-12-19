// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ProfileUserRepository implements ProfileUserRepository {
  _ProfileUserRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://192.168.50.7:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ProfileUser> getUserProfile({required userId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ProfileUser>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/user/${userId}/detail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateUser> putUserProfile({
    required userId,
    required updateUser,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateUser.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UpdateUser>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/user/${userId}/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WithdrawUser> withdrawUser({
    required userId,
    required withdrawUser,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(withdrawUser.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<WithdrawUser>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/user/${userId}/withdraw',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WithdrawUser.fromJson(_result.data!);
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
