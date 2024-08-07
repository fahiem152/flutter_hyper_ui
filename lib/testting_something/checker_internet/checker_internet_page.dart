// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class CheckerInternetPage extends StatefulWidget {
//   const CheckerInternetPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CheckerInternetPage> createState() => _CheckerInternetState();
// }

// class _CheckerInternetState extends State<CheckerInternetPage> {
//   String _connectionStatus = 'Unknown';
//   bool isDialogShowOn = false;
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   @override
//   void initState() {
//     super.initState();
//     _connectivitySubscription =
//         Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
//     _checkInitialConnection();
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }

//   Future<void> _checkInitialConnection() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     _updateConnectionStatus(connectivityResult);
//   }

//   void _updateConnectionStatus(ConnectivityResult result) {
//     if (result == ConnectivityResult.none && !isDialogShowOn) {
//       _connectionStatus = 'No internet connection';
//       _showNetworkErrorDialog();
//     } else if (result != ConnectivityResult.none && isDialogShowOn) {
//       Navigator.of(context, rootNavigator: true).pop();
//       _connectionStatus = 'Connected to $result';
//       setState(() {
//         isDialogShowOn = false;
//       });
//     }
//   }

//   void _showNetworkErrorDialog() {
//     _connectionStatus = 'No internet connection';
//     setState(() {
//       isDialogShowOn = true;
//     });
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (_) => NetworkErrorDialog(
//         onPressed: () async {
//           final connectivityResult = await Connectivity().checkConnectivity();
//           if (connectivityResult == ConnectivityResult.none) {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                 content: Text('Please turn on your wifi or mobile data')));
//           } else {
//             Navigator.pop(context);
//             setState(() {
//               isDialogShowOn = false;
//             });
//           }
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           AppBar(title: const Text("Check Connection Page: Conectivity_PLUS")),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Text(_connectionStatus),
//             ),
//             const SizedBox(
//               height: 60.0,
//             ),
//             ElevatedButton(
//               child: const Text("Check Connection"),
//               onPressed: () async {
//                 final connectivityResult =
//                     await Connectivity().checkConnectivity();
//                 if (connectivityResult == ConnectivityResult.none) {
//                   showDialog(
//                     barrierDismissible: false,
//                     context: context,
//                     builder: (_) => NetworkErrorDialog(
//                       onPressed: () async {
//                         final connectivityResult =
//                             await Connectivity().checkConnectivity();
//                         if (connectivityResult == ConnectivityResult.none) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text(
//                                       'Please turn on your wifi or mobile data')));
//                         } else {
//                           Navigator.pop(context);
//                         }
//                       },
//                     ),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                           'You\'re connected to a ${connectivityResult.name} network')));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NetworkErrorDialog extends StatelessWidget {
//   const NetworkErrorDialog({Key? key, this.onPressed}) : super(key: key);
//   final Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       content: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//               width: 200,
//               child: Icon(
//                 Icons.wifi_off,
//                 size: 100,
//                 color: Colors.red,
//               )),
//           const SizedBox(height: 32),
//           const Text(
//             "Whoops!",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "No internet connection found.",
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             "Check your connection and try again.",
//             style: TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             child: const Text("Try Again"),
//             onPressed: onPressed,
//           )
//         ],
//       ),
//     );
//   }
// }
