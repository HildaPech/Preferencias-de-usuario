import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';


class SettingsPage extends StatefulWidget {

static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool? _colorSecundario;
  int? _genero;
  String _nombre = 'Hilda';

  late TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController = new TextEditingController(text: prefs.nombreUsuario);
    
  }


  void _setSelectedRadio ( int? valor){
    prefs.genero=valor!;
    _genero = valor;
    setState(() {});
    
  }

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.purple.shade200 : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text('Settings', style: const TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),

        const Divider(),
        SwitchListTile(
          value: _colorSecundario!,
          title: const Text('Color secundario'),
          onChanged: (value){ 

            setState((){
              _colorSecundario = value;
              prefs.colorSecundario=value;
            });      
          },
        ),

        RadioListTile(
          value: 1,
          title: const Text('Masculino'),
          groupValue: _genero, 
          
          onChanged: _setSelectedRadio
         ),

         RadioListTile(
          value: 2,
          title: const Text('Femenino'),
          groupValue: _genero, 
          onChanged: _setSelectedRadio 
            
         ),

         const Divider(),

         Container(
           padding: const EdgeInsets.symmetric(horizontal: 20.0),
           child: TextField(
             controller: _textController,
             decoration: const InputDecoration(
               labelText: 'Nombre',
               helperText: 'Nombre de la persona usando el teléfono',
             ),

             onChanged: (value){
               prefs.nombreUsuario = value;
              },
           ),

         ),


        ],
      ),
    );
  }
}