class Utente {
  
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Utente({ required this.nombre, required this.edad, required this.profesiones });


  Utente copyWith({ 
    String? nombre, 
    int? edad, 
    List<String>? profesiones 
  }) =>
    Utente(
    nombre: nombre ?? this.nombre,
    edad  : edad ?? this.edad,
    profesiones: profesiones ?? this.profesiones,
  );


}