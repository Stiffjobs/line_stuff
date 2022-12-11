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
      // fontWeight: FontWeight.bold,
      fontSize: 16.0.w,
    );
    return GetBuilder<ShowDetailController>(builder: (controller) {
      final show = controller.show;
      final noWebSales = show.webSales == "";
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: CustomScrollView(
            controller: ScrollController(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0.h),
                  child: Text(
                    show.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0.w,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: show.showUnit == ""
                    ? const SizedBox.shrink()
                    : Padding(
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
              ShowInfoCard(show: show),
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
                                    if (!await launchUrl(Uri.parse(show.webSales))) {
                                      Console.error('Could not launch ${show.webSales}');
                                    }
                                  },
                                  child: Text('Click Here',
                                      style: TextStyle(
                                        fontSize: 17.0.w,
                                      )),
                                ),
                              ],
                            ),
                      show.descriptionFilterHtml == "" ? const SizedBox.shrink() : Text('活動簡介說明', style: titleStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(show.descriptionFilterHtml),
                      ),
                    ],
                  ),
                ),
              ),
              UnitWidget(title: '主辦單位', units: show.masterUnit),
              UnitWidget(title: '協辦單位', units: show.subUnit),
              UnitWidget(title: '贊助單位', units: show.supportUnit),
              UnitWidget(title: '其他單位', units: show.otherUnit),
            ],
          ),
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
