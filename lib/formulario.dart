import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _correo = '';
  String _edad = '';
  String _password = '';
  bool _esLogin = true;

  Future<void> _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        if (_esLogin) {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _correo, password: _password);
          _mostrarMensaje("Bienvenido $_nombre");
        } else {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _correo, password: _password);
          _mostrarMensaje("Registro exitoso. Bienvenido $_nombre");
        }
      } on FirebaseAuthException catch (e) {
        _mostrarMensaje("Error: ${e.message}");
      }
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_esLogin ? 'Iniciar Sesión' : 'Registro'),
        actions: [
          TextButton(
            onPressed: () => setState(() => _esLogin = !_esLogin),
            child: Text(
              _esLogin ? 'Registrarse' : 'Login',
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onSaved: (val) => _nombre = val!,
                validator: (val) =>
                val!.isEmpty ? 'Este campo es obligatorio' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
                onSaved: (val) => _edad = val!,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Campo requerido';
                  final edad = int.tryParse(val);
                  if (edad == null || edad <= 0 || edad > 100) {
                    return 'Edad inválida';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Correo'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => _correo = val!,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Campo requerido';
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
                  return emailRegex.hasMatch(val)
                      ? null
                      : 'Correo inválido';
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                onSaved: (val) => _password = val!,
                validator: (val) => val!.length < 6
                    ? 'Debe tener al menos 6 caracteres'
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarFormulario,
                child: Text(_esLogin ? 'Iniciar sesión' : 'Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
