// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_ggamf_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AcceptGgamfRepository implements AcceptGgamfRepository {
  _AcceptGgamfRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://localhost:8000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AcceptGgamf> acceptGgamf({
    required followId,
    required acceptGgamf,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(acceptGgamf.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AcceptGgamf>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ggamf/accept/${followId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AcceptGgamf.fromJson(_result.data!);
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
