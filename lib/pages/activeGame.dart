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
                child: IconButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF1F2022),
                    size: 35,
                  ),
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
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomAlerDialogStatus(),
                ),
                child: Container(
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              GestureDetector(
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        CustomAlerDialogQrCode()),
                child: Container(
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
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget CustomAlerDialogStatus() {
    return AlertDialog(
      title: Text(
        'Выберите статус',
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      insetPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.start,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      elevation: 0,
      actionsPadding: EdgeInsets.all(24),
      backgroundColor: Color(0xFF292A2C),
      actions: <Widget>[
        Wrap(
          runSpacing: 12,
          alignment: WrapAlignment.start,
          children: [
            Container(
              height: 65,
              width: 65,
              child: Image.asset('assets/png/first_aid_kit.png'),
              decoration: BoxDecoration(
                  color: Color(0xFF1F2022),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              height: 65,
              width: 65,
              child: Image.asset('assets/png/gun.png'),
              decoration: BoxDecoration(
                  color: Color(0xFF1F2022),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              height: 65,
              width: 65,
              child: Image.asset('assets/png/arena.png'),
              decoration: BoxDecoration(
                  color: Color(0xFF1F2022),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              height: 65,
              width: 65,
              child: Image.asset('assets/png/death.png'),
              decoration: BoxDecoration(
                  color: Color(0xFF1F2022),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ],
    );
  }

  Widget CustomAlerDialogQrCode() {
    return AlertDialog(
      insetPadding: EdgeInsets.only(left: 24, right: 24),
      actionsAlignment: MainAxisAlignment.start,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      elevation: 0,
      actionsPadding: EdgeInsets.all(24),
      backgroundColor: Color(0xFF292A2C),
      actions: <Widget>[
        Image.asset('assets/png/qr_code.png'),
        Container(
          margin: EdgeInsets.only(top: 24),
          width: 300,
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Введите код",
              hintStyle: TextStyle(
                color: Color(0xFFA4A5A7),
                fontFamily: 'Inter',
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Color(0xFF1F2022),
            ),
          ),
        ),
      ],
    );
  }

  Widget CustomAlerDialogTextMessage(String title, String subtitle) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Inter',
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      content: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            )
          : Container(
              height: 0,
            ),
      insetPadding: EdgeInsets.only(left: 24, right: 24),
      actionsAlignment: MainAxisAlignment.start,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      elevation: 0,
      actionsPadding: EdgeInsets.all(24),
      backgroundColor: Color(0xFF292A2C),
    );
  }
}
