package repository;


import model.Customer;

import java.util.List;

public interface ICrudRepository<E> {
    List<E> getList();

    void add(E e);

    void remove(int idDelete);

    void update(E e);
}
