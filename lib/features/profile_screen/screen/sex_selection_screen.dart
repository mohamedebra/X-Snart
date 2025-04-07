import 'package:flutter/material.dart';

class SexSelectionScreen extends StatefulWidget {
  const SexSelectionScreen({super.key});

  @override
  _SexSelectionScreenState createState() => _SexSelectionScreenState();
}

class _SexSelectionScreenState extends State<SexSelectionScreen> {
  String selectedSex = "Male"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Sex'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Sex',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSexOption(
                icon: Icons.male,
                label: 'Male',
                isSelected: selectedSex == "Male",
                onTap: () {
                  setState(() {
                    selectedSex = "Male";
                  });
                },
              ),
              SizedBox(width: 40),
              _buildSexOption(
                icon: Icons.female,
                label: 'Female',
                isSelected: selectedSex == "Female",
                onTap: () {
                  setState(() {
                    selectedSex = "Female";
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Save the selected option
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Saved: $selectedSex"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "OK",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for creating sex option buttons
  Widget _buildSexOption({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: isSelected ? Colors.teal : Colors.grey[300],
            child: Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.teal : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}