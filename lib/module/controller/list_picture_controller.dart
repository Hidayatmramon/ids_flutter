import 'package:get/get.dart';
import 'package:ids_project/core.dart';

class ListPictureController extends GetxController {
  var pictures = [].obs;
  var isLoading = true.obs;

  final PictureService _service = PictureService();

  @override
  void onInit() {
    fetchPictures();
    super.onInit();
  }

  void fetchPictures() async {
    isLoading(true);
    try {
      final data = await _service.fetchPictures(limit: 15, page: 1);
      pictures.assignAll(data);
    } catch (e) {
      print('Error fetching pictures: $e');
    } finally {
      isLoading(false);
    }
  }
}
