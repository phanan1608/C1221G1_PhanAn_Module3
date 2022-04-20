package repository.impl;

import model.CustomerType;
import model.ServiceType;
import repository.BaseRepository;
import repository.IServiceTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepositoryImpl implements IServiceTypeRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<ServiceType> getList() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        ServiceType serviceType = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from loai_dich_vu;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                serviceType = new ServiceType();
                serviceType.setServiceTypeId(resultSet.getInt("ma_loai_dich_vu"));
                serviceType.setServiceTypeName(resultSet.getString("ten_loai_dich_vu"));
                serviceTypeList.add(serviceType);
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
        return serviceTypeList;
    }
}
