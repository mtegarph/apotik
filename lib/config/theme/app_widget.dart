import 'package:apotik/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  IconData _iconData = Icons.visibility_off;
  bool data = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: titleStyleText().copyWith(fontSize: 10),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[300],
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 10),
        suffixIcon: widget.obscureText == false
            ? const SizedBox.shrink()
            : IconButton(
                iconSize: 16.0,
                icon: Icon(_iconData),
                onPressed: () {
                  setState(() {
                    data = !data;
                    if (data) {
                      _iconData = Icons.visibility_off;
                    } else {
                      _iconData = Icons.visibility;
                    }
                  });
                },
              ),
      ),
      controller: widget.controller,
      obscureText: data,
    );
  }
}

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback function;
  const CustomButton({super.key, required this.function, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyle.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: function,
        child: Center(child: child));
  }
}

class CustomOutlineButton extends StatelessWidget {
  final Widget child;
  final VoidCallback function;
  const CustomOutlineButton(
      {super.key, required this.function, required this.child});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: ColorStyle.whiteColor,
          side: BorderSide(color: ColorStyle.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: function,
        child: Center(child: child));
  }
}

Widget appBar(BuildContext context) {
  return SizedBox(
    //height: 500, // Adjust this height as needed
    width: MediaQuery.of(context).size.width,
    child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 108,
          decoration: const BoxDecoration(color: Colors.white),
        ),
        const Positioned(
          left: 24,
          top: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FoodMarket',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Let’s get some foods',
                style: TextStyle(
                  color: Color(0xFF8D92A3),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 24, // Adjust positioning as needed
          top: 30,
          child: Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              color: const Color(0xFFC4C4C4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Image.network(
              "https://via.placeholder.com/50x50",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}
