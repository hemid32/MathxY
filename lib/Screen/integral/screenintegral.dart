
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:mathxy/Serves/Ads.dart';
import 'package:mathxy/api/serviceapi.dart';
import 'package:mathxy/thems.dart';




class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeyboardDemo(),
    );
  }
}

class KeyboardDemo extends StatefulWidget {

  @override
  _KeyboardDemoState createState() => _KeyboardDemoState();
}

class _KeyboardDemoState extends State<KeyboardDemo> {

  InterstitialAd _interstitialAd;
  final adm =  ManageAds() ;

  bool rslt = false ;

  TextEditingController _controller = TextEditingController();
  bool _readOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: Center(child: Text('حساب التكامل' , style:  txtStyleAppBar)),

      ),
      body: ListView(
        children: [
          SizedBox(height: 50),
          Center(child: Text('ملاحظة يجب توفر اتصال ب الانترنت')) ,

          Row(
            children: [

              SizedBox(
                width: 10,
              ),

              Expanded(
                child: TeXView(

                    child: TeXViewColumn(children: [
                      TeXViewDocument(
                        '<h1> \\(' + '\\int	' + '\\)</h1>',


                      )
                    ])),
              ),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  style: TextStyle(fontSize: 24),
                  autofocus: true,
                  showCursor: true,
                  readOnly: _readOnly,
                ),
              ),

            ],
          ),
          IconButton(
            icon: Icon(Icons.keyboard),
            onPressed: () {
              setState(() {
                _readOnly = !_readOnly;
              });
            },
          ),
          //Spacer(),

          rslt ? Padding(
            padding: const EdgeInsets.only(top: 20 , bottom: 20),
            child: Card(
              child: FutureBuilder(
                  future:  WolframApi.plotAFunction(expression: _controller.text , type: 'integrate+'),

                  builder: (cxt , snapshot){

                    print('data === ${snapshot.data}');


                    if(snapshot.hasData) {
                      print('data === ${snapshot.data}');

                      return Container(
                        child: Image.network(snapshot.data),

                      );
                    }else{
                      return Center(child: CircularProgressIndicator()) ;
                    }
                  }



              ),
            ),
          ): Container(),
          //Spacer(),

          CustomKeyboard(
            onTextInput: (myText) {
              _insertText(myText);
            },
            onBackspace: () {
              _backspace();
            },
          ),
          Container(
            //width: MediaQuery.of(context).size.width*0.01,
            margin: EdgeInsets.only(
                top: 20, bottom: 20, left: 20, right: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20.0),
              //color: Color(0xff01A0C7),
              color: Colors.indigo,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                onPressed: () async {
                  _interstitialAd = adm.createInterstitialAd()..load() ;
                  _interstitialAd?.show();
                  setState(() {
                    rslt = true ;
                  });
                },
                child: Text(
                    "احسب",
                    textAlign: TextAlign.center,
                    style:txtStyle
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({
    Key key,
    this.onTextInput,
    this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;

  void _textInputHandler(String text) => onTextInput?.call(text);

  void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return Container(


      height: 300,
      padding: EdgeInsets.only(bottom: 20),
      color: Colors.blue,
      child: Column(
        children: [

          buildRowZeroCalc(),
          buildRowTwo(),
          buildRowSenk(),
          buildRowZero(),
          buildRowOne(),


          buildRowThree(),

        ],
      ),
    );
  }
  Expanded buildRowZeroCalc() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '+',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '-',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '*',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '/',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'log',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }


  Expanded buildRowZero() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'x',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'sin',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'cos',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'tan',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '(',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: ' ',
            flex: 4,
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowSenk() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: ')',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '^',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'e^',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'sqrt',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'pi',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onTextInput?.call(text);
            },
            child: Container(
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key key,
    this.onBackspace,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onBackspace?.call();
            },
            child: Container(
              child: Center(
                child: Icon(Icons.backspace),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
