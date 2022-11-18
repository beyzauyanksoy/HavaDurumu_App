import 'package:dio/dio.dart';

class Logging extends Interceptor{
int? sonuc;

@override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST ${options.method} => ${options.path}");
   return  super.onRequest(options, handler);
  }


@override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("RESPONSE ${response.statusCode}=> ${response.requestOptions.path}");
    switch (response.statusCode) {
      case 200:
    sonuc=200;
       print("işlem başarılı");
   break;
     case 404:
       print("Bulunamadı");
   break;
     case 417:
       print(" İstek başarısız");
   break;
      case 500:
       print(" Sunucu hatası");
   break;
   

      default:
    }
   return  super.onResponse(response, handler);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    
   return super.onError(err, handler);
  }
}