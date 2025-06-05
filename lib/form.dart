import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  final _product3Controller = TextEditingController();
  final _product4Controller = TextEditingController();
  final _product5Controller = TextEditingController();
  final _product6Controller = TextEditingController();
  final _product7Controller = TextEditingController();

  @override
  void dispose() {
    _productController.dispose();
    _productDesController.dispose();
    _product3Controller.dispose();
    _product4Controller.dispose();
    _product5Controller.dispose();
    _product6Controller.dispose();
    _product7Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 62, 98, 119),
            title: const Text("Form"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _productController,
                  fieldName: "Id_Sucursal",
                  myIcon: Icons.add_chart,
                  prefixIconColor: const Color.fromARGB(255, 89, 133, 146)),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _productDesController,
                  fieldName: "Nombre",
                  myIcon: Icons.accessibility_new_rounded,
                  prefixIconColor: const Color.fromARGB(255, 89, 133, 146)),
              const SizedBox(height: 10.0),
              //Use to add space between Textfields
              MyTextField(
                  myController: _product3Controller,
                  fieldName: "Direccion",
                  myIcon: Icons.account_balance_wallet,
                  prefixIconColor: const Color.fromARGB(255, 81, 111, 136)),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _product4Controller,
                  fieldName: "Telefono",
                  prefixIconColor: const Color.fromARGB(255, 81, 111, 136)),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _product5Controller,
                  fieldName: "Ciudad",
                  myIcon: Icons.account_balance,
                  prefixIconColor: const Color.fromARGB(255, 81, 111, 136)),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _product6Controller,
                  fieldName: "Gerente",
                  myIcon: Icons.ad_units_outlined,
                  prefixIconColor: const Color.fromARGB(255, 81, 111, 136)),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _product7Controller,
                  fieldName: "Horario de atencion",
                  myIcon: Icons.add_box,
                  prefixIconColor: const Color.fromARGB(255, 81, 111, 136)),
              const SizedBox(height: 10.0),
              myBtn(context),
            ],
          ),
        ));
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              productName: _productController.text,
              productDescription: _productDesController.text,
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 53, 98, 134)),
      ),
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
// You can learn it in Tutorial (2.13) Custom Widget in Flutter
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 165, 165, 165)),
          ),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 67, 103, 136))),
    );
  }
}
