import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class NmgServices {
  final Dio _dio = Dio();
  final String apiConst = 'https://jsonplaceholder.typicode.com/';

  NmgServices() {
    _dio.interceptors.add(_serviceInterceptor());
  }

  Interceptor _serviceInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        SVProgressHUD.show();
        Future.delayed(const Duration(seconds: 45)).then((value) {
          SVProgressHUD.dismiss();
        });
        handler.next(options);
      },
      onResponse: (response, handler) {
        print(response.data);
        SVProgressHUD.dismiss();
        handler.next(response);
      },
      onError: (e, handler) {
        SVProgressHUD.dismiss();
        handler.next(e);
        if (e.response != null) {
          //TODO: handle errors and can show toasts
        }
      },
    );
  }

  Future<bool> hasInternet() async {
    final conectivity = await Connectivity().checkConnectivity();
    return (conectivity == ConnectivityResult.mobile ||
        conectivity == ConnectivityResult.wifi);
  }

  Future<List<dynamic>?> getAuthorsList() async {
    if (!await hasInternet()) {
      // Can show toasts for internet
      return null;
    }

    final response = await _dio.get('${apiConst}users');
    return response.data;
  }

  Future<List<dynamic>?> getPostsList() async {
    if (!await hasInternet()) {
      // Can show toasts for internet
      return null;
    }

    final response = await _dio.get('${apiConst}posts');
    return response.data;
  }

  Future<dynamic> getPostDetails(int id) async {
    if (!await hasInternet()) {
      // Can show toasts for internet
      return null;
    }

    final response = await _dio.get('${apiConst}posts/$id');
    return response.data;
  }
}
