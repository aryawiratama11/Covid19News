import '../bloc/covid_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidControl extends StatefulWidget {
  const CovidControl({
    Key key,
  }) : super(key: key);

  @override
  _CovidControlState createState() => _CovidControlState();
}

class _CovidControlState extends State<CovidControl> {
  final controller = TextEditingController();
  String inputString;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: TextField(
            
            controller: this.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input a Country',
              
            ),
            onChanged: (val) {
              this.inputString = val;
            },
            onSubmitted: (_) {
              this.controller.clear();
              BlocProvider.of<CovidBloc>(context).dispatch(
                GetCountrySpecificCovidInfoEvent(country: this.inputString),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  this.controller.clear();
                  BlocProvider.of<CovidBloc>(context).dispatch(
                    GetCountrySpecificCovidInfoEvent(country: this.inputString),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
            ),
            Expanded(
              child: RaisedButton(
                child: Text('All Information'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  BlocProvider.of<CovidBloc>(context).dispatch(
                    GetAllCovidInfoEvent(),
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Updates of Sri Lanka'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  BlocProvider.of<CovidBloc>(context)
                      .dispatch(GetLKSpecificCovidInfoEvent());
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
        ),
        Center(
          child: SingleChildScrollView(
            child: Text(
              'IMPORTANT',
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
        ),
        Center(
          child: SingleChildScrollView(
            child: Text(
              'Search "South Korea" as "Korea"',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
