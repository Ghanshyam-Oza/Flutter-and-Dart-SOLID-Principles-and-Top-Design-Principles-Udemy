class User {
  late final String _firstName;
  late final String _lastName;
  int? _age;
  String? _phoneNumber;
  String? _address;
  late final String _emailAddress;

  String get firstName => _firstName;
  String get lastName => _lastName;
  int get age => _age ?? 0;
  String get phoneNumber => _phoneNumber ?? '';
  String get address => _address ?? '';
  String get emailAddress => _emailAddress;

  setFirstName(String fname) {
    _firstName = fname;
  }

  setLastName(String lName) {
    _lastName = lName;
  }

  setAge(int age) {
    _age = age;
  }

  setPhoneNumber(String phoneNum) {
    _phoneNumber = phoneNum;
  }

  setAddress(String addr) {
    _address = addr;
  }

  setEmailAddress(String email) {
    _emailAddress = email;
  }

  @override
  String toString() {
    return "User name: $_firstName $_lastName,\nEmail Address: $_emailAddress,\nAge: $_age,\nPhone Number: $phoneNumber,\nAddress: $_address";
  }
}

class UserBuilder {
  late User user;

  buildUser(firstName, lastName, int? age, String? phoneNumber, String? address,
      email) {
    user.setFirstName(firstName);
    user.setLastName(lastName);
    if (age != null) {
      user.setAge(age);
    }
    if (phoneNumber != null) {
      user.setPhoneNumber(phoneNumber);
    }
    if (address != null) {
      user.setAddress(address);
    }
    user.setEmailAddress(email);
  }

  getUser() {
    return user.toString();
  }
}
