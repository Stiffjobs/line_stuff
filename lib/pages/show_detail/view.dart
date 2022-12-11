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
    final titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0.w,
    );
    return GetBuilder<ShowDetailController>(builder: (controller) {
      final show = controller.show;
      final noWebSales = show.webSales == "";
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: CustomScrollView(
          controller: ScrollController(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0.h),
                child: Text(
                  show.title,
                  style: titleStyle,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Row(
                  children: [
                    Text(
                      '演出單位：',
                      style: titleStyle,
                    ),
                    Text(show.showUnit),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Text(
                  '活動場次資訊:',
                  style: titleStyle,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 240.0.h * show.showInfo.length,
                child: ListView.builder(
                    itemCount: show.showInfo.length,
                    itemBuilder: (context, index) {
                      final showInfo = show.showInfo[index];
                      final notSaling = showInfo.onSales == "N";
                      return SizedBox(
                        height: 240.0.h,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 1.0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0.w,
                              vertical: 10.0.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      showInfo.locationName,
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0.h),
                                Text(
                                  showInfo.location,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8.0.h),
                                Text('演出開始時間：${showInfo.time}'),
                                Text('演出結束時間：${showInfo.endTime}'),
                                SizedBox(
                                  height: 8.0.h,
                                ),
                                Text('是否售票：${notSaling ? "否" : "是"}'),
                                notSaling
                                    ? const SizedBox.shrink()
                                    : Text('票價資訊： ${showInfo.price}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('活動日期', style: titleStyle),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${show.startDate} - ${show.endDate}'),
                    ),
                    noWebSales
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Text(
                                '售票網址：',
                                style: titleStyle,
                              ),
                              TextButton(
                                onPressed: () async {
                                  if (!await launchUrl(
                                      Uri.parse(show.webSales))) {
                                    Console.error(
                                        'Could not launch ${show.webSales}');
                                  }
                                },
                                child: Text('Click Here',
                                    style: TextStyle(
                                      fontSize: 17.0.w,
                                    )),
                              ),
                            ],
                          ),
                    show.descriptionFilterHtml == ""
                        ? const SizedBox.shrink()
                        : Text('活動簡介說明', style: titleStyle),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(show.descriptionFilterHtml),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: show.masterUnit.isEmpty
                  ? SizedBox.shrink()
                  : Text('主辦單位', style: titleStyle),
            ),
            SliverToBoxAdapter(
              child: show.masterUnit.isEmpty
                  ? SizedBox.shrink()
                  : SizedBox(
                      height: 120.0.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: show.masterUnit.length,
                          itemBuilder: (context, index) =>
                              Text(show.masterUnit[index])),
                    ),
            )
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
