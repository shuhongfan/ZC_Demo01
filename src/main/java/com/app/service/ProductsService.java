package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Products;
public interface ProductsService {
    public List<Products> getProductsPager(@Param("skip") int skip,@Param("size") int size);
    public  Products getProductsById(int id);   
    public int getProductsCount();   
    public int insert(Products entity);   
    public int delete(int id);   
    public int update(Products entity);
	public List<Products> getAllProducts();
	public List<Products> getProductsByCate(int category);
	public List<Products> getProductsRand();
	public List<Products> search(String product_name);
	public List<Products> getProductsJz();
	public List<Products> getMy(String uid);
}
