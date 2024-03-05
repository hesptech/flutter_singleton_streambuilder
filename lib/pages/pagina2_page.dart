import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/user/user_bloc.dart';
import '/models/user.dart';
//import '/bloc/utente/utente_cubit.dart';
//import '/models/utente.dart';



class Pagina2Page extends StatelessWidget {

  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final userBloc = BlocProvider.of<UserBloc>(context, listen: false );
  //final utenteCubit = context.read<UtenteCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                
                final newUser = User(
                //final newUser = Utente(
                  nombre: 'Fernando Herrera',
                  edad: 34,
                  profesiones: [
                    'FullStack Developer',
                    'Videojugador Veterano'
                  ]
                );

                // BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                userBloc.add( ActivateUser(newUser) );
                //utenteCubit.seleccionarUtente(newUser);
              },
              child: const Text('Establecer Utente', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add( ChangeUserAge(25) );
                //utenteCubit.cambiarEdad(30);
              },
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add( AddProfession('Nueva Profesión') );
                //utenteCubit.agregarProfesion();
              },
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
            ),

          ],
        )
     ),
   );
  }

}