// import 'package:http/http.dart' as http;
// import 'package:inicial/services/internet_service.dart';
//
//
// Future<String?> obtenerNoticias() async {
//
//     if (await checkInternet()) {
//       try {
//         // var url = Uri.parse('https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=paoBWTFRkhdgkmIlqhFzgLmtBVAHc2nl');
//         var url = Uri.parse('https://swapi.dev/api/');
//         var respuesta = await http.get(
//             url, headers: {'Content-Type': 'application/json'});
//         // print(respuesta.body);
//         return respuesta.body;
//       } catch (e) {
//         print(e);
//         return null;
//       }
//     }
//     return null;
// }