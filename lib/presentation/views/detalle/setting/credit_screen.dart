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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aplicativo Móvil PLANTAS MEDICINALES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Georgia",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Desarrollada por:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '• [CUJE TUITUY MARI ISABEL]\n'
              '• [FISI - UNAP]\n'
              '• [Carrera: Ingeniería de Sistemas e Informática]',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              'Institución de Pre -práctica:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '• [Instituto de Investigación de la Amazonia Peruana (IIAP)]\n'
              'El IIAP es una institución de investigación científica y tecnológica concebida para lograr el desarrollo sostenible de la población amazónica, con énfasis en el ámbito rural, en la conservación y uso correcto de los recursos naturales en la región amazónica.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const Text(
              'Fuentes de información:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '• Libros del Repositorio del IIAP:\n'
              '  Plantas medicinales de la Amazonía peruana, estudio de su uso y cultivo\n'
              '  Autor: Pinedo Panduro, Mario; Rengifo Salgado, Elsa Liliana; Cerrutti Sifuentes, Teodoro\n'
              '  URL: https://repositorio.iiap.gob.pe/handle/20.500.12921/131\n\n'
              '• Manual de especies y usos ancestrales del Caserío-Comunidad Mestiza San Francisco de Marichín,\n'
              '  Provincia de Ramón Castilla, Departamento de Loreto\n'
              '  Autor: Rengifo Salgado, Elsa Liliana\n'
              '  URL: https://repositorio.iiap.gob.pe/handle/20.500.12921/292\n\n'
              '• Repositorio del IIAP:\n'
              '  PLANTAS MEDICINALES\n'
              '  URL: http://plantasmedicinales.iiap.gob.pe/Catalogo/lista/ficha/1\n\n',
              style: TextStyle(color: Colors.white70, height: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              'Supervisor:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '• EVALUADOR: ING. JHON CHARLIE MARTÍNEZ CARRANZA\n',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
