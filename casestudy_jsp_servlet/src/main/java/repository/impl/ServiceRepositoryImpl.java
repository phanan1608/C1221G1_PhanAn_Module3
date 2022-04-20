package repository.impl;

import model.Customer;
import model.Service;
import repository.BaseRepository;
import repository.IServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements IServiceRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Service> getList() {
        List<Service> serviceList = new ArrayList<>();
        Service service = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB().prepareStatement("select * from furama_database.dich_vu");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                service = new Service();
                service.setServiceId(resultSet.getInt("ma_dich_vu"));
                service.setServiceName(resultSet.getString("ten_dich_vu"));
                service.setServiceArea(resultSet.getInt("dien_tich"));
                service.setServiceCost(resultSet.getDouble("chi_phi_thue"));
                service.setServiceMaxPeople(resultSet.getInt("so_nguoi_toi_da"));
                service.setRentTypeId(resultSet.getInt("ma_kieu_thue"));
                service.setServiceTypeId(resultSet.getInt("ma_loai_dich_vu"));
                service.setStandardRoom(resultSet.getString("tieu_chuan_phong"));
                service.setDescriptionOtherConvenience(resultSet.getString("mo_ta_tien_nghi"));
                service.setPoolArea(resultSet.getDouble("dien_tich_ho_boi"));
                service.setNumberOfFloor(resultSet.getInt("so_tang"));
                serviceList.add(service);
            }
            System.out.println(serviceList.size());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return serviceList;
    }

    @Override
    public void add(Service service) {
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu," +
                            "                     tieu_chuan_phong, mo_ta_tien_nghi, dien_tich_ho_boi, so_tang)" +
                            "    value (?,?,?,?,?,?,?,?,?,?);");
            preparedStatement.setString(1, service.getServiceName());
            preparedStatement.setDouble(2, service.getPoolArea());
            preparedStatement.setDouble(3, service.getServiceCost());
            preparedStatement.setInt(4, service.getServiceMaxPeople());
            preparedStatement.setInt(5, service.getRentTypeId());
            preparedStatement.setInt(6, service.getServiceTypeId());
            preparedStatement.setString(7, service.getStandardRoom());
            preparedStatement.setString(8, service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, service.getPoolArea());
            preparedStatement.setInt(10, service.getNumberOfFloor());
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

    }

    @Override
    public void update(Service service) {

    }
}
