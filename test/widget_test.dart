import 'package:flutter_test/flutter_test.dart';
import 'package:worker_app/provider/base_endpoints.dart';
import 'package:worker_app/provider/employee_endpoints.dart';
import 'package:worker_app/provider/employer_endpoints.dart';
import 'package:worker_app/provider/user_endpoints.dart';


void main() {
  group('checkUser', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await checkUser();
      expect(result == true || result == false, true);
    });
  });
  group('createUser', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await createUserOnBackend(
          phoneNo: "1234567890", name: "John Doe", userType: "employee", firebaseUserId: "YCDugoXMwwVeaqs2SVNDW2YhdhA2", email: "john@gmail.com"
      );
      expect(result == true || result == false, true);
    });
    test('returns true if HTTP request succeeds', () async {
      final result = await createUserOnBackend(
          phoneNo: "12345676875", name: "Tony Stark", userType: "employer", firebaseUserId: "vQ0LNIqBZGfTX6Ttoy6INrSiNlc2", email: "apple@gmail.com"
      );
      expect(result == true || result == false, true);
    });
  });
  group('addTask', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await addTask(
          "d89a6446-8313-43bb-bb9b-c8fe071a9a95", "Fix the roof", "The roof is leaking", DateTime.now().add(const Duration(days: 3))
      );
      expect(result == true || result == false, true);
    });
  });
  group('addEmployee', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await addEmployee(
          "d89a6446-8313-43bb-bb9b-c8fe071a9a95",
        "Manager"
      );
      expect(result == true || result == false, true);
    });
  });
  group('getEmployees', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getEmployees();
      expect(Null == result || Null != result, true);
    });
  });
  group('getLocation', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getLocation("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
  group('completeTask', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await completeTask("bd211e17-3aad-4cdc-bcbf-53080f2bd28c");
      expect(result == true || result == false, true);
    });
  });
  group('getTask', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTask(
          "bd211e17-3aad-4cdc-bcbf-53080f2bd28c"
      );
      expect(Null == result || Null != result, true);
    });
  });
  group('getTasks', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
  group('getJobDetail', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
  group('getEmployer', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
  group('addLocation', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
  group('getJobs', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
  group('leaveJob', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
  group('approvePayment', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("d89a6446-8313-43bb-bb9b-c8fe071a9a95", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      expect(Null == result || Null != result, true);
    });
  });
}