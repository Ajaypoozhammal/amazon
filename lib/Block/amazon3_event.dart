part of 'amazon3_bloc.dart';

@immutable
sealed class Amazon3Event {}
class FetchAmazon3 extends Amazon3Event {
  final String id;
  FetchAmazon3({required this.id});
}

