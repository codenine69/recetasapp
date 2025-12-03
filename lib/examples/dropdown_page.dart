import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String? selectedValue;
  List<String> paises = ["Perú", "Chile", "Argentina", "EEUU"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //CARD PARA ENGLOBAR AL DROPDOWN NORMAL
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 32,
                  ),
                  child: DropdownButton(
                    //DROPDOWNBUTTON NORMAL
                    icon: Icon(Icons.arrow_downward),
                    dropdownColor:
                        Colors.amber[50], //Color del menú desplegable
                    underline: Container(), //eliminar la linea inferior
                    borderRadius: BorderRadius.circular(25),

                    hint: Text("Seleccionar el país"),
                    value: selectedValue,
                    items: paises.map((pais) {
                      return DropdownMenuItem(child: Text(pais), value: pais);
                    }).toList(),
                    onChanged: (value) {
                      selectedValue = value;
                      print(selectedValue);
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(height: 35),
              // DROPDOWN PARA FORMULARIOS
              DropdownButtonFormField(
                //TIENE TODAS LAS CARACTERÍSTICAS DE UN TEXTFORMFIELD
                decoration: InputDecoration(
                  labelText: "Selecciona un país",
                  border: OutlineInputBorder(),
                ),
                items: paises.map((pais) {
                  return DropdownMenuItem(child: Text(pais), value: pais);
                }).toList(),
                onChanged: (value) {
                  selectedValue = value;
                  setState(() {});
                },
                validator: (value) {
                  if (value == null) return "Por favor selecciona un país";
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}