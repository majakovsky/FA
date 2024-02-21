public class Employee {
    private int id;
    private String firstName;
    private String lastName;
    private int birthYear;
    private String birthPlace;
    private double salary;
    private String maritalStatus;

    public Employee(int id, String firstName, String lastName, int birthYear, String birthPlace, double salary, String maritalStatus) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthYear = birthYear;
        this.birthPlace = birthPlace;
        this.salary = salary;
        this.maritalStatus = maritalStatus;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public String getBirthPlace() {
        return birthPlace;
    }

    public double getSalary() {
        return salary;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}
