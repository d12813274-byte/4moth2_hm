import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hm2/data/repository/animal_repository.dart';
import 'dog_event.dart';
import 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final AnimalRepository animalRepository;

  DogBloc(this.animalRepository) : super(DogInitial()) {
    on<LoadCatImage>((event, emit) async {
      emit(DogLoading());
      try {
        final image = await animalRepository.getCatImage();
        emit(DogLoaded(image));
      } catch (e) {
        emit(DogError());
      }
    });
  }
}