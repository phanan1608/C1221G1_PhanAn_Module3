package repository.impl;

import model.Customer;
import model.Employee;
import model.Service;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Employee> getList() {
        List<Employee> employeeList = new ArrayList<>();
        Employee employee = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.nhan_vien");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId(resultSet.getInt("ma_nhan_vien"));
                employee.setEmployeeName(resultSet.getString("ho_ten"));
                employee.setEmployeeBirthday(resultSet.getString("ngay_sinh"));
                employee.setEmployeeIdCard(resultSet.getString("so_cmnd"));
                employee.setEmployeeSalary(resultSet.getDouble("luong"));
                employee.setEmployeePhone(resultSet.getString("so_dien_thoai"));
                employee.setEmployeeEmail(resultSet.getString("email"));
                employee.setEmployeeAddress(resultSet.getString("dia_chi"));
                employee.setPositionId(resultSet.getInt("ma_vi_tri"));
                employee.setEducationDegreeId(resultSet.getInt("ma_trinh_do"));
                employee.setDivisionId(resultSet.getInt("ma_bo_phan"));
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return employeeList;
    }

    @Override
    public void add(Employee employee) {
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)"+
                            "value (?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());

            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void remove(int idDelete) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("delete from furama_database.nhan_vien where ma_nhan_vien=?");
            preparedStatement.setInt(1, idDelete);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Employee employee) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("update nhan_vien set ho_ten= ?, ngay_sinh =?,so_cmnd =?," +
                            "luong =?,so_dien_thoai =?,email =?,dia_chi =?,ma_vi_tri =?,ma_trinh_do=?,ma_bo_phan=? where ma_nhan_vien = ?;");
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11, employee.getEmployeeId());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public Employee findEmployeeById(int id) {
        Employee employee = null;
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.nhan_vien where ma_nhan_vien =?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId(resultSet.getInt("ma_nhan_vien"));
                employee.setEmployeeName(resultSet.getString("ho_ten"));
                employee.setEmployeeBirthday(resultSet.getString("ngay_sinh"));
                employee.setEmployeeIdCard(resultSet.getString("so_cmnd"));
                employee.setEmployeeSalary(resultSet.getDouble("luong"));
                employee.setEmployeePhone(resultSet.getString("so_dien_thoai"));
                employee.setEmployeeEmail(resultSet.getString("email"));
                employee.setEmployeeAddress(resultSet.getString("dia_chi"));
                employee.setPositionId(resultSet.getInt("ma_vi_tri"));
                employee.setEducationDegreeId(resultSet.getInt("ma_trinh_do"));
                employee.setDivisionId(resultSet.getInt("ma_bo_phan"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return employee;
    }

    @Override
    public List<Employee> searchByName(String keyword) {
        List<Employee> employeeList = new ArrayList<>();
        Employee employee = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.nhan_vien where ho_ten like ?");
            preparedStatement.setString(1, "%"+keyword+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId(resultSet.getInt("ma_nhan_vien"));
                employee.setEmployeeName(resultSet.getString("ho_ten"));
                employee.setEmployeeBirthday(resultSet.getString("ngay_sinh"));
                employee.setEmployeeIdCard(resultSet.getString("so_cmnd"));
                employee.setEmployeeSalary(resultSet.getDouble("luong"));
                employee.setEmployeePhone(resultSet.getString("so_dien_thoai"));
                employee.setEmployeeEmail(resultSet.getString("email"));
                employee.setEmployeeAddress(resultSet.getString("dia_chi"));
                employee.setPositionId(resultSet.getInt("ma_vi_tri"));
                employee.setEducationDegreeId(resultSet.getInt("ma_trinh_do"));
                employee.setDivisionId(resultSet.getInt("ma_bo_phan"));
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return employeeList;
    }
}
