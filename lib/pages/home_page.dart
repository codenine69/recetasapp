import 'package:flutter/material.dart';
import 'package:recetasapp/models/receta_model.dart';
import 'package:recetasapp/widgets/form_item_widget.dart';
import 'package:recetasapp/widgets/receta_card_widget.dart';
// Para mostrar alertas, aunque usaremos SnackBar simple
import 'package:another_flushbar/flushbar.dart'; 

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. GlobalKey para el Form
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _preparationController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  // 2. Variables para el Dropdown
  String? _selectedTipoReceta;
  final List<String> _tiposReceta = ["Entrada", "Sopa", "Segundo", "Postre"];

  RecetaModel recetaWafles = RecetaModel(
    title: "Wafles",
    preparation:
        "Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamoscocinar.Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.",
    urlImage:
        "https://images.pexels.com/photos/789327/pexels-photo-789327.jpeg",
    // 3. Incluir el nuevo campo en la receta inicial
    tiporeceta: "Postre",
  );

  List<RecetaModel> recetasList = [];

  @override
  void initState() {
    super.initState();
    recetasList.add(recetaWafles);
  }
 
  void _mostrarSnackBarError(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: "Error de Formulario",
      message: "Por favor, revisa todos los campos obligatorios.",
      duration: Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(25),
      icon: Icon(Icons.error),
    ).show(context);
  }

  // Función para limpiar todos los campos
  void _clearControllers() {
    _titleController.clear();
    _preparationController.clear();
    _imageController.clear();
    _selectedTipoReceta = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C3248),
      appBar: AppBar(
        backgroundColor: Color(0xff0C3248),
        foregroundColor: Colors.white,
        title: Text("App de recetas"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- Título (TextFormField) ---
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "El título es obligatorio";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Ingresa el título",
                      prefixIcon: Icon(Icons.title, color: Colors.white70),
                      fillColor: Colors.white12,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  
                  // --- DropdownButtonFormField para Tipo de Receta ---
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecciona un tipo de receta";
                      }
                      return null;
                    },
                    value: _selectedTipoReceta,
                    decoration: InputDecoration(
                      labelText: "Tipo de Receta",
                      prefixIcon: Icon(Icons.category, color: Colors.white70),
                      fillColor: Colors.white12,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white70),
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    dropdownColor: Color(0xff0C3248),
                    style: TextStyle(color: Colors.white),
                    items: _tiposReceta.map((type) {
                      return DropdownMenuItem(
                        child: Text(type),
                        value: type,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTipoReceta = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 16),


                  // --- Preparación (TextFormField) ---
                  TextFormField(
                    controller: _preparationController,
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "La preparación es obligatoria";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Ingresa la preparación",
                      prefixIcon: Icon(Icons.list, color: Colors.white70),
                      fillColor: Colors.white12,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),

                  // --- Imagen URL (TextFormField) ---
                  TextFormField(
                    controller: _imageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "La URL de la imagen es obligatoria";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Ingresa la url de la imagen",
                      prefixIcon: Icon(Icons.image, color: Colors.white70),
                      fillColor: Colors.white12,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  
                  SizedBox(height: 16),
                  
                  // --- Botón de Registro con Validación ---
                  ElevatedButton(
                    onPressed: () {
                      // Validar el Form antes de agregar la receta
                      if (_formKey.currentState!.validate()) {
                        // Formulario válido
                        RecetaModel recetaAux = RecetaModel(
                          title: _titleController.text,
                          preparation: _preparationController.text,
                          urlImage: _imageController.text,
                          tiporeceta: _selectedTipoReceta!, // Valor validado
                        );
                        
                        recetasList.add(recetaAux);
                        _clearControllers(); 
                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("✅ Receta registrada con éxito!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        // Formulario inválido mostrar error
                        _mostrarSnackBarError(context);
                      }
                    },
                    child: Text("Registrar receta"),
                  ),
                  
                  SizedBox(height: 16),
                  
                   
                  ...recetasList.map((e) {
                    return RecetaCardWidget(e);
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}