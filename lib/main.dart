import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLATÃO MOTIVADOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'PLATÃO MOTIVADOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  var rnd = Random();
  var quotes = <String>[
    "De todos os animais selvagens, o homem jovem é o mais difícil de domar.",
    "Deve-se temer a velhice, porque ela nunca vem só. Bengalas são provas de idade e não de prudência.",
    "Quem comete uma injustiça é sempre mais infeliz que o injustiçado.",
    "Tente mover o mundo – o primeiro passo será mover a si mesmo.",
    "Uma vida não questionada não merece ser vivida.",
    "O livro é um mestre que fala, mas que não responde.",
    "Os olhos do espírito só começam a ser penetrantes quando os do corpo principiam a enfraquecer.",
    "Onde não há igualdade, a amizade não perdura.",
    "Não há ninguém, mesmo sem cultura, que não se torne poeta quando o amor toma conta dele.",
    "Tudo quanto vive provém daquilo que morreu.",
    "Muitos odeiam a tirania apenas para que possam estabelecer a sua.",
    "Não há nada bom nem mau a não ser estas duas coisas: a sabedoria que é um bem e a ignorância que é um mal.",
    "Quem ama extremamente, deixa de viver em si e vive no que ama.",
    "A necessidade que é a mãe da invenção.",
    "Os homens não desejam aquilo que fazem, mas os objetivos que os levam a fazer aquilo que fazem."
  ];
  String text = 'Clique no botão para começar!';

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Copiado para a área de transferência!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              // Imagem Platão
              // Padding
              Padding(
                padding: EdgeInsets.only(
                  right: screenWidth / 7,
                  left: screenWidth / 7,
                  top: screenHeight / 20,
                ),
                // SizedBox
                child: SizedBox(
                    width: screenWidth / 2,
                    height: screenHeight / 3,
                    child: Image.asset('images/platao.png')),
              ),
              // Frases
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight / 20,
                    left: screenWidth / 6,
                    right: screenWidth / 6),
                child: Text(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                    text),
              ),
              // Elevated Button
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 15),
                child: SizedBox(
                  width: screenWidth / 2,
                  height: screenHeight / 22,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        setState(() {
                          int number = rnd.nextInt(quotes.length);
                          text = quotes[number];
                          text = text;
                        });
                      },
                      child: const Text(
                          style: TextStyle(color: Colors.white),
                          'Platonize-se!')),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 50),
                child: SizedBox(
                  width: screenWidth / 2,
                  height: screenHeight / 24,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: _copyToClipboard,
                      child: const Text(
                          style: TextStyle(color: Colors.white), 'Copie!')),
                ),
              ),
            ],
          ),
        ));
  }
}
