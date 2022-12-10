part of show_detail_page;

class ShowDetailPage extends StatelessWidget {
  const ShowDetailPage({super.key});
  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Get.back(),
      ),
      backgroundColor: Colors.white,
      title: const Text(
        '詳細表演資訊',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      elevation: 0.0,
    );
  }

  Widget _buildView() {
    return GetBuilder<ShowDetailController>(builder: (controller) {
      final show = controller.show;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          children: [
            Text("表演名稱：${show.title}"),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowDetailController>(
      init: ShowDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildView(),
        );
      },
    );
  }
}
