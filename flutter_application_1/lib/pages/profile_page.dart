import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Part
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // User Profile Picture
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your actual image asset
                    ),
                    SizedBox(height: 16),

                    // Display Name
                    Text(
                      'John Doe', // Replace with the user's display name
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),

                    // Streak
                    Text(
                      'Streak: 10 days', // Replace with actual streak information
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),

              // Cards Section
              buildCardWithTitle('Step Count'),
              buildCardWithTitle('Body Weight'),
              buildCardWithTitle('Sleep (Last Week)'),
              buildCardWithTitle('Workout/Week (Last 6 Months)'),
              buildCardWithTitle('PBs - Top 10 Exercises'),
              buildCardWithTitle('Friends Activity'),

              // Additional Cards (Replace with actual analytics)
              buildCardWithTitle('Card 1'),
              buildCardWithTitle('Card 2'),
              buildCardWithTitle('Card 3'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create cards with titles
  Widget buildCardWithTitle(String title) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Add your graph or health metric widgets here
          ],
        ),
      ),
    );
  }
}
