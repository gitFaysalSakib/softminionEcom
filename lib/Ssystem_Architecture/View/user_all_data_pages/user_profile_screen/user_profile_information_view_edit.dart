import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information'),
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name and Change Password Section
            _buildSectionRow(
              context: context,
              titleLeft: 'Full Name',
              valueRight: 'John Doe',
            ),
            Divider(
              thickness: .09,
            ),
            _buildSectionRow(
              context: context,
              titleLeft: 'Change Password',
              valueRight: '********',
            ),
            SizedBox(height: 16.0),
            // Change Mobile, Add Email, Gender, Birthday Section
            _buildSectionRow(
              context: context,
              titleLeft: 'Change Mobile',
              valueRight: '+123 456 7890',
            ),
            Divider(
              thickness: .09,
            ),
            _buildSectionRow(
              context: context,
              titleLeft: 'Add Email',
              valueRight: 'john.doe@example.com',
            ),
            Divider(
              thickness: .09,
            ),
            _buildSectionRow(
              context: context,
              titleLeft: 'Gender',
              valueRight: 'Male',
            ),
            Divider(
              thickness: .09,
            ),
            _buildSectionRow(
              context: context,
              titleLeft: 'Birthday',
              valueRight: '01 Jan 1990',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionRow({
    required BuildContext context,
    required String titleLeft,
    required String valueRight,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleLeft,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Text(
                valueRight,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 8.0),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  _showEditModalBottomSheet(context, titleLeft, valueRight);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showEditModalBottomSheet(
    BuildContext context,
    String title,
    String currentValue,
  ) {
    final TextEditingController _controller =
        TextEditingController(text: currentValue);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 300, // Set the height you want for the bottom sheet
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: Center(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter new value',
                    ),
                    autofocus: false, // Do not autofocus
                    readOnly: false, // Allows user to edit when tapped
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Set the button color to red
                ),
                onPressed: () {
                  // Handle the save action
                  Navigator.pop(context);
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
