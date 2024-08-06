part of 'amazon2_bloc.dart';

@immutable
sealed class Amazon2Event {}
class FetchAmazon2 extends Amazon2Event {
  final String id;
  FetchAmazon2({required this.id});
}