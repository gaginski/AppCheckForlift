import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'barCode.dart';

void main() {
  runApp(leituraQr());
}

class leituraQr extends StatefulWidget {
  @override
  _leituraQr createState() => _leituraQr();
}

String _scanBarcode = 'Unknown';

class _leituraQr extends State<leituraQr> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    List<Widget> _widgets = [screen1(context), screen2(), screen3()];
    tapped(int tappedIndex) {
      setState(() {
        index = tappedIndex;
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: _widgets[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: tapped,
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(Icons.looks_one), title: Text('One')),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.looks_two), title: Text('Two')),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.looks_3), title: Text('Three')),
            ],
          )),
    );
  }

  screen1(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => scanQR(), child: Text('Start barcode scan')),
    );
  }

  screen2() {
    return Center(
      child: Text('Screen 2'),
    );
  }

  screen3() {
    return Center(
      child: Text('Screen 3'),
    );
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
}
