// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:ids_project/core.dart';

class DetailPictureController extends GetxController {
  var detail = {}.obs;
  var isLoading = true.obs;

  final PictureService _service = PictureService();

  void fetchDetail(int id) async {
    isLoading(true);
    try {
      final data = await _service.fetchPictureDetail(id);
      detail.assignAll(data);
    } catch (e) {
      print('Error fetching picture detail: $e');
    } finally {
      isLoading(false);
    }
  }
}
