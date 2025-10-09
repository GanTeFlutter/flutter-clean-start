import 'package:dio/dio.dart';
import 'package:flutter_base_start/product/service/services/http_service.dart';
import 'package:flutter_base_start/product/service/services/logger_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  _registerSingletons();
}

void _registerSingletons() {
  locator
    ..registerSingleton<LoggerService>(LoggerService())
    ..registerSingleton<HTTPService>(
      HTTPService(baseUrl: 'Env.baseUrl', apiKey: 'Env.apiKey', dio: Dio()),
    );
}

extension ServiceLocator on GetIt {
  LoggerService get logger => locator<LoggerService>();
  HTTPService get http => locator<HTTPService>();
}
