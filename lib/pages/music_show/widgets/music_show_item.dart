part of music_show_page;

class MusicShowItem extends StatelessWidget {
  const MusicShowItem({
    Key? key,
    required this.show,
  }) : super(key: key);

  final ShowModel show;

  @override
  Widget build(BuildContext context) {
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
  }
}
