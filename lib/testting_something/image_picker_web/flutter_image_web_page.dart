import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class FlutterImageWebPage extends StatefulWidget {
  const FlutterImageWebPage({super.key});

  @override
  State<FlutterImageWebPage> createState() => _FlutterImageWebPageState();
}

class _FlutterImageWebPageState extends State<FlutterImageWebPage> {
  Image? _photo;
  Future<void> _onAddPhotoClicked(context) async {
    final image = await ImagePickerWeb.getImageAsWidget();
    print(image);

    if (image != null) {
      setState(() {
        _photo = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Image Web Page"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _photo != null
                ? Center(
                    child: Container(
                        margin: EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        child: _photo),
                  )
                : SizedBox(),
            const SizedBox(
              height: 24.0,
            ),
            Center(
              child: GestureDetector(
                onTap: () => _onAddPhotoClicked(context),
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Icon(
                      Icons.add_to_photos,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
