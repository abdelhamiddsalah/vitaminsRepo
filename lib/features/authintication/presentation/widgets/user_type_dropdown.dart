import 'package:flutter/material.dart';

class UserTypeDropdown extends StatefulWidget {
  final Function(String) onUserTypeChanged;

  const UserTypeDropdown({super.key, required this.onUserTypeChanged});

  @override
  State<UserTypeDropdown> createState() => _UserTypeDropdownState();
}

class _UserTypeDropdownState extends State<UserTypeDropdown> {
  String userType = 'user'; // القيمة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white, // لون الخلفية
        border: Border.all(color: Colors.grey.shade400), // الإطار
        borderRadius: BorderRadius.circular(8.0), // الحواف المستديرة
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: userType,
          items: const [
            DropdownMenuItem(value: 'user', child: Text('user')),
            DropdownMenuItem(value: 'admin', child: Text('admin')),
          ],
          onChanged: (value) {
            setState(() {
              userType = value!;
            });
            widget.onUserTypeChanged(userType); // استدعاء الوظيفة المرسلة
          },
          isExpanded: true,
          dropdownColor: Colors.grey.shade200,
          elevation: 2,
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ),
      ),
    );
  }
}
