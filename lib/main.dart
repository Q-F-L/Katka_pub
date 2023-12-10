import 'package:flutter/material.dart';
import 'package:katka/pages/auth.dart';
import 'package:katka/pages/comand.dart';
import 'package:katka/pages/comandRequest.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/listGame.dart';
import 'package:katka/pages/listTeams.dart';
import 'package:katka/pages/personal_account.dart';
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
      home: DetailsLastGame(),
    );
  }
}
