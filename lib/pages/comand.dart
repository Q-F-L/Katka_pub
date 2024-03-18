import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/rating.dart';
import 'package:katka/firebase/command/firestore_constans.dart';
import 'package:katka/firebase/user/firestore_constans.dart';
import 'package:katka/global_value.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';

class Comand extends StatefulWidget {
  const Comand({super.key});

  @override
  State<Comand> createState() => _ComandState();
}

class _ComandState extends State<Comand> {
  List<DocumentSnapshot> command = [];
  List<DocumentSnapshot> user = [];

  String? commandUser;
  String? imageLogoPath;
  String? imageCommandPath;

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<DocumentSnapshot>> userElementStream(String uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .where(FirestoreConstants.uid, isEqualTo: uid)
        .get();
    return result.docs;
  }

  // userStream() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   commandStream();
  //   String commanderUid =
  //       command.first.get(FirestoreConstantsCommand.commander);
  //   print(commanderUid);
  //   final QuerySnapshot result = await firebaseFirestore
  //       .collection(FirestoreConstants.pathUserCollection)
  //       .where(FirestoreConstants.uid, isEqualTo: commanderUid)
  //       .get();
  // }

  //получить командира

  // Future userStream() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   final QuerySnapshot result = await firebaseFirestore
  //       .collection(FirestoreConstants.pathUserCollection)
  //       .where(FirestoreConstants.id,
  //           isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   commandUser = result.docs[0].get(FirestoreConstants.command);
  //   return result.docs[0];
  // }

