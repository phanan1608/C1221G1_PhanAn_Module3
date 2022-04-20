package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Customer> getList() {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.khach_hang");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId(resultSet.getInt("ma_khach_hang"));
                customer.setCustomerTypeId(resultSet.getInt("ma_loai_khach"));
                customer.setCustomerName(resultSet.getString("ho_ten"));
                customer.setCustomerBirthday(resultSet.getString("ngay_sinh"));
                customer.setCustomerGender(resultSet.getInt("gioi_tinh"));
                customer.setCustomerIdCard(resultSet.getString("so_cmnd"));
                customer.setCustomerPhone(resultSet.getString("so_dien_thoai"));
                customer.setCustomerEmail(resultSet.getString("email"));
                customer.setCustomerAddress(resultSet.getString("dia_chi"));
                customerList.add(customer);
            }
            System.out.println(customerList.size());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customerList;
    }

    @Override
    public void add(Customer customer) {
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into furama_database.khach_hang( ma_loai_khach, ho_ten, ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) VALUES (?,?,?,?,?,?,?,?);");
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthday());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
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
                    .prepareStatement("delete from furama_database.khach_hang where ma_khach_hang=?");
            preparedStatement.setInt(1, idDelete);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(Customer customer) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("update khach_hang set ma_loai_khach= ?, ho_ten =?,ngay_sinh =?," +
                            "gioi_tinh =?,so_cmnd =?,so_dien_thoai =?,email =?,dia_chi =? where ma_khach_hang = ?;");
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthday());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setInt(9, customer.getCustomerId());

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
    public Customer findCustomerById(int id) {
        Customer customer = null;
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.khach_hang where ma_khach_hang=?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId(resultSet.getInt("ma_khach_hang"));
                customer.setCustomerTypeId(resultSet.getInt("ma_loai_khach"));
                customer.setCustomerName(resultSet.getString("ho_ten"));
                customer.setCustomerBirthday(resultSet.getString("ngay_sinh"));
                customer.setCustomerGender(resultSet.getInt("gioi_tinh"));
                customer.setCustomerIdCard(resultSet.getString("so_cmnd"));
                customer.setCustomerPhone(resultSet.getString("so_dien_thoai"));
                customer.setCustomerEmail(resultSet.getString("email"));
                customer.setCustomerAddress(resultSet.getString("dia_chi"));
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
        return customer;
    }

    @Override
    public List<Customer> searchByName(String keyword) {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.khach_hang where ho_ten like ?");
            preparedStatement.setString(1, "%" + keyword + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId(resultSet.getInt("ma_khach_hang"));
                customer.setCustomerTypeId(resultSet.getInt("ma_loai_khach"));
                customer.setCustomerName(resultSet.getString("ho_ten"));
                customer.setCustomerBirthday(resultSet.getString("ngay_sinh"));
                customer.setCustomerGender(resultSet.getInt("gioi_tinh"));
                customer.setCustomerIdCard(resultSet.getString("so_cmnd"));
                customer.setCustomerPhone(resultSet.getString("so_dien_thoai"));
                customer.setCustomerEmail(resultSet.getString("email"));
                customer.setCustomerAddress(resultSet.getString("dia_chi"));
                customerList.add(customer);
            }
            System.out.println(customerList.size());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customerList;
    }
}
