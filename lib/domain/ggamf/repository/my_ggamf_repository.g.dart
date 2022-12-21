// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ggamf_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MyGgamfRepository implements MyGgamfRepository {
  _MyGgamfRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://172.20.10.2:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Ggamf> followGgamf({
    required followingId,
    required followGgamf,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(followGgamf.toJson());
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Ggamf>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/ggamf/follow/${followingId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Ggamf.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReportGgamf> reportGgamf({
    required userId,
    required badUserId,
    required reportGgamf,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reportGgamf.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ReportGgamf>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/s/api/ggamf/user/${userId}/report/${badUserId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReportGgamf.fromJson(_result.data!);
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
