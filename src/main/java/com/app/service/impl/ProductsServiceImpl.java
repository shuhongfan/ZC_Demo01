package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Products;
import com.app.mapper.ProductsDAO;
import com.app.service.ProductsService;
@Service
public class ProductsServiceImpl implements ProductsService{
	@Resource ProductsDAO productsDao;
public List<Products> getProductsPager(@Param("skip") int skip,@Param("size") int size){
return productsDao.getProductsPager(skip, size);
}
public  Products getProductsById(int id){
return productsDao.getProductsById(id);
}
public int getProductsCount(){
return productsDao.getProductsCount();
}
public int insert(Products entity){
return productsDao.insert(entity);
}
public int delete(int id){
return productsDao.delete(id);
}
public int update(Products entity){
return productsDao.update(entity);
}
public List<Products> getAllProducts(){
return productsDao.getAllProducts();
}
@Override
public List<Products> getProductsByCate(int category) {
	// TODO Auto-generated method stub
	return productsDao.getProductsByCate(category);
}
@Override
public List<Products> getProductsRand() {
	// TODO Auto-generated method stub
	return productsDao.getProductsRand();
}
@Override
public List<Products> search(String product_name) {
	// TODO Auto-generated method stub
	return productsDao.search(product_name);
}
@Override
public List<Products> getMy(String uid) {
	// TODO Auto-generated method stub
	return productsDao.getMy(uid);
}
@Override
public List<Products> getProductsJz() {
	// TODO Auto-generated method stub
	return productsDao.getProductsJz();
}

}
