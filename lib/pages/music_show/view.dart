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
              return MusicShowItem(show: show);
            }),
          );
        });
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: GetBuilder<MusicShowController>(
            id: 'archived',
            builder: (controller) {
              return IconButton(
                icon: Icon(
                  Icons.inbox,
                  color: Colors.black54,
                ),
                onPressed: () {
                  Get.toNamed(RouteNames.archivedShow);
                },
              );
            }),
      ),
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
                    onSelected: controller.handleSelect,
                    itemBuilder: (context) => const <PopupMenuEntry<FilterType>>[
                          PopupMenuItem(
                            value: FilterType.all,
                            child: Text('All'),
                          ),
                          PopupMenuItem(
                            value: FilterType.newest,
                            child: Text(
                              'Newest',
                            ),
                          ),
                          PopupMenuItem(
                            value: FilterType.oldest,
                            child: Text(
                              'oldest',
                            ),
                          ),
                          PopupMenuItem(
                            value: FilterType.popular,
                            child: Text('Popular'),
                          ),
                        ],
                    child: Icon(Icons.tune, color: Colors.black54)),
              );
            })
      ],
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}
