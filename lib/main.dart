import 'package:flutter/material.dart';
import 'package:katka/pages/activeGame.dart';
import 'package:katka/pages/admin/activeGame.dart';
import 'package:katka/pages/admin/createMap/createPointBatlle.dart';
import 'package:katka/pages/admin/createMap/createPointInterest.dart';
import 'package:katka/pages/admin/createMap/createRounds.dart';
import 'package:katka/pages/admin/createMap/createRoundsFix.dart';
import 'package:katka/pages/admin/createNewAdmin.dart';
import 'package:katka/pages/admin/detailAdmin.dart';
import 'package:katka/pages/admin/detailGame.dart';
import 'package:katka/pages/admin/detailPlayer.dart';
import 'package:katka/pages/admin/listAdmins.dart';
import 'package:katka/pages/admin/listComand.dart';
import 'package:katka/pages/admin/listGames.dart';
import 'package:katka/pages/admin/listPlayer.dart';
import 'package:katka/pages/admin/listRound.dart';
import 'package:katka/pages/admin/logs.dart';
import 'package:katka/pages/admin/qrCodeDownload.dart';
import 'package:katka/pages/admin/requestGame.dart';
import 'package:katka/pages/logs.dart';
import 'package:katka/pages/admin/menu.dart';
import 'package:katka/pages/auth.dart';
import 'package:katka/pages/comand.dart';
import 'package:katka/pages/comandCommander.dart';
import 'package:katka/pages/comandRequest.dart';
import 'package:katka/pages/createComand.dart';
import 'package:katka/pages/detailGame.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';
import 'package:katka/pages/editUser.dart';
import 'package:katka/pages/listGame.dart';
import 'package:katka/pages/listTeams.dart';
import 'package:katka/pages/personal_account.dart';
import 'package:katka/pages/qrCodeRead.dart';
import 'package:katka/pages/signIn.dart';
import 'package:katka/pages/signOut.dart';
import 'package:katka/pages/signOut.dart';
import '../themes/theme.dart';

import 'components/src/map/map_screen.dart';

void main() {
  runApp(const Katka());
}

class Katka extends StatelessWidget {
  const Katka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: AdminMenu(),
    );
  }
}
