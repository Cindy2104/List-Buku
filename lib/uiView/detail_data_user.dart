import 'package:flutter/material.dart';
import '../model/model_data_user.dart';

class DetailDataUserPage extends StatelessWidget {
  final DataUser user;

  const DetailDataUserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Image.network(
                  user.avatar ?? "",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.email ?? '_',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}
