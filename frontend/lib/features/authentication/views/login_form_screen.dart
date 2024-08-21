import 'package:flutter/material.dart';
import 'package:frontend/constants/gaps.dart';
import 'package:frontend/constants/sizes.dart';
import 'package:frontend/features/authentication/views/widgets/form_button.dart';

class LoginFormScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  LoginFormScreen({Key? key}) : super(key: key);

  void _onSubmitTap(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Email: ${formData['email']}, Password: ${formData['password']}");
      // 여기에 서버로 로그인 요청하는 코드가 들어갈 수 있습니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gaps.v28,
              _buildEmailField(),
              Gaps.v16,
              _buildPasswordField(),
              Gaps.v28,
              GestureDetector(
                onTap: () => _onSubmitTap(context),
                child: FormButton(
                  disabled: false,
                  text: "Log in",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Please write your email";
        }
        return null;
      },
      onSaved: (newValue) {
        if (newValue != null) {
          formData['email'] = newValue;
        }
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Password',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Please write your password";
        }
        return null;
      },
      obscureText: true,
      onSaved: (newValue) {
        if (newValue != null) {
          formData['password'] = newValue;
        }
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onSubmitTap(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor, // 버튼 배경색 설정
        padding: const EdgeInsets.symmetric(vertical: 14),
        foregroundColor: Colors.white, // 버튼 텍스트 색상 설정
        textStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
      child: const Text('Log in'),
    );
  }
}
