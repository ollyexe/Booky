import 'package:http/http.dart';

class Client_API {
  String host = "10.0.2.2";
  Future<String> cancelPrenotazione(
      String prof, String data,String subj, String time) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=annullaLezione&docente=$prof&data=$data&ora=$time&corso=$subj"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> concludiLezione(String prof, String subj,String data, String time) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=concludiLezione&docente=$prof&data=$data&ora=$time&corso=$subj"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> valuta(
      String prof, String data, String time,String subj, int stars) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?"
        "path=valutaLezione&docente=$prof&stelle=$stars&data=$data&ora=$time&corso=$subj"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> prenotaLezioni(
      String time, String date, String prof, String subj,String stud) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=prenotaLezione&docente=$prof&utente=$stud&data=$date&ora=$time&corso=$subj"));


    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLezioniFinite(String login) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=getLezioniFinite&mail=$login"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLezioniDaConfermare(String login) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=getLezioniDaConfermare&mail=$login"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getNextLezioniPrenotate(String login) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=getNextLezioniPrenotate&mail=$login"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getProfBySubj(String subject) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiUtente?path=getDocByCorso&corso=$subject"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getSubjectByDoc(String email) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiCorso?path=getCorsiByDoc&mail=$email"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLoginStatus(String email, String password) async {
    Response response = await get(
      Uri.parse(
          'http://$host:9999/apiUtente?path=login&mail=$email&pass=$password'),
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
          'http://$host:9999/apiUtente?path=getMiniUser&mail=$email'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLezioniLibere() async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=getLezioniLibere"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<String> getLBDoc(String email, String subject) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=getLezioniByDocenteAndCorso&docente=$email&corso=$subject"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getLexByDayAndUtente(
      String login, String year, String month, String day) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiLezione?path=getLezioneByUtenteAndByDay&mail=$login&data=$year-$month-$day"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getAllSubj() async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiCorso?path=getAllCorsi"));
    print(response.statusCode);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> getAllDocenti() async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiUtente?path=getAllDocenti"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<String> changePassword(String email, String new_password) async {
    Response response = await get(Uri.parse(
        "http://$host:9999/apiUtente?path=changePassword&mail=$email&pass=$new_password"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
