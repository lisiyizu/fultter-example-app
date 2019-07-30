import 'package:flutter/material.dart';
import 'package:zmz_app/model/provider.dart'; // provider
import 'package:zmz_app/model/count_bloc.dart'; // Bloc注入
// 参数
import 'package:zmz_app/domain/page_argument.dart';

class PaymentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // 接收RoutSetting的路由参数
    StringArguments args = ModalRoute.of(context).settings.arguments;

    CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('支付'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: bloc.countStream,
              initialData: bloc.count,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Column(
                  children: <Widget>[
                    Text(args.title),
                    Text(args.message),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: '需支付金额'),
                          TextSpan(text: '${snapshot.data}'),
                          TextSpan(text: '元'),
                        ]
                      ),
                      style: TextStyle(fontSize: 26),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => bloc.dispatch(),
      ),
    );
  }
}