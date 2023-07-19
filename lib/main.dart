import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': '1- Como você lida com os desafios do dia a dia?',
      'respostas': [
        {'texto': 'a) Evito pensar muito neles', 'pontuacao': 3},
        {'texto': 'b) Procuro enfrentá-los de frente ', 'pontuacao': 7},
        {'texto': 'c) Busco apoio em amigos e familiares ', 'pontuacao': 5},
        {'texto': 'd) Tento analisar suas causas profundas', 'pontuacao': 9},
      ],
    },
    {
      'texto': '2- Como você se sente em relação aos seus sonhos e desejos?',
      'respostas': [
        {
          'texto': 'a) Acredito que alguns deles são impossíveis de alcançar',
          'pontuacao': 2
        },
        {'texto': 'b) Busco realizá-los, mas com cautela', 'pontuacao': 6},
        {'texto': 'c) Sinto-me confuso(a) em relação a eles', 'pontuacao': 4},
        {
          'texto':
              'd) Tenho clareza sobre meus desejos e os persigo com determinação',
          'pontuacao': 8
        },
      ],
    },
    {
      'texto': '3- Qual a importância das suas relações interpessoais? ',
      'respostas': [
        {'texto': 'a) Prefiro a solidão', 'pontuacao': 2},
        {
          'texto': 'b) São importantes, mas mantenho certa distância',
          'pontuacao': 5
        },
        {
          'texto': 'c) São essenciais para o meu bem-estar emocional',
          'pontuacao': 7
        },
        {
          'texto': 'd) Invisto muito tempo e energia para cultivá-las',
          'pontuacao': 9
        },
      ],
    },
    {
      'texto':
          '4- Como você reage diante de sentimentos de raiva ou frustração? ',
      'respostas': [
        {'texto': 'a) Suprimo ou ignoro esses sentimentos', 'pontuacao': 2},
        {'texto': 'b) Tento expressá-los de forma controlada ', 'pontuacao': 6},
        {
          'texto': 'c) Procuro identificar suas origens e lidar com eles',
          'pontuacao': 8
        },
        {
          'texto': 'd) Expresso minha raiva ou frustração de forma explosiva',
          'pontuacao': 4
        },
      ],
    },
    {
      'texto': '5- Como você se sente em relação ao seu passado?',
      'respostas': [
        {
          'texto': 'a) Tenho dificuldade em lidar com eventos passados ',
          'pontuacao': 3
        },
        {
          'texto': 'b) Aceito meu passado e procuro seguir em frente',
          'pontuacao': 6
        },
        {
          'texto': 'c) Sinto que meu passado me influencia muito',
          'pontuacao': 8
        },
        {
          'texto':
              'd) Tenho consciência das influências do passado e trabalhei para superar traumas',
          'pontuacao': 10
        },
      ],
    },
    {
      'texto': '6- Como você se vê em relação à sua autoestima?',
      'respostas': [
        {'texto': 'a) Tenho baixa autoestima', 'pontuacao': 3},
        {'texto': 'b) Varia dependendo da situação ', 'pontuacao': 5},
        {'texto': 'c) Geralmente, tenho uma boa autoestima ', 'pontuacao': 8},
        {
          'texto':
              'd) Tenho uma autoestima saudável e confiança em mim mesmo(a)',
          'pontuacao': 8
        },
      ],
    },
    {
      'texto':
          '7-Como você costuma lidar com emoções intensas, como tristeza ou medo? ',
      'respostas': [
        {
          'texto': 'a) Procuro distrair-me para evitar sentir essas emoções',
          'pontuacao': 2
        },
        {
          'texto': 'b) Busco apoio emocional de amigos ou familiares ',
          'pontuacao': 6
        },
        {
          'texto': 'c) Tento compreender a origem dessas emoções ',
          'pontuacao': 8
        },
        {
          'texto': 'd) Expresso essas emoções de forma aberta e genuína',
          'pontuacao': 7
        },
      ],
    },
    {
      'texto':
          '8- Como você enxerga seus comportamentos impulsivos ou compulsivos?',
      'respostas': [
        {
          'texto':
              'a) Não percebo ter comportamentos impulsivos ou compulsivos',
          'pontuacao': 2
        },
        {
          'texto': 'b) Reconheço-os, mas nem sempre consigo controlá-los - ',
          'pontuacao': 5
        },
        {
          'texto':
              'c) Busco compreender suas motivações e trabalhar para controlá-los ',
          'pontuacao': 9
        },
        {
          'texto':
              'd) Considero que meus comportamentos impulsivos são uma parte normal da vida',
          'pontuacao': 4
        },
      ],
    },
    {
      'texto': '9- Como você lida com os sentimentos de culpa? ',
      'respostas': [
        {
          'texto': 'a) Tenho dificuldade em lidar com sentimentos de culpa',
          'pontuacao': 3
        },
        {'texto': 'b) Procuro reparar o que fiz de errado ', 'pontuacao': 7},
        {
          'texto': 'c) Analiso as causas da culpa e tento aprender com ela ',
          'pontuacao': 8
        },
        {
          'texto':
              'd) Raramente sinto culpa, pois acredito que é uma emoção inútil - ',
          'pontuacao': 2
        },
      ],
    },
    {
      'texto':
          '10- Qual é o seu nível de abertura para explorar sua mente e emoções mais profundas?',
      'respostas': [
        {
          'texto': 'a) Evito pensar muito em questões emocionais complexas ',
          'pontuacao': 2
        },
        {
          'texto': 'b) Estou disposto(a) a explorar, mas com cautela',
          'pontuacao': 6
        },
        {
          'texto': 'c) Sinto-me confortável em investigar minhas emoções',
          'pontuacao': 8
        },
        {
          'texto':
              'd) Sou extremamente aberto(a) para explorar minha mente e emoções mais profundas',
          'pontuacao': 10
        },
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade600,
          title: Text('Questionário sobre autoconhecimento', textAlign: TextAlign.center,),
        ),
        body: Column(
          children: <Widget>[
            Expanded( // Usar Expanded para ocupar o espaço disponível
              child: temPerguntaSelecionada
                  ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
                  : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
            ),
            Center(
              child: Lottie.asset(
                'assets/p1.json',
                height: 300, // Altura do primeiro gif reduzida para ocupar 50% da tela
                width: 250, // Largura do primeiro gif reduzida para ocupar 50% da tela
                fit: BoxFit.fill,
              ),
            ),
            if (!temPerguntaSelecionada) // Verificar se não há mais perguntas
                  Text('Este é um quiz para fins de entreterimento, as perguntas e respostas não substituem um psicólogo.', textAlign: TextAlign.center),
                ],
      ),
        ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas?.map((resp) {
              return Resposta(
                resp['texto'] as String,
                () => quandoResponder(resp['pontuacao'] as int),
              );
            }).toList() ??
            [],
      ],
    );
  }
}

class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Resposta extends StatelessWidget {
  final String texto;
  final VoidCallback quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade800,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple[200],
        ),
        child: Text(texto, style: TextStyle(fontSize: 18),),
        onPressed: quandoSelecionado,
      ),
    );
  }
}

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 30) {
      return 'Indica um nível de abertura limitado para explorar questões emocionais e uma tendência a evitar ou negar sentimentos mais profundos.';
    } else if (pontuacao < 50) {
      return 'Sugere um nível médio de abertura emocional, mas ainda existem áreas que podem ser exploradas e trabalhadas para um melhor autoconhecimento';
    } else if (pontuacao < 70) {
      return ' Indica uma boa disposição para explorar questões emocionais e uma compreensão razoável dos próprios sentimentos e comportamentos';
    } else {
      return 'Reflete um alto grau de abertura emocional, autoconhecimento e disposição para trabalhar questões psicológicas profundas. Parabéns! Você parece estar bem conectado consigo mesmo(a).';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple[200],
            ),
            onPressed: quandoReiniciarQuestionario,
            child: Text('Reiniciar Questionário'),
          ),
        ],
      ),
    );
  }
}
