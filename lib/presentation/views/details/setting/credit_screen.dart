import 'package:flutter/material.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0A2D14),
      appBar: AppBar(
        title: const Text('Créditos'),
        backgroundColor: const Color(0XFF0A2D14),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  'Aplicativo Móvil PLANTAS MEDICINALES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Georgia",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Desarrollado por:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '• CUJE TUITUY MARI ISABEL\n'
                '• FISI - UNAP\n',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                'Institución de Pre -práctica:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '• Instituto de Investigación de la Amazonia Peruana (IIAP)\n'
                'El IIAP es una institución de investigación científica y tecnológica concebida para lograr el desarrollo sostenible de la población amazónica, con énfasis en el ámbito rural, en la conservación y uso correcto de los recursos naturales en la región amazónica.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                'Supervisor:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '• ING. JHON CHARLIE MARTÍNEZ CARRANZA\n',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                'Referencias bibliográficas:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '• IIAP - Instituto de Investigaciones de la Amazonía Peruana. https://www.iiap.gob.pe\n'
                '• MINSA - Ministerio de Salud del Perú. Guía de plantas medicinales. https://www.gob.pe/minsa\n'
                '• Rengifo, E. (2009). Plantas medicinales de la Amazonía Peruana. Iquitos: CETA.\n'
                '• Martínez, J.C. (2023). Uso tradicional de plantas curativas en comunidades amazónicas.\n',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
