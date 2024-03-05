part of 'utente_cubit.dart';

@immutable
sealed class UtenteState {}

final class UtenteInitial extends UtenteState {
  final existeUtente = false;
}

class UtenteActivo extends UtenteState {
  final existeUtente = true;
  final Utente utente;

  UtenteActivo(this.utente);

}
