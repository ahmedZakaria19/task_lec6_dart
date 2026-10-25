abstract class Employee {
  String name;
  String employeeId;

  Employee(this.name, this.employeeId);
  double calculateSalary();

  void displayDetails() {
    print('ID: $employeeId | Name: $name | Total Salary: \$${calculateSalary().toStringAsFixed(2)}');
  }
}
class FullTimeEmployee extends Employee {
  double monthlySalary;
  double bonus;

  FullTimeEmployee(String name, String employeeId, this.monthlySalary, [this.bonus = 0.0])
      : super(name, employeeId);

  @override
  double calculateSalary() {
    return monthlySalary + bonus;
  }
}

class PartTimeEmployee extends Employee {
  double hourlyRate;
  double hoursWorked;

  PartTimeEmployee(String name, String employeeId, this.hourlyRate, this.hoursWorked)
      : super(name, employeeId);

  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked;
  }
}
void main() {
  FullTimeEmployee employee1 = new FullTimeEmployee('Ahmed', '101', 10000);
  employee1.displayDetails();
  print('Salary: ${employee1.calculateSalary()}');
  PartTimeEmployee employee2 = new PartTimeEmployee('Zakaria', '102', 20, 40);
  employee2.displayDetails();
  print('Salary: ${employee2.calculateSalary()}');
}