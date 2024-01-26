import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/parameter/register.dart';
// import 'package:apotik/core/parameter/parameter.dart';
// import 'package:apotik/features/dashboard/presentation/pages/dashboard_page.dart';

import 'package:apotik/features/login/presentation/bloc/get_login/login_bloc.dart';
import 'package:apotik/features/login/presentation/bloc/post_login/post_login_bloc.dart';
import 'package:apotik/features/login/presentation/bloc/post_register/post_register_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController passwordConfirm = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController alamat = TextEditingController();
    TextEditingController noHp = TextEditingController();
    TextEditingController nama = TextEditingController();
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is LoginLoaded) {
            email.text = state.loginEntity.email;
            password.text = state.loginEntity.fullname;
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(40),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: Urls.imageUrl,
                              errorWidget: (context, url, error) {
                                return Text(error.toString());
                              },
                              height: 200,
                            ),
                          ),
                        ),
                        const Gap(20),
                        Center(
                          child: Text(
                            "Selamat Datang \nDi ApotekQU",
                            style: headlineStyleText()
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Gap(50),
                        Text(
                          "Username",
                          style: titleStyleText(),
                        ),
                        const Gap(10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 45,
                            child: CustomTextField(
                                hintText: "Username", controller: username)),
                        const Gap(10),
                        Text(
                          "Nama Lengkap",
                          style: titleStyleText(),
                        ),
                        const Gap(10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 45,
                            child: CustomTextField(
                                hintText: "Nama Lengkap", controller: nama)),
                        const Gap(10),
                        Text(
                          "Email",
                          style: titleStyleText(),
                        ),
                        const Gap(10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 45,
                            child: CustomTextField(
                              hintText: "email",
                              controller: email,
                              obscureText: false,
                            )),
                        const Gap(10),
                        Text(
                          "Nomor Telepon",
                          style: titleStyleText(),
                        ),
                        const Gap(10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 45,
                            child: CustomTextField(
                              hintText: "Nomor Telepon",
                              controller: noHp,
                              obscureText: false,
                            )),
                        const Gap(10),
                        Text(
                          "Alamat",
                          style: titleStyleText(),
                        ),
                        const Gap(10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 45,
                            child: CustomTextField(
                                hintText: "Alamat", controller: alamat)),
                        const Gap(10),
                        Text(
                          "Password",
                          style: titleStyleText(),
                        ),
                        const Gap(10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 45,
                            child: CustomTextField(
                              hintText: "Password",
                              controller: password,
                              obscureText: true,
                            )),
                        const Gap(10),
                        Text(
                          "Konfirmasi Password",
                          style: titleStyleText(),
                        ),
                        const Gap(10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 45,
                            child: CustomTextField(
                              hintText: "konfirmasi Password Anda",
                              controller: passwordConfirm,
                              obscureText: true,
                            )),
                        const Gap(50),
                        BlocConsumer<PostRegisterBloc, PostRegisterState>(
                          listener: (context, state) {
                            if (state is RegisterPostSuccess) {
                              Navigator.pop(context);
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const DashboardPage(),
                              //     ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(state.message),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Center(
                              child: CustomButton(
                                  function: () {
                                    // ParameterUpdate parameterUpdate =
                                    //     ParameterUpdate(
                                    //         name: email.text,
                                    //         password: password.text);
                                    // context.read<PostLoginBloc>().add(PostLogin(
                                    //     parameterUpdate: parameterUpdate));
                                    ParameterRegister parameterRegister =
                                        ParameterRegister(
                                            name: nama.text,
                                            password: password.text,
                                            noHp: noHp.text,
                                            email: email.text,
                                            alamat: alamat.text,
                                            username: username.text);
                                    context.read<PostRegisterBloc>().add(
                                        PostRegister(
                                            parameterUpdate:
                                                parameterRegister));
                                  },
                                  child: (state is RegisterPostLoading)
                                      ? const CupertinoActivityIndicator()
                                      : Text(
                                          "Daftar Sekarang",
                                          style: titleStyleText()
                                              .copyWith(color: Colors.white),
                                        )),
                            );
                          },
                        ),
                        Gap(
                          MediaQuery.of(context).size.height / 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is LoginFailed) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
