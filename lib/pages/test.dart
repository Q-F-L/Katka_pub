// TextButton(
//               style: ButtonStyle(
//                 elevation: MaterialStateProperty.all(0),
//                 padding:
//                     MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 4)),
//               ),
//               onPressed: () => showDialog<String>(
//                 context: context,
//                 builder: (BuildContext context) => new AlertDialog(
//                   backgroundColor: Color(0xFF292A2C),
//                   content: new Container(
//                     width: MediaQuery.of(context).size.width * 1,
//                     height: 112.0,
//                     decoration: new BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       borderRadius:
//                           new BorderRadius.all(new Radius.circular(8.0)),
//                     ),
//                     child: new Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: <Widget>[
//                         // dialog bottom
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Принять",
//                             style: TextStyle(
//                               fontFamily: "Inter",
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: Color.fromARGB(255, 77, 31, 0),
//                             ),
//                           ),
//                           style: ButtonStyle(
//                             minimumSize:
//                                 MaterialStateProperty.all(Size.fromHeight(50)),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                             backgroundColor: MaterialStateColor.resolveWith(
//                                 (states) => Color.fromARGB(255, 246, 188, 29)),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Отказать",
//                             style: TextStyle(
//                               fontFamily: "Inter",
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: Color.fromARGB(255, 77, 31, 0),
//                             ),
//                           ),
//                           style: ButtonStyle(
//                             minimumSize:
//                                 MaterialStateProperty.all(Size.fromHeight(50)),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                             backgroundColor: MaterialStateColor.resolveWith(
//                                 (states) => Color.fromARGB(255, 246, 188, 29)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               child: listElementComandRequest(context),
//             ),