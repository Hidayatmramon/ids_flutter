// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const PHOTOS = _Paths.PHOTOS;
  static const DETAIL = _Paths.DETAIL;
}
abstract class _Paths {
  static const PHOTOS = '/list';
  static const DETAIL = '/detail';
}
