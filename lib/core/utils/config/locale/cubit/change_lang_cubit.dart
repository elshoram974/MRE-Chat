import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_lang_state.dart';

class ChangeLangCubit extends Cubit<ChangeLangState> {
  ChangeLangCubit() : super(ChangeLangInitial());
}
