import 'package:http/http.dart';

class Client_API {
  String host = "192.168.1.23";
  Future<String> getLezioniDaConfermare(String login) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=getLezioniDaConfermare&mail=$login"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLezioniFinite(String login) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=getLezioniFinite&mail=$login"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> cancelPrenotazione(
      String prof, String data, String time) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=annullaLezione&docente=$prof&data=$data&ora=$time"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> concludiLezione(String prof, String data, String time) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=concludiLezione&docente=$prof&data=$data&ora=$time"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> valuta(
      String prof, String data, String time, int stars) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?"
        "path=valutaLezione&docente=$prof&stelle=$stars&data=$data&ora=$time"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getNextLezioniPrenotate(String login) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=getNextLezioniPrenotate&mail=$login"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getProfBySubj(String subject) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiUtente?path=getDocByCorso&corso=$subject"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getSubjectByDoc(String email) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiCorso?path=getCorsiByDoc&mail=$email"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLoginStatus(String email, String password) async {
    Response response = await get(
      Uri.parse(
          'http://$host:9999/servlet_war_exploded/apiUtente?path=login&mail=$email&pass=$password'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getUser(String email) async {
    Response response = await get(
      Uri.parse(
          'http://$host:9999/servlet_war_exploded/apiUtente?path=getMiniUser&mail=$email'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLezioniLibere() async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=getLezioniLibere"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> prenotaLezioni(
      String time, String date, String prof, String stud) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=prenotaLezione&docente=$prof&utente=$stud&data=$date&ora=$time"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLBDoc(String email, String subject) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=getLezioniByDocenteAndCorso&docente=$email&corso=$subject"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLexByDayAndUtente(
      String login, String year, String month, String day) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiLezione?path=getLezioneByUtenteAndByDay&mail=$login&data=$year-$month-$day"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getAllSubj() async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiCorso?path=getAllCorsi"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getAllDocenti() async {
    Response response = await get(Uri.parse(
        "http://$host:9999/servlet_war_exploded/apiUtente?path=getAllDocenti"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
