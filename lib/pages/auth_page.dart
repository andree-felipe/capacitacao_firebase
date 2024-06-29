import 'package:capacitacao_firebase/componentes/auth_form.dart';
import 'package:flutter/material.dart';

import '../core/models/auth_form_data.dart';
import '../core/services/auth/auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;
  
  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if(formData.isLogin) {
        // Login
        await AuthService().login(formData.email, formData.password);
      }
      else {
        await AuthService().signup(formData.name, formData.email, formData.password, formData.image);
      }
    }
    catch (error){
      // Tratar Erro
    }
    finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handleSubmit,),
            ),
          ),
          if(_isLoading)
            // ignore: avoid_unnecessary_containers
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ], 
      ),
    );
  }
}