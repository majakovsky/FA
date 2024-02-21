import java.util.*;

public class EmployeeManagementSystem {
    private Map<Integer, Employee> employees;

    public EmployeeManagementSystem() {
        employees = new HashMap<>();
    }

    public void addEmployee(Employee employee) {
        if (!employees.containsKey(employee.getId())) {
            employees.put(employee.getId(), employee);
            System.out.println("Сотрудник успешно добавлен.");
        } else {
            System.out.println("Сотрудник с таким идентификатором уже существует.");
        }
    }

    public void printEmployeeInfo(int id) {
        if (employees.containsKey(id)) {
            Employee employee = employees.get(id);
            System.out.println("Информация о сотруднике с ID " + id + ":");
            System.out.println("Имя: " + employee.getFirstName());
            System.out.println("Фамилия: " + employee.getLastName());
            System.out.println("Год рождения: " + employee.getBirthYear());
            System.out.println("Место рождения: " + employee.getBirthPlace());
            System.out.println("Зарплата: " + employee.getSalary());
            System.out.println("Семейное положение: " + employee.getMaritalStatus());
        } else {
            System.out.println("Сотрудник с таким идентификатором не найден.");
        }
    }

    public void findEmployeesByNameOrBirthYear(String query) {
        List<Employee> matchingEmployees = new ArrayList<>();
        for (Employee employee : employees.values()) {
            if (employee.getFirstName().equalsIgnoreCase(query) || employee.getBirthYear() == Integer.parseInt(query)) {
                matchingEmployees.add(employee);
            }
        }

        if (!matchingEmployees.isEmpty()) {
            System.out.println("Сотрудники совпадающие с запросом:");
            for (Employee employee : matchingEmployees) {
                System.out.println(employee.getFirstName() + " " + employee.getLastName());
            }
        } else {
            System.out.println("Сотрудники с таким именем или годом рождения не найдены.");
        }
    }

    public void updateEmployeeInfo(int id, double newSalary) {
        if (employees.containsKey(id)) {
            Employee employee = employees.get(id);
            employee.setSalary(newSalary);
            System.out.println("Информация о зарплате сотрудника с ID " + id + " успешно обновлена.");
        } else {
            System.out.println("Сотрудник с таким идентификатором не найден.");
        }
    }

    public double calculateTotalSalary() {
        double totalSalary = 0;
        for (Employee employee : employees.values()) {
            totalSalary += employee.getSalary();
        }
        return totalSalary;
    }
}