import 'package:bloc/bloc.dart';
import 'package:meu_guia/models/motel/motel_model.dart';
import 'package:meu_guia/repositories/motel_repository.dart';

part 'motel_event.dart';
part 'motel_state.dart';

class MotelBloc extends Bloc<MotelEvent, MotelState> {
  final MotelRepository repository;

  MotelBloc(this.repository) : super(MotelInitial()) {
    on<FetchMoteis>(_onFetchMoteis);
  }

  Future<void> _onFetchMoteis(
      FetchMoteis event, Emitter<MotelState> emit) async {
    emit(MotelLoading());
    try {
      final moteis = await repository.fetchMoteis();
      emit(MotelLoaded(moteis));
    } catch (e) {
      emit(MotelError(e.toString()));
    }
  }
}
