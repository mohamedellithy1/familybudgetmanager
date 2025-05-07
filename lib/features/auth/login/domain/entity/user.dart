class UserEntity{
  final String id;
  final String? name;
  final String email;
  final String phone;

  UserEntity({
    required this.id,
     this.name,
    required this.email,
    required this.phone,
  });
}