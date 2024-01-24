import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';
import 'package:katka/firebase/command/firestore_constans.dart';
import 'package:katka/firebase/user/firestore_constans.dart';
import 'package:katka/pages/admin/detailGame.dart';
import 'package:katka/pages/comand.dart';
import 'package:katka/pages/detailGame.dart';

class ListComands extends StatefulWidget {
  const ListComands({super.key});

  @override
  State<ListComands> createState() => _ListComands();
}

class _ListComands extends State<ListComands> {
  @override
  Widget build(BuildContext context) {
    String? commanderName;
    bool width = MediaQuery.of(context).size.width > 420;

    Future<List<DocumentSnapshot>> listCommandsStream() async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final QuerySnapshot result = await firebaseFirestore
          .collection(FirestoreConstantsCommand.pathCommandCollection)
          .get();

      return result.docs;
    }

    userStream(String uid, DocumentSnapshot data) async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final QuerySnapshot result = await firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .get();
      commanderName = result.docs
          .firstWhere((element) =>
              element.get(FirestoreConstants.uid) ==
              data.get(FirestoreConstantsCommand.commander))
          .get(FirestoreConstants.name)
          .toString();
      print(commanderName);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Color(0xFF292A2C),
        elevation: 0,
        child: Image.asset('assets/png/plus.png'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdminDetailGame()),
          );
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
        ),
        centerTitle: width ? true : false,
        title: Text(
          'Команды',
        ),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: FutureBuilder<List<DocumentSnapshot>>(
            future: listCommandsStream(), // Run check for a single queryRow
            builder: (context, snapshot) {
              print(snapshot.connectionState == ConnectionState.done);
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      userStream(
                          snapshot.data![index]
                              .get(FirestoreConstantsCommand.commander),
                          snapshot.data![index]);

                      print("List = ${commanderName}");

                      return Column(
                        children: [
                          ElementList(
                            snapshot.data![index]
                                .get(FirestoreConstantsCommand.rationgCommand),
                            snapshot.data![index]
                                .get(FirestoreConstantsCommand.nameCommander),
                            snapshot.data![index]
                                .get(FirestoreConstantsCommand.name),
                            snapshot.data![index]
                                .get(FirestoreConstantsCommand.city),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Divider(color: Colors.black),
                          SizedBox(
                            height: 4,
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Text('${snapshot.error}');
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

  Widget ElementList(
       [int? rating, String? commanderName, String? name, String? city,]) {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Comand()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${name ?? ''}',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${city ?? ''}',
                style: TextStyle(
                  color: Color.fromARGB(255, 164, 165, 167),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.stars,
                    color: Color.fromARGB(255, 246, 188, 29),
                  ),
                  Text(
                    '  рейтинг ${rating ?? '0'}',
                    style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xFFF6BD1D),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${commanderName ?? ''}',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFFA4A5A7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
