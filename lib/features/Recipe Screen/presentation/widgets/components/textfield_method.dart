import '../../../../../utils/exporter.dart';

TextFormField formTextfield(
    {TextEditingController? controller,
    IconData? icon,
    required label,
    String? Function(String?)? validator}) {
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(prefixIcon: Icon(icon), labelText: label),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '$label is required';
            }
            return null;
          });
}
