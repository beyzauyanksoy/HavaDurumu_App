import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_context/one_context.dart';

class Logging extends Interceptor {
  int? sonuc;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST ${options.method} => ${options.path}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("RESPONSE ${response.statusCode}=> ${response.requestOptions.path}");
    switch (response.statusCode) {
      case 200:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("Hata sayfası"),
            content: Text("İşlem Başarılı"),
          ),
        );

        break;
      case 404:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("Hata sayfası"),
            content: Text("Bulunamadı"),
          ),
        );

        break;
      case 417:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("Hata sayfası"),
            content: Text("istek başarısız"),
          ),
        );
        print(" İstek başarısız");
        break;
      case 500:
        OneContext().showDialog(
          builder: (_) => const AlertDialog(
            title: Text("Hata sayfası"),
            content: Text("Sunucu hatası"),
          ),
        );
        print(" Sunucu hatası");
        break;

      default:
    }

    @override
    void onError(DioError err, ErrorInterceptorHandler handler) {
      return super.onError(err, handler);
    }
  }
}
