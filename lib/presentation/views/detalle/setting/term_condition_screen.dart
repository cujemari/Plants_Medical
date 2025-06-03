import 'package:flutter/material.dart';

class TermConditionScreen extends StatelessWidget {
  const TermConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0A2D14),
      appBar: AppBar(
        title: const Text(
          'Términos y Condiciones',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color(0XFF0A2D14),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '1. Uso de la Aplicación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'La aplicación de Plantas Medicinales está diseñada con fines informativos y educativos. No sustituye el consejo médico profesional.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                '2. Información Proporcionada',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Los datos sobre las plantas, sus propiedades y usos provienen de fuentes confiables. Sin embargo, no garantizamos su exactitud o actualización constante.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                '3. Responsabilidad del Usuario',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'El uso de la información es responsabilidad exclusiva del usuario. Se recomienda consultar a un especialista antes de usar plantas medicinales con fines terapéuticos.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                '4. Derechos de Autor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Todos los contenidos, incluyendo textos, imágenes y datos, están protegidos por derechos de autor. Su uso sin autorización está prohibido.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                '5. Cambios en los Términos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nos reservamos el derecho de modificar estos términos en cualquier momento. Las actualizaciones se comunicarán a través de la aplicación.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
