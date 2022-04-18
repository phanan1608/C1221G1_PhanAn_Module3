package service;

import model.Customer;

import java.util.List;

public interface ICrudServices<E> {
    List<E> getList();

    void add(E e);

    void remove(int idDelete);

    void update(E e);
}
