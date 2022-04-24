package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypRepositoryImpl implements ICustomerTypeRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<CustomerType> getList() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        CustomerType customerType = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.loai_khach");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customerType = new CustomerType();
                customerType.setCustomerTypeId(resultSet.getInt("ma_loai_khach"));
                customerType.setCustomerTypeName(resultSet.getString("ten_loai_khach"));

                customerTypeList.add(customerType);
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
        return customerTypeList;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
