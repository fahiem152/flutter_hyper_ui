import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionCheckerPlusPage extends StatefulWidget {
  const InternetConnectionCheckerPlusPage({super.key});

  @override
  State<InternetConnectionCheckerPlusPage> createState() =>
      _InternetConnectionCheckerPlusPageState();
}

class _InternetConnectionCheckerPlusPageState
    extends State<InternetConnectionCheckerPlusPage> {
  bool isConnectInternet = false;
  InternetStatus? _connectionStatus;
  late StreamSubscription<InternetStatus> _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = InternetConnection().onStatusChange.listen((status) {
      log("status: $status");
      if (status == InternetStatus.connected) {
        isConnectInternet = true;
      } else {
        isConnectInternet = false;
      }
      setState(() {
        _connectionStatus = status;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  // load() async {
  //   isConnectedInternet = await InternetConnection().hasInternetAccess;
  //   log("isConnectedInternet: $isConnectedInternet");
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InternetConnectionCheckerPlusPage"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text("Connection Status: $isConnectedInternet"),
              // const SizedBox(
              //   height: 40.0,
              // ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.black,
              //     foregroundColor: Colors.white,
              //   ),
              //   onPressed: () {
              //     load();
              //   },
              //   child: const Text("Save"),
              // ),

              const Text(
                'This example shows how to listen for the internet connection '
                'status using a StreamSubscription.\n\n'
                'Changes to the internet connection status are listened and '
                'reflected in this example.',
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 48.0,
                thickness: 2.0,
              ),
              Text('Connection Status ($isConnectInternet):'),
              _connectionStatus == null
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      _connectionStatus.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
