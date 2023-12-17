import 'package:flutter/material.dart';

class qrCodeRead extends StatefulWidget {
  const qrCodeRead({super.key});

  @override
  State<qrCodeRead> createState() => _qrCodeReadState();
}

class _qrCodeReadState extends State<qrCodeRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2022),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(23),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFF6BD1D),
            ),
          ),
          child: Image.asset("assets/png/qr_code.png"),
        ),
      ),
    );
  }
}
