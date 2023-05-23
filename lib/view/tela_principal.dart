import 'package:flutter/material.dart';
import '../components/customAppBar.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
            child: Text('Imagem representando API do google Maps',
             style: TextStyle(
              fontSize: 27,
              color: Colors.black,
             ),),
          ),
          SizedBox(
            height: 750,
            child: Image.asset(
              'assets/images/maps.png',
              scale: 1,
            ),
          ),
        ],
      ),
    );
  }
}
