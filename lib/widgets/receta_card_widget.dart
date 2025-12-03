import 'package:flutter/material.dart';
import 'package:recetasapp/models/receta_model.dart';

class RecetaCardWidget extends StatelessWidget {
  RecetaModel recetaModel;
  RecetaCardWidget(this.recetaModel);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.30),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              recetaModel.urlImage,
              height: size.height / 4,
              width: size.width * 0.8,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              recetaModel.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            recetaModel.preparation,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}