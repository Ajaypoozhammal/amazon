part of 'amazon3_bloc.dart';

@immutable
sealed class Amazon3State {}
final class Amazon3Initial extends Amazon3State {}
class  Amazon3BlocLoading extends  Amazon3State {}
class  Amazon3BlocLoaded extends  Amazon3State {}
class  Amazon3BlocError extends Amazon3State {}
