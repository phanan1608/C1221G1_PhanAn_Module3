package service.impl;

import model.EducationDegree;
import model.Position;
import repository.IEducationDegreeRepository;
import repository.IPositionRepository;
import repository.impl.EducationDegreeRepositoryImpl;
import repository.impl.PositionRepositoryImpl;
import service.IEducationDegreeService;

import java.util.List;

public class EducationDegreeServiceImpl implements IEducationDegreeService {
    IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepositoryImpl();

    @Override
    public List<EducationDegree> getList() {
        return educationDegreeRepository.getList();
    }
}
