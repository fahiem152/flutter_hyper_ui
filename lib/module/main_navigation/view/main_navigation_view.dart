import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class MainNavigationView extends StatefulWidget {
  MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 2,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            ProductListView(),
            CategoryListView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.viewDashboard,
              ),
              label: "Product",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.table,
              ),
              label: "Category",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
