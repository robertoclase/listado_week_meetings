import 'package:flutter/material.dart';
import '../models/meet_item.dart';
import '../widgets/detail_info_row.dart';

class DetailView extends StatelessWidget {
  final MeetItem meetItem;

  const DetailView({super.key, required this.meetItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meetItem.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            DetailInfoRow(label: 'Date:', value: meetItem.date),
            DetailInfoRow(label: 'Time:', value: meetItem.hours),
            DetailInfoRow(label: 'Type:', value: meetItem.type),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Joining ${meetItem.type}...'),
                  ),
                );
              },
              icon: const Icon(Icons.link),
              label: const Text('Join Meeting'),
            ),
          ],
        ),
      ),
    );
  }
}
