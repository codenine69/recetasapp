import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  Widget _buildContainers(String text) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Page")),
      body: Column(
        children: [
          Text("CABECERA 1"),
          Text("CABECERA 1"),
          Text("CABECERA 1"),
          Text("CABECERA 1"),
          Text("CABECERA 1"),
          Expanded(
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal, //Scroll horizontal, funciona con un child Row
              child: Column(
                children: [
                  _buildContainers("Hola"),
                  _buildContainers("Hola"),
                  _buildContainers("Hola"),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 200,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 15,
                          height: 50,
                          color: Colors.blueGrey,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _buildContainers("$index LISTVIEW");
                      },
                    ),
                  ),
                  _buildContainers("Hola"),
                  _buildContainers("Hola"),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 200,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildContainers("${index.toString()} LISTVIEW");
                      },
                    ),
                  ),
                  ...List.generate(
                    10,
                    (index) => _buildContainers("${index.toString()}"),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          10,
                          (index) => _buildContainers(index.toString()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}