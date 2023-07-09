import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../Credentials/credentials.dart';


Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject(projectID.toString())
    .setSelfSigned(status: true);

Account account = Account(client);

Future<User> createAccount(
    String email, String password, String name, Client client) async {
  final user = await account.create(
    userId: ID.unique(),
    email: email,
    password: password,
    name: name,
  );
  return user;
}
