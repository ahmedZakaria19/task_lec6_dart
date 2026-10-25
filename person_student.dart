class Person {
  String _name;
  int _age;
  Person(this._name, this._age);
  void display() {
    print("Name: $_name");
    print("Age: $_age");
  }
}

class Student extends Person {
  int studentId;
  double grade;
  Student({
    required String name,
    required int age,
    required this.studentId,
    required this.grade,
  }) : super(name, age);
  void display() {
    super.display();
    print("Student ID: $studentId");
    print("Grade: $grade");
  }
}

void main() {
  Student student = new Student(
    name: "Ahmed",
    age: 20,
    studentId: 101,
    grade: 3.5,
  );
  student.display();
}
