part of 'amazon2_bloc.dart';

@immutable
sealed class Amazon2State {}

final class Amazon2Initial extends Amazon2State {}
class  Amazon2BlocLoading extends  Amazon2State {}
class  Amazon2BlocLoaded extends  Amazon2State {}
class  Amazon2BlocError extends Amazon2State {}

