part of 'example_bloc.dart';

sealed class ExampleEvent  {
  const ExampleEvent();

}

final class ExampleFetchData extends ExampleEvent {
  const ExampleFetchData();
}
