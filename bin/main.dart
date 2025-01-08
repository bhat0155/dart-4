import "package:http/http.dart" as http;
import "dart:convert";

class User {
  final String firstName;
  final String lastName;
  final int id;
  User(this.firstName, this.lastName, this.id);

  void display() {
    print("The id ${id} belongs to ${firstName}, ${lastName}");
  }
}

void main(List<String> arguments) async {
  try {
    final usersJson = await http
        .get(Uri.parse("https://random-data-api.com/api/v2/users?size=8"));

    List<dynamic> users = await json.decode(usersJson.body);

    for (var user in users) {
      User randomUser = User(user["first_name"], user["last_name"], user["id"]);

      randomUser.display();
    }
  } catch (err) {
    print(err);
  }
}
