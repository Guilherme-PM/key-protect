import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future<void> signInWithEmailPassword() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login com sucesso!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao fazer login: $e')),
        );
      }
    }

    Future<void> signInWithGoogle() async {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);
    }

    Future<void> signInWithApple() async {
      // A autenticação com Apple requer um dispositivo da Apple.
      // Certifique-se de configurar corretamente no Firebase Console e ter uma Apple ID para teste
      try {
        // final appleProvider = OAuthProvider("apple.com");
        // final credential = await FirebaseAuth.instance.signInWithProvider(appleProvider);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login com Apple com sucesso!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao fazer login com Apple: $e')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: signInWithEmailPassword,
              child: const Text('Login com Email e Senha'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: signInWithGoogle,
              child: const Text('Login com Google'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: signInWithApple,
              child: const Text('Login com Apple'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Não tem uma conta? Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}
