package service.impl;

import model.Position;
import model.RentType;
import repository.IPositionRepository;
import repository.IRentTypeRepository;
import repository.impl.PositionRepositoryImpl;
import repository.impl.RentTypeRepositoryImpl;
import service.IPositionService;
import service.IRentTypeService;

import java.util.List;

public class PositionServiceImpl implements IPositionService {
    IPositionRepository positionRepository = new PositionRepositoryImpl();
    @Override
    public List<Position> getList() {
        return positionRepository.getList();
    }
}
