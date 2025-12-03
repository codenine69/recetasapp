import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:recetasapp/examples/dropdown_page.dart';


class TextformfieldPage extends StatelessWidget {
  TextformfieldPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void mostrarSnackBarArriba(BuildContext context) {
    Flushbar(
      // flushbarPosition: FlushbarPosition.BOTTOM, //para que aparezca abajo
      flushbarPosition: FlushbarPosition.TOP, //para que aparezca arriba
      title: "Error",
      message: "Revisa el formulario",
      duration: Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      margin: EdgeInsets.all(8),

      borderRadius: BorderRadius.circular(25),
      icon: Icon(Icons.error),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFormField Page")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Ingresa tu correo",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingresa tu correo";
                    } else if (value.length < 6) {
                      return "El correo debe tener al menos 6 caracteres";
                    } else if (!RegExp(
                      '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}',
                    ).hasMatch(value)) {
                      return "Ingresa un correo válido";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Ingresa tu contraseña",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingresa tu contraseña";
                    } else if (value.length < 8) {
                      return "La contraseña debe tener al menos 8 caracteres";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Validando el formulario
                    if (_formkey.currentState!.validate()) {
                      print(_formkey.currentState!.validate());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Form correcto, enviado"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("Revisa las alertas!"),
                      //     backgroundColor: Colors.red,
                      //   ),
                      // );

                      mostrarSnackBarArriba(context);
                    }
                  },
                  child: Text("Enviar formulario"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}