import 'dart:io';

Future<bool> checkInternet() async{
  try{
    var resultado = await InternetAddress.lookup("google.com");

    ///se agrega la segunda por si hay algun elemento nulo
    if(resultado.isEmpty && resultado[0].rawAddress.isEmpty){
      return false;
    }
    return true;
  } on SocketException catch (e) {
    return false;
  }
}