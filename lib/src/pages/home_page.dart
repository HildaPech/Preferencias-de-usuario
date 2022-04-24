import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_prefs/preferencias_usuario.dart';

import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';


class HomePage extends StatelessWidget {

static final String routeName = 'home';
final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.purple.shade200 : Colors.blue,
      ),
      drawer:MenuWidget(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),

          Text('Género: ${prefs.genero}'),
          Divider(),

          Text('Nombre usuario:  ${prefs.nombreUsuario}'),
          Divider()
        ],
      ),
    );
  }

}