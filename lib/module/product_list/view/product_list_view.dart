import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/util/url_api/url_api.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () async {
          await Get.to(ProductFormView());
          controller.getproducts();
        },
        child: CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("ProductList"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: controller.products.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final item = controller.products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Dismissible(
              key: UniqueKey(),
              // direction:
              //     DismissDirection.endToStart, // Arah menggeser untuk menghapus
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                bool confirm = false;
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Are you sure you want to delete this item?'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[600],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () {
                            confirm = true;
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );

                if (confirm) {
                  controller.doDelete(item["id"]);
                  return Future.value(true);
                }
                return Future.value(false);
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    12,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          child: Image.network(
                            item["image_url"],
                            // "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          item["name"],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${item["price"]}",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                item["category"]["name"],
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          item["description"],
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () async {
                              await Get.to(ProductFormView(
                                item: item,
                              ));
                              controller.getproducts();
                            },
                            child: Text('Update'),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
