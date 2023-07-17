import 'package:flutter/cupertino.dart';
import 'package:memoroutines/shared/models/routine.dart';

class RoutinesList extends StatelessWidget {
  const RoutinesList({Key? key, required this.listenRounines})
      : super(key: key);

  final Stream<List<Routine>> listenRounines;

  @override
  StreamBuilder<List<Routine>> build(BuildContext context) {
    return StreamBuilder(
      stream: listenRounines,
      builder: (_, snapshot) => ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (context, index) {
          final routine = snapshot.data?[index];

          if (routine == null) return null;
          return Text('routine.name ${routine.name}');
        },
      ),
    );
  }
}
