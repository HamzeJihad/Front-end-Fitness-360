import 'package:flutter/material.dart';

import 'package:fitness_360/models/text_field_default.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Meu Perfil', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Text('J'),
                ),
                title: Text('Jacson Rodrigues'),
                subtitle: Text('Arquitetura de software'),
              ),
              TextFieldTwoItens(
                  icon: const Icon(Icons.person, color: Colors.blueGrey),
                  text: 'Editar dados',
                  onPressed: () {
                  }),

              TextFieldTwoItens(
                  icon: const Icon(Icons.inventory_outlined, color: Colors.blueGrey),
                  text: 'Convidar Amigos',
                  onPressed: () {
                
                  }),

              TextFieldTwoItens(
                  icon: const Icon(Icons.book_outlined, color: Colors.blueGrey),
                  text: 'Termos de uso',
                  onPressed: () {
                  }),

              TextFieldTwoItens(
                  icon: const Icon(Icons.policy_outlined, color: Colors.blueGrey),
                  text: 'Política de privacidade',
                  onPressed: () {
                  }),

              TextFieldTwoItens(
                  icon: const Icon(Icons.exit_to_app, color: Colors.blueGrey),
                  text: 'Sair',
                  onPressed: () {
                  }),


                
                  
            ],
          ),
        ),
      ),
    );
  }
}
