part of main_page;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: ListView.builder(
              itemCount: controller.musicShowList.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(controller.musicShowList[index].title),
                  )),
            ),
          );
        });
  }
}
