import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomBoxPicker extends StatelessWidget {
  CustomBoxPicker({
    Key? key,
    required this.onTap,
    this.photo,
    this.label,
    this.hint,
    this.icon,
    this.child,
  }) : super(key: key);

  XFile? photo;
  String? label;
  String? hint;
  Function() onTap;
  Widget? child;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? "",
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey[400]!,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                        blurRadius: 1,
                      ),
                    ]),
                child: child != null
                    ? Center(
                        child: child,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Visibility(visible: icon != null, child: icon!),
                            const SizedBox(height: 12),
                            Text(hint ?? "")
                          ]))
          ],
        ));
  }
}
