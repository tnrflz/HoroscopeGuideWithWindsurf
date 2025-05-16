import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/horoscope_model.dart';
import '../providers/horoscope_provider.dart';

class HoroscopeDetailScreen extends StatelessWidget {
  final Horoscope horoscope;

  const HoroscopeDetailScreen({super.key, required this.horoscope});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(horoscope.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  horoscope.symbol,
                  style: const TextStyle(fontSize: 100, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 20),
              _buildDetailCard('Description', horoscope.description),
              const SizedBox(height: 10),
              _buildDetailCard('Date Range', horoscope.dateRange),
              const SizedBox(height: 10),
              _buildDetailCard('Element', horoscope.element),
              const SizedBox(height: 10),
              _buildCompatibilityCard(context),
              const SizedBox(height: 10),
              _buildDailyHoroscopeCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String content) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompatibilityCard(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Compatibility',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: horoscope.compatibility.map((sign) {
                return Chip(
                  label: Text(sign),
                  backgroundColor: Colors.deepPurple.shade50,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyHoroscopeCard(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Horoscope',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<String>(
              future: Provider.of<HoroscopeProvider>(context)
                  .getDailyHoroscope(horoscope.name),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Text(
                  snapshot.data ?? 'Unable to fetch daily horoscope',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
