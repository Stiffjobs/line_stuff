part of music_show_page;

class MusicShowPage extends StatelessWidget {
  const MusicShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicShowController>(
        init: Get.put<MusicShowController>(MusicShowController()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                controller.appbarTitle,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: ListView.builder(
              itemCount: controller.musicShowList.length,
              itemBuilder: ((context, index) {
                final show = controller.musicShowList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: ListTile(
                      onTap: () => Get.toNamed(RouteNames.showDetail, arguments: {
                        'show': show,
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
            ),
          );
        });
  }
}
