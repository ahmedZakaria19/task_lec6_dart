class Student {
  String _name;
  int _age;
  double _grade;
  set name(String name) => _name = name;
  set age(int age) {
    if (age > 0) _age = age;
  }
  set grade(double grade) => _grade = grade;
  Student(this._name, this._age, this._grade);
  String get name => _name;
  int get age => _age;
  double get grade => _grade;
}

void main() {
  Student student = new Student("Ahmed", 20, 3.5);
  student.name = "Zakaria";
  student.age = 25;
  student.grade = 2.85;
  print(student.name);
  print(student.age);
  print(student.grade);
}
