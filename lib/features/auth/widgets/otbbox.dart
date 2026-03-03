import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/core/styles/app_colors.dart';
import 'package:food_app/core/styles/app_text_styles.dart';

class OtpSection extends StatefulWidget {
  final Function(String)? onCompleted;

  const OtpSection({super.key, this.onCompleted});

  @override
  State<OtpSection> createState() => _OtpSectionState();
}

class _OtpSectionState extends State<OtpSection> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
      List.generate(4, (_) => FocusNode());

  int _secondsRemaining = 50;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining = 50;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel(); 
      }
    });
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
        _submitCode();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  void _submitCode() {
    String code = controllers.map((e) => e.text).join();
    if (code.length == 4) {
      widget.onCompleted?.call(code);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title + Resend + Timer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "CODE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkblackColor,
              ),
            ),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    _startTimer(); // يعيد العد بس
                  },
                  child: Text(
                    'Resend',
                    style: TextStyles.caption1.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkblackColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'in $_secondsRemaining sec',
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.darkblackColor,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// OTP Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            4,
            (index) => _otpBox(index),
          ),
        ),
      ],
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 62,
      height: 62,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) => _onChanged(value, index),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Color (0xffF0F5FA),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}