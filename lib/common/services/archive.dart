part of services;

class ArchiveService extends GetxService {
  static ArchiveService get to => Get.find();

  final List<ShowModel> archivedItems = StorageService.to.getString(Constants.storageArchivedShow) == ""
      ? []
      : (jsonDecode(StorageService.to.getString(Constants.storageArchivedShow)) as List)
          .map((e) => ShowModel.fromJson(e))
          .toList();
}
