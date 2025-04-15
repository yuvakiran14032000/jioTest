import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jioyathri/config/routes/approutes.dart';
import 'package:jioyathri/features/authentication/presentation/provider/auth_provider.dart';
import 'package:jioyathri/features/authentication/presentation/provider/services_provider.dart';
import 'package:jioyathri/service_locator.dart';
import 'package:provider/provider.dart';

class CustomerProfileSetup extends StatefulWidget {
  @override
  _CustomerProfileSetupState createState() => _CustomerProfileSetupState();
}

class _CustomerProfileSetupState extends State<CustomerProfileSetup> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _name;
  String? _phone;
  String? _email;
  String? _profileImageUrl;
  List<String> _preferredCategories = [];
  String? _selectedGender;
  DateTime? _selectedDate;

  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  Future<void> _submitProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await _firestore
          .collection('users')
          .doc(getIt<AuthProvider>().user!.id)
          .set({
            'name': _name,
            'email': _email,
            'phone': _phone,
            'addresses': {
              'addressLine1': _addressLine1Controller.text,
              'addressLine2': _addressLine2Controller.text,
              'city': _cityController.text,
              'state': _stateController.text,
              'pincode': _zipCodeController.text,
            },
            'isVerified': true,
            'profilePic': '',
            'createdAt': FieldValue.serverTimestamp(),
            'updatedAt': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));
      Navigator.pushReplacementNamed(context, AppRouter.servicesRoute);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Upload to Firebase Storage and get URL
      // _profileImageUrl = await uploadImageToFirebase(pickedFile);
      setState(() {});
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.tertiary,
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              onSurface: Theme.of(context).colorScheme.onSurface,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final serviceprovider = Provider.of<ServicesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Your Profile',
          style: theme.appBarTheme.titleTextStyle,
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: theme.appBarTheme.iconTheme,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: theme.colorScheme.secondary,
                    backgroundImage:
                        _profileImageUrl != null
                            ? NetworkImage(_profileImageUrl!)
                            : null,
                    child:
                        _profileImageUrl == null
                            ? Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: theme.colorScheme.onPrimary,
                            )
                            : null,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Personal Information',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                style: TextStyle(color: theme.colorScheme.onSurface),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _name = value,
                initialValue: authProvider.user!.fullname,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                style: TextStyle(color: theme.colorScheme.onSurface),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _phone = value,
                initialValue: authProvider.user!.phone,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                style: TextStyle(color: theme.colorScheme.onSurface),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => _email = value,
                initialValue: authProvider.user!.email,
              ),

              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                value: _selectedGender,
                items:
                    <String>[
                      'Male',
                      'Female',
                      'Other',
                      'Prefer not to say',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: theme.colorScheme.onSurface),
                        ),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                validator:
                    (value) => value == null ? 'Please select gender' : null,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: theme.colorScheme.onSurface.withAlpha(
                          (255 * 0.6).toInt(),
                        ),
                      ),
                    ),
                    controller: TextEditingController(
                      text:
                          _selectedDate != null
                              ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                              : '',
                    ),
                    validator:
                        (value) =>
                            _selectedDate == null ? 'Please select date' : null,
                  ),
                ),
              ),

              SizedBox(height: 24),
              Text(
                'Address Information',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _addressLine1Controller,
                decoration: InputDecoration(
                  labelText: 'Address Line 1',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _addressLine2Controller,
                decoration: InputDecoration(
                  labelText: 'Address Line 2',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _zipCodeController,
                decoration: InputDecoration(
                  labelText: 'ZIP Code',
                  labelStyle: TextStyle(color: theme.colorScheme.onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              // SizedBox(height: 24),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.tertiary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Save Profile',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