  Future<DocumentSnapshot> commandStream() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstantsCommand.pathCommandCollection)
        .where(FirestoreConstantsCommand.id, isEqualTo: commandGlobal.id)
        .get();
    command = result.docs;
    return result.docs.first;
    // commandGlobal.city = result.docs.first.get(FirestoreConstantsCommand.city);
    // commandGlobal.country =
    //     result.docs.first.get(FirestoreConstantsCommand.country);
    // commandGlobal.colorUniform =
    //     result.docs.first.get(FirestoreConstantsCommand.colorUniform);
    // commandGlobal.commander =
    //     result.docs.first.get(FirestoreConstantsCommand.commander);
    // commandGlobal.description =
    //     result.docs.first.get(FirestoreConstantsCommand.description);
    // commandGlobal.imageCommandPath =
    //     result.docs.first.get(FirestoreConstantsCommand.imageCommandPath);
    // commandGlobal.imageLogoPath =
    //     result.docs.first.get(FirestoreConstantsCommand.imageLogoPath);
    // commandGlobal.listPlayers =
    //     result.docs.first.get(FirestoreConstantsCommand.listPlayers);
    // commandGlobal.name = result.docs.first.get(FirestoreConstantsCommand.name);
    // commandGlobal.rationgCommand =
    //     result.docs.first.get(FirestoreConstantsCommand.rationgCommand);
  }

  Future<String> downloadImageLogo() async {
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot = await _firebaseStorage.ref().child(
        command.first.get(FirestoreConstantsCommand.imageLogoPath) ?? '');
    String? downloadUrl = await snapshot.getDownloadURL();
    return downloadUrl.toString();
  }

  requestInCommand() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection('teamRequest').doc(userGlobal.uid).set({
      'uid': userGlobal.uid,
      FirestoreConstants.nickname: userGlobal.nickname,
      FirestoreConstants.rationgUser: userGlobal.rationgUser,
      'id': command.first.get(FirestoreConstantsCommand.id)
    });
  }

  Future<String> downloadImageCommand() async {
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot = await _firebaseStorage.ref().child(
        command.first.get(FirestoreConstantsCommand.imageCommandPath) ?? '');
    var downloadUrl = await snapshot.getDownloadURL();
    return downloadUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context, '/listCommands');
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                ),
              )
            : IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listCommands');
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                ),
              ),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Подробности команды'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: FutureBuilder<DocumentSnapshot>(
            future: commandStream(), // Run check for a single queryRow
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: command.length,
                    itemBuilder: (context, index) {
                      List<dynamic> listCommand = command[index]
                          .get(FirestoreConstantsCommand.listPlayers);
                      int countCommand = listCommand.length;
                      bool player = true;
                      for (var element in listCommand) {
                        if (element == userGlobal.uid) {
                          player = false;
                        }
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          FutureBuilder(
                              future: downloadImageLogo(),
                              builder: (context, snapshot) {
                                print(snapshot.data);
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Image.asset(
                                      'assets/png/logo_team.png');
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data != null) {
                                      return Image.network(
                                        snapshot.data ?? '',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.83,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                      );
                                    } else {
                                      return Image.asset(
                                          'assets/png/logo_team.png');
                                    }
                                  } else {
                                    return Image.asset(
                                        'assets/png/logo_team.png');
                                  }
                                } else {
                                  print('${snapshot.error}');
                                  return Image.asset(
                                      'assets/png/logo_team.png');
                                }
                              }),
                          // imageLogoPath != null
                          //     ? Image.network(
                          //         '${imageLogoPath}',
                          //         width:
                          //             MediaQuery.of(context).size.width * 0.83,
                          //         height:
                          //             MediaQuery.of(context).size.width * 0.6,
                          //       )
                          //     : Image.asset(
                          //         'assets/png/logo_team.png',
                          //         width:
                          //             MediaQuery.of(context).size.width * 0.83,
                          //         height:
                          //             MediaQuery.of(context).size.width * 0.6,
                          //       ),
                          const SizedBox(
                            height: 12,
                          ),
                          FutureBuilder(
                              future: downloadImageCommand(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Image.asset('assets/png/img_team.png');
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data != null) {
                                      return Image.network(
                                        snapshot.data ?? '',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.83,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                      );
                                    } else {
                                      return Image.asset(
                                          'assets/png/img_team.png');
                                    }
                                  } else {
                                    return Image.asset(
                                        'assets/png/img_team.png');
                                  }
                                } else {
                                  print('${snapshot.error}');
                                  return Image.asset('assets/png/img_team.png');
                                }
                              }),
                          // imageCommandPath != null
                          //     ? Image.network(
                          //         '$imageCommandPath',
                          //         width:
                          //             MediaQuery.of(context).size.width * 0.83,
                          //         height:
                          //             MediaQuery.of(context).size.width * 0.6,
                          //       )
                          //     : Image.asset(
                          //         'assets/png/img_team.png',
                          //         width:
                          //             MediaQuery.of(context).size.width * 0.83,
                          //         height:
                          //             MediaQuery.of(context).size.width * 0.6,
                          //       ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "${command.length > 0 ? command[index].get(FirestoreConstantsCommand.name) : 'NULL'}",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${command[index].get(FirestoreConstantsCommand.city)}",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 164, 165, 167),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          rating(
                              'рейтинг ${command[index].get(FirestoreConstantsCommand.rationgCommand)}',
                              // 'рейтинг 100',
                              context),
                          const SizedBox(
                            height: 24,
                          ),
                          true ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                              color: Color(0xFF292A2C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    // '${documentUser.get(FirestoreConstants.name)}',
                                    '${snapshot.data!.get(FirestoreConstantsCommand.nameCommander)}',
                                    style: TextStyle(
                                      color: Color(0xFFA4A5A7),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 24,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 246, 188, 29),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(255, 246, 188, 29),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.stars,
                                        color: Color(0xFF4D1F00),
                                      ),
                                      Text(
                                        ' рейтинг ${command[index].get(FirestoreConstantsCommand.rationgCommand)}',
                                        // 'рейтинг 100',
                                        style: TextStyle(
                                            color: Color(0xFF4D1F00),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ) : Text('data'),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            '${countCommand}',
                            // '1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextField(
                            style: TextStyle(
                              color: Color.fromARGB(255, 164, 165, 167),
                              fontFamily: "Inter",
                              fontSize: 16,
                            ),
                            maxLines: 9,
                            decoration: InputDecoration(
                              isDense: true,
                              isCollapsed: true,
                              filled: true,
                              fillColor: Color(0xFF292A2C),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(14),
                              hintText:
                                  '${command[index].get(FirestoreConstantsCommand.description)}',
                              // 'description',
                              hintStyle: TextStyle(
                                  color: Color(0xFFA4A5A7),
                                  fontFamily: 'Inter',
                                  fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          listPlayer(listCommand),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            'Прошедшие игры',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          listPredGame1(),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Предстоящие игры',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          listPredGame2(),
                          SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              player ? requestInCommand() : null;
                            },
                            child: Text(
                              player ? "Заявка на вступление" : "Покинуть",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 77, 31, 0),
                              ),
                            ),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size.fromHeight(50)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color.fromARGB(255, 246, 188, 29)),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Text("${snapshot.error}");
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    "Загрузка...",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return Text('${snapshot.connectionState}');
              }
            }),
      ),
    );
  }

  Widget listPredGame1() {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF292A2C), borderRadius: BorderRadius.circular(8)),
      child: Scrollbar(
        controller: _scrollController,
        thickness: 3,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 10,
          padding: EdgeInsets.only(right: 16),
          clipBehavior: Clip.antiAlias,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Название игры',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Дата',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Активные в игре режимы',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Статус',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            if (10 != index) {
              return Column(
                children: [
                  PredGame1(),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            return PredGame1();
          },
        ),
      ),
    );
  }

  Widget PredGame1() {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsLastGame()),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Катка 1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '21.06.2024',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Аркада, Зомби',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listPredGame2() {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF292A2C), borderRadius: BorderRadius.circular(8)),
      child: Scrollbar(
        controller: _scrollController,
        thickness: 3,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: ListView.builder(
          itemCount: 10,
          controller: _scrollController,
          padding: EdgeInsets.only(right: 16),
          clipBehavior: Clip.antiAlias,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Название игры',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Дата',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Активные в игре режимы',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Статус',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            if (10 != index) {
              return Column(
                children: [
                  PredGame2(),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            return PredGame1();
          },
        ),
      ),
    );
  }

  Widget elemntListComandPlauer() {
    const stringList = ['Выгнать из команды', 'Сделать командиром'];
    String selectedMenu = '';
    final menu = [
      Text(
        stringList[0],
        style: TextStyle(
          color: Color(0xFF4D1F00),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        stringList[1],
        style: TextStyle(
          color: Color(0xFF4D1F00),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
      ),
    ];

    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const PersonalAccount()),
        // );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            alignment: Alignment.center,
            child: Text(
              'Ник участника',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 35,
            alignment: Alignment.center,
            // decoration: BoxDecoration(
            //   color: Color.fromARGB(255, 246, 188, 29),
            //   borderRadius: BorderRadius.circular(8),
            //   border: Border.all(
            //     width: 1,
            //     color: Color.fromARGB(255, 246, 188, 29),
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.stars,
                  color: Color.fromARGB(255, 246, 188, 29),
                ),
                Text(
                  ' рейтинг 100',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 10,
                ),
                MenuAnchor(
                  style: MenuStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFF6BD1D)),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 24, right: 24, top: 12, bottom: 12))),
                  builder: (BuildContext context, MenuController controller,
                      Widget? child) {
                    return IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      icon: Image.asset(
                        'assets/png/menu.png',
                        scale: 1.5,
                      ),
                      tooltip: 'Show menu',
                    );
                  },
                  menuChildren: menu,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget PredGame2() {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsUpcomingGame()),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Катка 1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '21.06.2024',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Аркада, Зомби',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listPlayer(List<dynamic> players) {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF292A2C), borderRadius: BorderRadius.circular(8)),
      child: Scrollbar(
        controller: _scrollController,
        thickness: 3,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: ListView.builder(
          itemCount: players.length,
          controller: _scrollController,
          padding: EdgeInsets.only(right: 16),
          clipBehavior: Clip.antiAlias,
          itemBuilder: (context, index) {
            return elementPlayer(players[index]);
          },
        ),
      ),
    );
  }

  Widget elementPlayer(String uid) {
    return FutureBuilder(
        future: userElementStream(uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      snapshot.data!.first.get(FirestoreConstants.nickname),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.stars,
                          color: Color.fromARGB(255, 246, 188, 29),
                        ),
                        Text(
                          ' рейтинг ${snapshot.data!.first.get(FirestoreConstants.rationgUser)}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('${snapshot.error}');
          }
        });
  }
}
