part of 'amazon_bloc.dart';

@immutable
sealed class AmazonState {}

final class AmazonInitial extends AmazonState {}
class  AmazonBlocLoading extends  AmazonState {}
class  AmazonBlocLoaded extends  AmazonState {}
class  AmazonBlocError extends AmazonState {}