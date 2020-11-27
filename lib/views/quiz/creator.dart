import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create a quiz',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

//Note to backend: You can retrieve the information from answersList of _MyFormState class.
class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> answersList = [null];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Create a quiz'),
        automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, true),
      )),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // chose quiz category
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Enter quiz category'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              //1st question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Enter 1st question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //2nd question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 2nd question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //3rd question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 3rd question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //4th question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 4th question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //5th question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 5th question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //6th question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 6th question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //7th question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 7th question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //8th question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 8th question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //9th question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 9th question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              //10th question
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Enter 10th question'),
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add answers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getAnswers(),
              SizedBox(
                height: 40,
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                child: Text('Submit'),
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// get answers text-fields
  List<Widget> _getAnswers() {
    List<Widget> answersTextFields = [];
    for (int i = 0; i < answersList.length; i++) {
      answersTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: AnswerTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last answer row
            _addRemoveButton(i == answersList.length - 1, i),
          ],
        ),
      ));
    }
    return answersTextFields;
  }

  /// add/remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all answers textfields
          answersList.insert(0, null);
        } else
          answersList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.purple : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AnswerTextFields extends StatefulWidget {
  final int index;
  AnswerTextFields(this.index);
  @override
  _AnswerTextFieldsState createState() => _AnswerTextFieldsState();
}

class _AnswerTextFieldsState extends State<AnswerTextFields> {
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _MyFormState.answersList[widget.index] ?? '';
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _MyFormState.answersList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Enter your answer'),
      validator: (v) {
        if (v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  } //commit
}
