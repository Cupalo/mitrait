import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mitrait/controllers/controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, controller.intialData());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test'),
      ),
      body: Obx(() {
        return ListView(
          children: [
            controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.list.isEmpty
                    ? Container()
                    : ListView.builder(
                        itemCount: controller.list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            width: Get.width,
                            child: Row(
                              children: [
                                data(controller.list[index][0]),
                                data(controller.list[index][1]),
                                data(controller.list[index][2]),
                                data(controller.list[index][3]),
                                data(controller.list[index][4]),
                                data(controller.list[index][5]),
                                data(controller.list[index][6]),
                                data(controller.list[index][7]),
                                data(controller.list[index][8]),
                                data(controller.list[index][9]),
                              ],
                            ),
                          );
                        },
                      ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: controller.horizontalFLip,
                    child: const Text('Horizontal Flip'),
                  ),
                  ElevatedButton(
                    onPressed: controller.verticalFLip,
                    child: const Text('Vertical Flip'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget data(String text) {
    return Expanded(
      child: Center(child: Text(text)),
    );
  }
}
