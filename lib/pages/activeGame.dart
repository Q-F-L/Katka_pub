import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ActiveGame extends StatefulWidget {
  const ActiveGame({super.key});

  @override
  State<ActiveGame> createState() => _ActiveGameState();
}

class _ActiveGameState extends State<ActiveGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.height * 0.016,
                    MediaQuery.of(context).size.height * 0.05,
                    0,
                    0),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF1F2022),
                  size: 35,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 41, 42, 44),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Таймер поединка',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 41, 42, 44),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Таймер поединка',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(31, 32, 34, 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text(
                  'Статус',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(31, 32, 34, 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text(
                  'qr-код',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
