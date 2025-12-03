import 'package:flutter/material.dart';

class TextfieldPage extends StatefulWidget {
  TextfieldPage({super.key});

  @override
  State<TextfieldPage> createState() => _TextfieldPageState();
}

class _TextfieldPageState extends State<TextfieldPage> {
  TextEditingController _emailController = TextEditingController();

  bool _hasError = false;

  void _validarCorreo() {
    String correo = _emailController.text;
    _hasError = !correo.contains("@");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Field Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress, //tipo de teclado
                // obscureText: true, //ocultar texto como contraseñas
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.red, //Color de cursos
                cursorWidth: 10, //ancho del cursor
                cursorHeight: 20, //alto del cursor
                cursorRadius: Radius.circular(
                  2,
                ), //border redondeados en el cursos
                maxLines: 1, //máximo de lineas en el textfield
                onChanged: (value) => _validarCorreo(),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  errorText: _hasError ? "Formato inválido" : null,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  labelText: "Correo",
                  hintText: "Ejemplo@gmail.com",
                  helperText: "Ingresa un correo válido",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: _hasError
                      ? Icon(Icons.cancel)
                      : Icon(Icons.check_circle),
                  suffixIconColor: _hasError ? Colors.red : Colors.green,
                  // border: UnderlineInputBorder(), //linea inferior
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 4),
                    // borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.blueAccent, width: 4),
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 4),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 4),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _validarCorreo();
                },
                child: Text("Validar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}