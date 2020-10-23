// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/live/web_view.dart';

class Routes {
  static const String homeView = '/';
  static const String webView = '/web-view';
  static const all = <String>{
    homeView,
    webView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.webView, page: WebView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    WebView: (data) {
      final args = data.getArgs<WebViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => WebView(
          key: args.key,
          url: args.url,
          title: args.title,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// WebView arguments holder class
class WebViewArguments {
  final dynamic key;
  final String url;
  final String title;
  WebViewArguments({this.key, @required this.url, @required this.title});
}
