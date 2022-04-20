package service.impl;

import model.Division;
import model.Position;
import repository.IDivisionRepository;
import repository.IPositionRepository;
import repository.impl.DivisionRepositoryImpl;
import repository.impl.PositionRepositoryImpl;
import service.IDivisionService;

import java.util.List;

public class DivisionServiceImpl implements IDivisionService {
    IDivisionRepository divisionRepository = new DivisionRepositoryImpl();
    @Override
    public List<Division> getList() {
        return divisionRepository.getList();
    }
}
