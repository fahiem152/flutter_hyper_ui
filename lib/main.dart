// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hyper_ui/testting_something/checker_internet/checker_internet_page.dart';
import 'package:hyper_ui/testting_something/device_info/device_info_page.dart';
import 'package:hyper_ui/testting_something/image_picker_web/flutter_image_web_page.dart';
import 'package:hyper_ui/testting_something/multiple_language/l10n/l10n.dart';
import 'package:hyper_ui/testting_something/multiple_language/local_provider.dart';
import 'package:hyper_ui/testting_something/multiple_language/localization_page.dart';
import 'package:hyper_ui/testting_something/printer_bluetooth/manage_printer_page.dart';
import 'package:hyper_ui/testting_something/websocket/binance_webscoket_page.dart';
import 'package:hyper_ui/testting_something/websocket/websocket_page.dart';
import 'package:hyper_ui/testting_something/work_manager/pages/work_manager_page.dart';
import 'package:hyper_ui/testting_something/work_manager/service/location_service.dart';
import 'package:hyper_ui/testting_something/work_manager/service/work_manager_service.dart';

import 'package:hyper_ui/core.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'testting_something/flutter_excel/excel_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  // CustomWorkManager.init();

  // await BackgroundService.instance.init();
  // setupLocator();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: MainApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeMysqlPage(),
//     );
//   }
//   //   return GraphQLProvider(
//   //     client: client,
//   //     child: MaterialApp(
//   //       debugShowCheckedModeBanner: false,
//   //       home: FlutterGraphqlPage(),
//   //     ),
//   //   );
//   // }
// }

// class ExceptionsAnalyticsTalkerObserver extends TalkerObserver {
//   final SentryClient sentry;
//   ExceptionsAnalyticsTalkerObserver(this.sentry);

//   @override
//   void onError(TalkerError err) {
//     final sentryException = SentryException(
//       type: 'TalkerError',
//       value: err.toString(),
//       mechanism: Mechanism(
//         type: 'Talker',
//         handled: true, // You can set this based on your use case.
//       ),
//     );

//     final sentryEvent = SentryEvent(
//       exceptions: [sentryException],
//       level: SentryLevel.error,
//     );

//     sentry.captureEvent(sentryEvent);
//     super.onError(err);
//   }

//   @override
//   void onException(TalkerException exception) {
//     final sentryException = SentryException(
//       type: 'TalkerException',
//       value: exception.toString(),
//       mechanism: Mechanism(
//         type: 'Talker',
//         handled: true, // You can set this based on your use case.
//       ),
//     );

//     final sentryEvent = SentryEvent(
//       exceptions: [sentryException],
//       level: SentryLevel.error,
//     );

//     sentry.captureEvent(sentryEvent);
//     super.onException(exception);
//   }

//   @override
//   void onLog(TalkerDataInterface log) {
//     // Send log to another backend if needed.
//     super.onLog(log);
//   }
// }

// Future<void> main() async {
//   final SentryClient sentry = SentryClient(SentryOptions(
//       dsn:
//           'https://66772d57120d9c364d0df94a8743e748@o4505859798859776.ingest.sentry.io/4505859809476608'));
//   final observer = ExceptionsAnalyticsTalkerObserver(sentry);
//   final talker = Talker(observer: observer);

//   // WidgetsFlutterBinding.ensureInitialized();
//   runZonedGuarded(
//     () => runApp(MainApp(talker: talker)),
//     (Object error, StackTrace stack) {
//       talker.handle(error, stack, 'Uncaught app exception');
//     },
//   );
//   // await SentryFlutter.init((options) {
//   //   options.dsn =
//   //       'https://66772d57120d9c364d0df94a8743e748@o4505859798859776.ingest.sentry.io/4505859809476608';
//   //   // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
//   //   // We recommend adjusting this value in production.
//   //   options.tracesSampleRate = 1.0;
//   // }, appRunner: () => runMainApp());
// }

// // runMainApp() async {
// //   return runApp(const MainApp());
// // }

class MainApp extends StatelessWidget {
  // final Talker talker;
  const MainApp({
    Key? key,
    // required this.talker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      supportedLocales: L10n.all,
      locale: localeProvider.locale,

      // localizationsDelegates: [
      //   AppLocalizations.delegate, // Add this line
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      // home: WebScoketPage(
      //   channel: IOWebSocketChannel.connect("ws://echo.websocket.org"),
      // ),
      // home: LocalizationPages(),
      home: CheckerInternetPage(),
      builder: (context, child) => DebugView(
        context: context,
        child: child,
        visible: true,
      ),
    );
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:hyper_ui/testting_something/talker/talker_wrapper_Page.dart';
// // import 'package:talker_example/extended_example/extended_example.dart';
// import 'package:talker_flutter/talker_flutter.dart';

// /// You can see [ExtendedExample] to
// /// check how logs working in realtime
// ///
// ///

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   await InitialLocal.initialize();

//   final talker = TalkerFlutter.init();
//   runZonedGuarded(
//     () => runApp(MainApp(talker: talker)),
//     (Object error, StackTrace stack) {
//       talker.handle(error, stack, 'Uncaught app exception');
//     },
//   );
// }

// class TalkerBasicPage extends StatefulWidget {
//   const TalkerBasicPage({
//     Key? key,
//     required this.talker,
//   }) : super(key: key);

//   final Talker talker;

//   @override
//   State<TalkerBasicPage> createState() => _TalkerBasicPageState();
// }

// class _TalkerBasicPageState extends State<TalkerBasicPage> {
//   @override
//   void initState() {
//     final talker = widget.talker;
//     talker.info('Renew token from expire date');
//     _handleException();
//     talker.warning('Cache images working slowly on this platform');
//     talker.log('Server exception', logLevel: LogLevel.critical);
//     talker.debug('Exception data sent for your analytics server');
//     talker.verbose(
//       'Start reloading config after critical server exception',
//     );
//     talker.info('3.............');
//     talker.info('2.......');
//     talker.info('1');
//     talker.good('Now you can check all Talkler power ⚡');
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Talker Flutter',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.grey[100],
//       ),
//       home: Builder(builder: (context) {
//         return Scaffold(
//           body: TalkerScreen(talker: widget.talker),
//         );
//       }),
//     );
//   }

//   void _handleException() {
//     try {
//       throw Exception('Test service exception');
//     } catch (e, st) {
//       widget.talker.handle(e, st, 'FakeService exception');
//     }
//   }
// }
