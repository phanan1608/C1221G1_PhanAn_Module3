package repository.impl;

import model.EducationDegree;
import model.Position;
import repository.BaseRepository;
import repository.IEducationDegreeRepository;
import repository.IPositionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepositoryImpl implements IEducationDegreeRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<EducationDegree> getList() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        EducationDegree educationDegree = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from trinh_do;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                educationDegree = new EducationDegree();
                educationDegree.setEducationDegreeId(resultSet.getInt("ma_trinh_do"));
                educationDegree.setEducationDegreeName(resultSet.getString("ten_trinh_do"));
                educationDegreeList.add(educationDegree);
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
        return educationDegreeList;
    }
}
