import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/number_trivia_bloc.dart';
import '../widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              blocBuilder(),
              SizedBox(height: 20),
              // Bottom half
              TriviaControls(),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<NumberTriviaBloc, NumberTriviaState> blocBuilder() {
    return BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
      builder: (context, state) {
        if (state is Empty) {
          return MessageDisplay(
            message: 'Start searching!',
          );
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is Loaded) {
          return TriviaDisplay(numberTrivia: state.trivia);
        } else if (state is Error) {
          return MessageDisplay(
            message: state.message,
          );
        } else {
          return Text('Nothing');
        }
      },
    );
  }
}


// class NumberTriviaPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Number Trivia'),
//       ),
//       body: buildBody(context),
//     );
//   }

//   BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
//     return BlocProvider(
//       create: (_) => sl<NumberTriviaBloc>(),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 10),
//               // Top half
//               Container(
//                 // Third of the size of the screen
//                 height: MediaQuery.of(context).size.height / 3,
//                 // Message Text widgets / CircularLoadingIndicator
//                 child: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
//                   builder: (context, state) {
//                     if (state is Empty) {
//                       return MessageDisplay(
//                         message: 'Start searching!',
//                       );
//                     } else if (state is Loading) {
//                       return LoadingWidget();
//                     } else if (state is Loaded) {
//                       return TriviaDisplay(
//                         numberTrivia: state.trivia,
//                       );
//                     } else if (state is Error) {
//                       return MessageDisplay(
//                         message: state.message,
//                       );
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Bottom half
//               Column(
//                 children: <Widget>[
//                   // TextField
//                   Placeholder(fallbackHeight: 40),
//                   SizedBox(height: 10),
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         // Search concrete button
//                         child: Placeholder(fallbackHeight: 30),
//                       ),
//                       SizedBox(width: 10),
//                       Expanded(
//                         // Random button
//                         child: Placeholder(fallbackHeight: 30),
//                       )
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



