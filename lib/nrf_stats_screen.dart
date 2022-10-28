// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_macos_webview/flutter_macos_webview.dart';

// class NRFStatsViewPage extends StatelessWidget {
//   const NRFStatsViewPage({super.key});
//   Future<void> _onOpenPressed(PresentationStyle presentationStyle) async {
//     final webview = FlutterMacOSWebView(
//       onOpen: () => print('Opened'),
//       onClose: () => print('Closed'),
//       onPageStarted: (url) => print('Page started: $url'),
//       onPageFinished: (url) => print('Page finished: $url'),
//     );

//     await webview.open(
//       url: 'https://google.com',
//       presentationStyle: presentationStyle,
//       size: Size(400.0, 400.0),
//       userAgent:
//           'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('NRF Halloween Stats'),
//       ),
//       body: Center(
//         child: CupertinoButton(
//           child: const Text('Open as modal'),
//           onPressed: () => _onOpenPressed(PresentationStyle.modal),
//         ),
//       ),
//     );
//   }
// }
