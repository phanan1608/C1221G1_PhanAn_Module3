package repository.impl;

import model.RentType;
import model.ServiceType;
import repository.BaseRepository;
import repository.IRentTypeRepository;
import repository.IServiceTypeRepository;
import service.IRentTypeService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepositoryImpl implements IRentTypeRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<RentType> getList() {
        List<RentType> rentTypeList = new ArrayList<>();
        RentType rentType = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from kieu_thue;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                rentType = new RentType();
                rentType.setRentTypeId(resultSet.getInt("ma_kieu_thue"));
                rentType.setRentTypeName(resultSet.getString("ten_kieu_thue"));
                rentTypeList.add(rentType);
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
        return rentTypeList;
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
