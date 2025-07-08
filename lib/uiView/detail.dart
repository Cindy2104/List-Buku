import 'package:flutter/material.dart';
import 'package:client_server_flutter/model/model_user.dart';

class PageDetailUser extends StatelessWidget {
  final ModelUser user;

  const PageDetailUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'Detail User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Phone: ${user.phone}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Website: ${user.website}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),

            Text('Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Divider(),
            Text('Street: ${user.address.street}'),
            Text('Suite: ${user.address.suite}'),
            Text('City: ${user.address.city}'),
            Text('Zipcode: ${user.address.zipcode}'),
            Text('Geo: (${user.address.geo.lat}, ${user.address.geo.lng})'),
            SizedBox(height: 16),

            Text('Company', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Divider(),
            Text('Name: ${user.company.name}'),
            Text('Catch Phrase: ${user.company.catchPhrase}'),
            Text('BS: ${user.company.bs}'),
          ],
        ),
      ),
    );
  }
}
