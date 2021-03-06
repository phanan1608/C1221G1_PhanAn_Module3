package repository.impl;

import model.Position;
import model.RentType;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImpl implements IPositionRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Position> getList() {
        List<Position> positionList = new ArrayList<>();
        Position position = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from vi_tri;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                position = new Position();
                position.setPositionId(resultSet.getInt("ma_vi_tri"));
                position.setPositionName(resultSet.getString("ten_vi_tri"));
                positionList.add(position);
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
        return positionList;
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
