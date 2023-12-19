import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/core/utils/size_utils.dart';
import 'package:apotik/features/dashboard/presentation/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 102.h,
                vertical: 25.v,
              ),
              decoration: BoxDecoration(
                color: ColorStyle.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20.v),
                  CustomImageView(
                    url:
                        "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1699287311~exp=1699287911~hmac=1c6639970625e2ee21955b2362408a38c124110dac65e5604aabc93a2b5fb2e1",
                    height: 70.adaptSize,
                    width: 70.adaptSize,
                    radius: BorderRadius.circular(
                      35.h,
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Text(
                    "M Tegar Putranto Hadi",
                    textAlign: TextAlign.center,
                    style: headlineStyleText().copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    "mtegarph@gmail.com",
                    style: titleStyleText().copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.v),
            listMenu("Edit Profile", () {}),
            listMenu("Edit Alamat", () {}),
            listMenu("FAQ", () {}),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomOutlineButton(
                  function: () {},
                  child: Text(
                    "Log Out",
                    style: headlineStyleText().copyWith(color: Colors.red),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

Widget listMenu(String name, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      title: Text(
        name,
        style: titleStyleText(),
      ),
      trailing: Icon(
        Icons.adaptive.arrow_forward,
        size: 17,
      ),
    ),
  );
}
