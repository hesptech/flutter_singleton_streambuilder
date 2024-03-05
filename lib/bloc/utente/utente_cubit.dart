import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '/models/utente.dart';

part 'utente_state.dart';

class UtenteCubit extends Cubit<UtenteState> {

  UtenteCubit() : super(UtenteInitial());

  void seleccionarUtente( Utente user ) {
    emit( UtenteActivo(user) );
  }

  void cambiarEdad( int edad ) {

    final currentState = state;
    if ( currentState is UtenteActivo ) {
      final newUser = currentState.utente.copyWith( edad: 30 );
      emit( UtenteActivo( newUser ) );
    }

  }

  void agregarProfesion() {
    
    final currentState = state;
    if ( currentState is UtenteActivo ) {
      // currentState.utente
      final newProfesiones = [
        ...currentState.utente.profesiones,
        'Profesión ${ currentState.utente.profesiones.length + 1 }'
      ];
      final newUser = currentState.utente.copyWith( profesiones: newProfesiones );
      emit( UtenteActivo(newUser) );
    }
  }

  void borrarUtente() {
    emit(UtenteInitial());
  }
}
