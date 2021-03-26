//
// import 'package:dio/dio.dart';
//
// import '../dio_http_cache.dart';
//
// class CacheInterceptor extends InterceptorsWrapper{
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     // TODO: implement onError
//     super.onError(err, handler);
//   }
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     if ((options.extra[DIO_CACHE_KEY_TRY_CACHE] ?? false) != true) {
//       super.onRequest(options, handler);
//     }
//     if (true == options.extra[DIO_CACHE_KEY_FORCE_REFRESH]) {
//       return super.onRequest(options, handler);;
//     }
//     var responseDataFromCache = await _pullFromCacheBeforeMaxAge(options);
//     if (null != responseDataFromCache) {
//       return _buildResponse(
//           responseDataFromCache, responseDataFromCache?.statusCode, options);
//     }
//     return options;
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if ((options.extra[DIO_CACHE_KEY_TRY_CACHE] ?? false) != true) {
//       return options;
//     }
//     if (true == options.extra[DIO_CACHE_KEY_FORCE_REFRESH]) {
//       return options;
//     }
//     var responseDataFromCache = await _pullFromCacheBeforeMaxAge(options);
//     if (null != responseDataFromCache) {
//       return _buildResponse(
//           responseDataFromCache, responseDataFromCache?.statusCode, options);
//     }
//     return options;
//     super.onResponse(response, handler);
//   }
// }