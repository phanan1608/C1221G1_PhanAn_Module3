package repository.impl;

import model.Division;
import model.EducationDegree;
import repository.BaseRepository;
import repository.IDivisionRepository;
import repository.IEducationDegreeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepositoryImpl implements IDivisionRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Division> getList() {
        List<Division> divisionList = new ArrayList<>();
        Division division = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from bo_phan;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                division = new Division();
                division.setDivisionId(resultSet.getInt("ma_bo_phan"));
                division.setDivisionName(resultSet.getString("ten_bo_phan"));
                divisionList.add(division);
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
        return divisionList;
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
