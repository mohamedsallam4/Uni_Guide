String maskEmail(String email) {
  final parts = email.split("@");
  final name = parts[0];
  if (name.length <= 2) return email;
  return "${name.substring(0, 2)}***@${parts[1]}";
}