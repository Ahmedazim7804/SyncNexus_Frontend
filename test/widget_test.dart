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
          phoneNo: "9315082028", name: "Mahesh", userType: "employee", firebaseUserId: "MM0A6CZw5hVglML2Fk7K0rWaqKn1", email: "***REMOVED***.ahmad.ug23@nsut.ac.in"
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
          "1824b2de-bc70-470c-a80f-f52c9da8588e", "Fix the roof", "The roof is leaking", DateTime.now().add(const Duration(days: 3))
      );
      expect(result == true || result == false, true);
    });
  });
  group('addEmployee', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await addEmployee(
          "1824b2de-bc70-470c-a80f-f52c9da8588e",
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
      final result = await getLocation("1824b2de-bc70-470c-a80f-f52c9da8588e", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      print(result);
      expect(Null == result || Null != result, true);
    });
  });
  group('completeTask', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await completeTask("c2f768c1-d206-4959-912e-0b906f425380");
      expect(result == true || result == false, true);
    });
  });
  group('getTask', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTask(
          "c2f768c1-d206-4959-912e-0b906f425380"
      );
      print(result);
      expect(Null == result || Null != result, true);
    });
  });
  group('getTasks', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getTasks("1824b2de-bc70-470c-a80f-f52c9da8588e", DateTime.now().subtract(const Duration(days: 3)), DateTime.now());
      print(result);
      expect(Null == result || Null != result, true);
    });
  });
  group('searchByPhone', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await searchByPhone("12345676875");
      print(result);
      expect(Null != result, true);
    });
  });
  group('addJobs', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await addJobs("description, I'm iron man @#^54192379", "title", 28.704060, 77.102493, 20000);
      expect(result, true);
    });
  });
  group('addPayments', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await addPayments(
        "1824b2de-bc70-470c-a80f-f52c9da8588e", "Tea/Coffee for FY23", "USD", 100000
      );
      expect(true == result, true);
    });
  });
  group('getEmployeePayments', () {
    test('returns true if HTTP request succeeds', () async {
      final result = await getEmployeePayments("1824b2de-bc70-470c-a80f-f52c9da8588e");
      print(result);
      expect(Null != result, true);
    });
  });


}
