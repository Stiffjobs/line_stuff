part of show_detail_page;

class ShowInfoCard extends StatelessWidget {
  const ShowInfoCard({
    Key? key,
    required this.show,
  }) : super(key: key);

  final ShowModel show;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                        notSaling ? const SizedBox.shrink() : Text('票價資訊： ${showInfo.price}'),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
