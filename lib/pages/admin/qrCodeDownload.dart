import 'package:flutter/material.dart';

class QRCodeDownloade extends StatefulWidget {
  const QRCodeDownloade({super.key});

  @override
  State<QRCodeDownloade> createState() => _QRCodeDownloadeState();
}

class _QRCodeDownloadeState extends State<QRCodeDownloade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2022),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 24,
            bottom: 24,
          ),
          width: 343,
          height: 500,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFF292A2C),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Image.asset("assets/png/qr_code.png"),
              SizedBox(
                height: 24,
              ),
              Container(
                alignment: Alignment.center,
                width: 295,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFF1F2022),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '2876102876',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Скачать",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4D1F00),
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 246, 188, 29)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
