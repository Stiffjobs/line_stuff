part of show_detail_page;

class UnitWidget extends StatelessWidget {
  UnitWidget({
    Key? key,
    required this.title,
    required this.units,
  }) : super(key: key);

  final String title;
  final List<String> units;

  final titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0.w,
  );

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      units.isEmpty ? const SizedBox.shrink() : Text(title, style: titleStyle),
      units.isEmpty
          ? const SizedBox.shrink()
          : SizedBox(
              height: 30.0.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: units.length,
                  itemBuilder: (context, index) => Text(units[index])),
            ),
    ]));
  }
}
