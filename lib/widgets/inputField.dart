//این فایل برای ویجت های ورودی ها است
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//مجیدی : این ویجت برای سرچ بار است
class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value) onChanged;
  const SearchBar({Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 39,
        child: TextField(
          controller: this.controller,
          onChanged: this.onChanged,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset('images/icons/home/search.svg'),
            ),
            filled: true,
            fillColor: const Color(0xFFEBEBEB),
            hintText: 'جستجو',
            hintStyle: const TextStyle(
              fontSize: 15.0,
              color: Color(0xFF7D7D7D),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 0.0),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 0.0),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
