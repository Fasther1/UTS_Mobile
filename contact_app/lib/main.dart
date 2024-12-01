import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListPage(),
    );
  }
}

class Contact {
  String firstName;
  String lastName;
  String email;
  String company;
  String phoneNumber;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.company,
    required this.phoneNumber,
  });
}

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  // Daftar kontak yang akan ditampilkan
  List<Contact> contacts = [];

  // Fungsi untuk menambah kontak baru
  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  // Fungsi untuk membuka layar untuk menambah kontak
  void _navigateToAddContactPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddContactPage()),
    );

    if (result != null) {
      _addContact(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            child: ListTile(
              title: Text('${contact.firstName} ${contact.lastName}'),
              subtitle: Text('Phone: ${contact.phoneNumber}\n'
                  'Email: ${contact.email}\n'
                  'Company: ${contact.company}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddContactPage,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _phoneController = TextEditingController();

  // Fungsi untuk menyimpan kontak dan kembali ke halaman sebelumnya
  void _saveContact() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final company = _companyController.text;
    final phone = _phoneController.text;

    if (firstName.isNotEmpty && lastName.isNotEmpty && phone.isNotEmpty) {
      final newContact = Contact(
        firstName: firstName,
        lastName: lastName,
        email: email,
        company: company,
        phoneNumber: phone,
      );
      Navigator.pop(context, newContact);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _companyController,
              decoration: InputDecoration(labelText: 'Company'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveContact,
              child: Text('Save Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
