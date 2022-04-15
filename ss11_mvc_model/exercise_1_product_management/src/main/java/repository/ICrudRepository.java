package repository;

import java.util.List;

public interface ICrudRepository<E> {
    List<E> getList();

    void save(E e);

    E findById(int id);

    void remove(int id);

    void update(int id, E e);
}
