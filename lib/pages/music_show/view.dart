part of music_show_page;

enum FilterType {
  all,
  newest,
  oldest,
  popular,
}

class MusicShowPage extends StatelessWidget {
  MusicShowPage({super.key});

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicShowController>(
        init: Get.put<MusicShowController>(MusicShowController()),
        builder: (controller) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: _buildView(),
          );
        });
  }

  Widget _buildView() {
    return GetBuilder<MusicShowController>(
        id: 'list',
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.musicShowList.length,
            itemBuilder: ((context, index) {
              final show = controller.musicShowList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  child: ListTile(
                    onTap: () => Get.toNamed(RouteNames.showDetail, arguments: {
                      'show': controller.musicShowList[index],
                    }),
                    title: Text(show.title),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(show.sourceWebName),
                          Text(
                            '${show.startDate} - ${show.endDate}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: GetBuilder<MusicShowController>(
          id: 'title',
          builder: (controller) {
            return Text(
              controller.appbarTitle,
              style: const TextStyle(
                color: Colors.black54,
              ),
            );
          }),
      actions: [
        GetBuilder<MusicShowController>(
            id: 'fileter',
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.only(right: 20.0.w),
                child: PopupMenuButton<FilterType>(
                    initialValue: controller.filterType,
                    child: Icon(Icons.tune, color: Colors.black54),
                    onSelected: controller.handleSelect,
                    itemBuilder: (context) => const <PopupMenuEntry<FilterType>>[
                          PopupMenuItem(
                            child: Text('All'),
                            value: FilterType.all,
                          ),
                          PopupMenuItem(
                            child: Text(
                              'Newest',
                            ),
                            value: FilterType.newest,
                          ),
                          PopupMenuItem(
                            child: Text(
                              'oldest',
                            ),
                            value: FilterType.oldest,
                          ),
                          PopupMenuItem(
                            child: Text('Popular'),
                            value: FilterType.popular,
                          ),
                        ]),
              );
            })
      ],
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}
