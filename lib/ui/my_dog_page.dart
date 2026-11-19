import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hm2/data/repository/animal_repository.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_bloc.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_event.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_state.dart';

class MyDogPage extends StatefulWidget {
  const MyDogPage({super.key});

  @override
  State<MyDogPage> createState() => _MyDogPageState();
}

class _MyDogPageState extends State<MyDogPage> {
  final DogBloc _dogBloc = DogBloc(AnimalRepository());

  @override
  void dispose() {
    _dogBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Кошки')),
      body: Center(
        child: BlocBuilder<DogBloc, DogState>(
          bloc: _dogBloc,
          builder: (context, state) {
            if (state is DogLoading) {
              return const CircularProgressIndicator();
            }
            if (state is DogLoaded) {
              return Image.network(
                state.imageUrl,
                webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
              );
            }
            if (state is DogError) {
              return const Text('Ошибка загрузки');
            }
            return const Text('Нажми кнопку');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dogBloc.add(LoadCatImage());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}