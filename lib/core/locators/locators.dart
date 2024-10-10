library all_locators;

import 'package:code_base/common/services/network/custom_http_client.dart';
import 'package:code_base/core/routing/app_router.dart';
import 'package:code_base/presentation/login_page/login_page_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../common/services/connectivity_service.dart';
import '../../common/shared_pref/theme_pref.dart';
import '../../presentation/splash/splash_screen_bloc.dart';

part 'app_router_locator.dart';
part 'inject_locator.dart';
part 'shared_preference_locator.dart';
part 'blocs_locator.dart';
part 'libs_locator.dart';
part 'service_locator.dart';