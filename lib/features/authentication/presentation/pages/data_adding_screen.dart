import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jioyathri/core/util/snackbar_helper.dart';
import 'package:uuid/uuid.dart';

class DataAddingScreen extends StatelessWidget {
  const DataAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String> addDatatodb() async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference services = firestore.collection('services');
      final List<Map<String, dynamic>> sampleServices = [
        {
          "id": Uuid().v4(),
          "name": "Pipe Leak Repair",
          "category": "Home Services",
          "description":
              "Professional fixing of leaking pipes, faucets, and drainage issues.",
          "basePrice": 500,
          "image": "https://example.com/images/plumbing.jpg",
          "duration": 60,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
        {
          "id": Uuid().v4(),
          "name": "Switchboard Installation",
          "category": "Repairs",
          "description":
              "Safe and certified electrical switchboard setup and wiring.",
          "basePrice": 800,
          "image": "https://example.com/images/electrician.jpg",
          "duration": 90,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
        {
          "id": Uuid().v4(),
          "name": "Deep Home Cleaning",
          "category": "Home Services",
          "description":
              "Full-house deep cleaning including kitchen, bathrooms, and floors.",
          "basePrice": 1200,
          "image": "https://example.com/images/cleaning.jpg",
          "duration": 180,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
        {
          "id": Uuid().v4(),
          "name": "Haircut & Styling (Men)",
          "category": "Beauty",
          "description":
              "Professional haircut, beard trim, and styling for men.",
          "basePrice": 300,
          "image": "https://example.com/images/haircut.jpg",
          "duration": 45,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
        {
          "id": Uuid().v4(),
          "name": "AC Servicing",
          "category": "Repairs",
          "description": "Complete AC cleaning, gas refill, and maintenance.",
          "basePrice": 1000,
          "image": "https://example.com/images/ac-repair.jpg",
          "duration": 120,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
        {
          "id": Uuid().v4(),
          "name": "Cockroach & Ant Control",
          "category": "Home Services",
          "description":
              "Chemical treatment for cockroaches, ants, and other pests.",
          "basePrice": 600,
          "image": "https://example.com/images/pest-control.jpg",
          "duration": 60,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
        {
          "id": Uuid().v4(),
          "name": "Premium Car Wash",
          "category": "Automotive",
          "description": "Full exterior and interior cleaning with polish.",
          "basePrice": 500,
          "image": "https://example.com/images/car-wash.jpg",
          "duration": 60,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
        {
          "id": Uuid().v4(),
          "name": "Fitness Training (1 Session)",
          "category": "Health & Wellness",
          "description":
              "Customized workout sessions with a certified trainer.",
          "basePrice": 800,
          "image": "https://example.com/images/personal-trainer.jpg",
          "duration": 60,
          "isActive": true,
          "createdAt": FieldValue.serverTimestamp(),
        },
      ];

      // Add all services to Firestore
      try {
        for (final service in sampleServices) {
          await services.add(service);
        }
        return "All services added successfully!";
      } catch (e) {
        return "Error adding services: $e";
      }
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final response = await addDatatodb();
            showTopSnackbar(context, response, 'success');
          },
          child: Text('Add Collection', style: TextStyle(color: Colors.amber)),
        ),
      ),
    );
  }
}
