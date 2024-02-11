part of 'employee_location_cubit.dart';

abstract class EmployeeLocationState {}

final class LocationLoading extends EmployeeLocationState {}

final class LocationDisabled extends EmployeeLocationState {}

final class LocationPermissionDenied extends EmployeeLocationState {}

final class LocationAvailable extends EmployeeLocationState {}
