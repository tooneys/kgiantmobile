import 'package:kgiantmobile/src/utils/formatter/formatter.dart';

class UserModel {
  /// common
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;
  /// company
  String companyCode;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.companyCode,
  });

  String get fullName => '$lastName $firstName';

  String get formatterPhoneNo => KFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        companyCode: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Firstname': firstName,
      'Lastname': lastName,
      'Username': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'CompanyCode': companyCode,
    };
  }

// factory UserModel.fromSnapShot(
//     DocumentSnapshot<Map<String, dynamic>> document) {
//   if (document.data() != null) {
//     final data = document.data()!;
//     return UserModel(
//         id: document.id,
//         firstName: data['Firstname'] ?? '',
//         lastName: data['Lastname'] ?? '',
//         userName: data['Username'] ?? '',
//         email: data['Email'] ?? '',
//         phoneNumber: data['PhoneNumber'] ?? '',
//         profilePicture: data['ProfilePicture'] ?? '');
//   }
// }
}
