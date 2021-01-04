class ContactUs {
  final String enquiry;
  final String name;
  final String email;
  final String quiery;

  ContactUs(
    this.enquiry,
    this.name,
    this.email,
    this.quiery,
  );

  Map<String, dynamic> addContact() {
    return {
      'enquiry': enquiry,
      'name': name,
      'email': email,
      'quiery': quiery,
    };
  }
}
