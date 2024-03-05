import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/user/user_bloc.dart';
import '/models/user.dart';
//import '/bloc/utente/utente_cubit.dart';
//import '/models/utente.dart';


class Pagina1Page extends StatelessWidget {

  const Pagina1Page({Key? key}) : super(key: key);
  //const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon( Icons.delete_outline ),
            onPressed: (){
              BlocProvider.of<UserBloc>(context, listen: false )
                .add(DeleteUser());
            },
            //icon: const Icon( Icons.exit_to_app ), 
            //onPressed: () => context.read<UtenteCubit>().borrarUtente() 
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: ( _ , state) {          

          return state.existUser
            ? InformacionUsuario( user: state.user! )
            : const Center(
              child: Text('No hay usuario seleccionado'),
            );
    
        },
      ),      
      //body: const BodyScaffold(),

     floatingActionButton: FloatingActionButton(
       child: const Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final User user;
  
  const InformacionUsuario({
    Key? key, 
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ListTile( title: Text('Nombre: ${ user.nombre }') ),
          ListTile( title: Text('Edad: ${ user.edad }') ),

          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ...user.profesiones.map( 
            (prof) => ListTile( title: Text(prof) )
          ).toList()

        ],
      ),
    );
  }

}

/* class BodyScaffold extends StatelessWidget {
  const BodyScaffold({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UtenteCubit, UtenteState>(
      builder: ( _ , state) {

        switch ( state.runtimeType ) {
          
          case UtenteInitial:
            return const Center(child: Text('No hay información del Utente'));

          case UtenteActivo:
            return InformacionUtente( (state as UtenteActivo).utente );

          default:
            return const Center( child: Text('Estado no reconocido '));
        }

        // if ( state is UtenteInitial ) {
        //   return Center(child: Text('No hay información del Utente'));
        // } else if( state is UtenteActivo ) {
        //   return InformacionUtente( state.Utente );
        // } else {
        //   return Center( child: Text('Estado no reconocido '));
        // }

    });
  }
}


class InformacionUtente extends StatelessWidget {

  final Utente utente;

  const InformacionUtente( this.utente, {super.key} );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ListTile( title: Text('Nombre: ${ utente.nombre }') ),
          ListTile( title: Text('Edad: ${ utente.edad }') ), 

          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),


          ...utente.profesiones.map(
            (profesion) => ListTile( title: Text( profesion ))
          ).toList()
          

        ],
      ),
    );
  }

} */