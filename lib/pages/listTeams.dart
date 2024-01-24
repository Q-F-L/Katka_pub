import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';
import 'package:katka/firebase/command/firestore_constans.dart';
import 'package:katka/firebase/user/firestore_constans.dart';
import 'package:katka/global_value.dart';
import 'package:katka/pages/admin/detailGame.dart';
import 'package:katka/pages/comand.dart';
import 'package:katka/pages/detailGame.dart';

class ListTeams extends StatefulWidget {
  const ListTeams({super.key});

  @override
  State<ListTeams> createState() => _ListTeams();
}

class _ListTeams extends State<ListTeams> {
  @override
  Widget build(BuildContext context) {
    String? commanderName;

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/account');
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.keyboard_arrow_left,
        //     size: 35,
        //   ),
        // ),
        title: Text('Список команд'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: FutureBuilder<List<DocumentSnapshot>>(
            future: listCommandsStream(), // Run check for a single queryRow
            builder: (context, snapshot) {
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
                                .get(FirestoreConstantsCommand.listPlayers),
                            snapshot.data![index]
                                .get(FirestoreConstantsCommand.id),
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
    List<dynamic> array,
    int id, [
    String? name,
    String? city,
  ]) {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        commandGlobal.id = id;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Comand()),
        );
      },
      child: Row(
        children: [
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${name ?? ''}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
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
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Text(
              '${array.length + 1}',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
