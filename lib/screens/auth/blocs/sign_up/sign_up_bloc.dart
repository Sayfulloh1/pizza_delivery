import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;

  SignUpBloc({required this.userRepository}) : super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async{
      emit(SignUpProcess());
      try {
        MyUser myUser = await userRepository.signUp(event.user, event.password);
        await userRepository.setUserData(myUser);
        emit(SignUpSuccess());
      } catch (error) {
        SignUpFailure();
      }
    });
  }
}
