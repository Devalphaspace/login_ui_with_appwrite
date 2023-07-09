import 'package:appwrite_project/Constants/constants.dart';
import 'package:appwrite_project/Screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int usernameFormat = 2;
  int passwordFormat = 2;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/red_glitch.mp4')
          ..initialize().then((_) {
            setState(() {
              if (_videoPlayerController.value.isInitialized) {
                _videoPlayerController.play();
                _videoPlayerController.setLooping(true);
                _videoPlayerController.setPlaybackSpeed(0.5);
              }
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusManager.instance.primaryFocus!.unfocus();
        });
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(),
        child: Scaffold(
          backgroundColor: primaryBlack,
          body: Stack(
            alignment: Alignment.center,
            children: [
              _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: 0.45,
                      child: VideoPlayer(_videoPlayerController),
                    )
                  : Container(),
              Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Login to your account',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Choose from 130,000 online video courses with new additions published every second month',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.15),
                    TextFormField(
                      controller: usernameController,
                      showCursor: true,
                      onChanged: (value) {
                        setState(() {
                          if (value.contains(' ')) {
                            usernameFormat = 1;
                          } else if (value.contains('-')) {
                            usernameFormat = 1;
                          } else if (value.isEmpty) {
                            usernameFormat = 2;
                          } else {
                            usernameFormat = 0;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: secondaryGrey,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.25,
                            color: primaryPink,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: secondaryGrey,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.25,
                            color: secondaryGrey,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.25,
                            color: primaryPink,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        fillColor: primaryBlack,
                        filled: true,
                        errorText:
                            "Don't include spaces or '-' inside your user name",
                        errorStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: secondaryGrey,
                        ),
                        suffixIcon: usernameFormat == 2
                            ? Icon(
                                Icons.circle_outlined,
                                color: secondaryGrey,
                                size: 24,
                              )
                            : usernameFormat == 0
                                ? Icon(
                                    Icons.check_circle_rounded,
                                    color: primaryPink,
                                    size: 24,
                                  )
                                : usernameFormat == 1
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: secondaryGrey,
                                            size: 24,
                                          ),
                                          Icon(
                                            Icons.close,
                                            color: primaryBlack,
                                            size: 16,
                                          ),
                                        ],
                                      )
                                    : Icon(
                                        Icons.circle_outlined,
                                        color: secondaryGrey,
                                        size: 24,
                                      ),
                        labelText: 'Username',
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                      autocorrect: false,
                      style: GoogleFonts.poppins(
                        color: primaryPink,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      showCursor: true,
                      onChanged: (value) {
                        setState(() {
                          if (value.length >= 6) {
                            passwordFormat = 0;
                          } else if (value.length < 6) {
                            passwordFormat = 1;
                          } else if (value.isEmpty) {
                            passwordFormat = 2;
                          } else {
                            passwordFormat = 2;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: secondaryGrey,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.25,
                            color: primaryPink,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: secondaryGrey,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.25,
                            color: secondaryGrey,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.25,
                            color: primaryPink,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        filled: true,
                        fillColor: primaryBlack,
                        suffixIcon: passwordFormat == 2
                            ? Icon(
                                Icons.circle_outlined,
                                color: secondaryGrey,
                                size: 24,
                              )
                            : passwordFormat == 0
                                ? Icon(
                                    Icons.check_circle_rounded,
                                    color: primaryPink,
                                    size: 24,
                                  )
                                : passwordFormat == 1
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: secondaryGrey,
                                            size: 24,
                                          ),
                                          Icon(
                                            Icons.close,
                                            color: primaryBlack,
                                            size: 16,
                                          ),
                                        ],
                                      )
                                    : Icon(
                                        Icons.circle_outlined,
                                        color: secondaryGrey,
                                        size: 24,
                                      ),
                        labelText: 'Password',
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                      autocorrect: false,
                      style: GoogleFonts.poppins(
                        color: primaryPink,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          backgroundColor: primaryPink,
                          minimumSize: Size(Get.width * 0.8, 50)),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'OR',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(
                            color: primaryPink,
                            width: 1.5,
                          ),
                        ),
                        backgroundColor: primaryBlack,
                        minimumSize: Size(Get.width * 0.8, 50),
                        maximumSize: Size(Get.width * 0.8, 50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/google.svg',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Google',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(
                            color: primaryPink,
                            width: 1.5,
                          ),
                        ),
                        backgroundColor: primaryBlack,
                        minimumSize: Size(Get.width * 0.8, 50),
                        maximumSize: Size(Get.width * 0.8, 50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/apple.svg',
                            color: Colors.white,
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Apple',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Get.to(
                                () => const RegistrationScreen(),
                              );
                            });
                          },
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: primaryPink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: primaryBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
