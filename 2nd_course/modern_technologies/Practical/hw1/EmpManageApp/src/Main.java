import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        EmployeeManagementSystem system = new EmployeeManagementSystem();

        // Пример: добавление сотрудников и вывод информации о них
        system.addEmployee(new Employee(1, "Иван", "Иванов", 1985, "Москва", 50000, "Женат"));
        system.addEmployee(new Employee(2, "Петр", "Петров", 1990, "Санкт-Петербург", 60000, "Женат"));

        // Вывод информации о сотрудниках
        system.printEmployeeInfo(1);
        system.printEmployeeInfo(2);
    }
}