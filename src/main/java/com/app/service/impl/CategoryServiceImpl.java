package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Category;
import com.app.mapper.CategoryDAO;
import com.app.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService{
	@Resource CategoryDAO categoryDao;
public List<Category> getCategoryPager(@Param("skip") int skip,@Param("size") int size){
return categoryDao.getCategoryPager(skip, size);
}
public  Category getCategoryById(int id){
return categoryDao.getCategoryById(id);
}
public int getCategoryCount(){
return categoryDao.getCategoryCount();
}
public int insert(Category entity){
return categoryDao.insert(entity);
}
public int delete(int id){
return categoryDao.delete(id);
}
public int update(Category entity){
return categoryDao.update(entity);
}
public List<Category> getAllCategory(){
return categoryDao.getAllCategory();
}
@Override
public List<Category> getCategoryByCate(int category) {
	// TODO Auto-generated method stub
	return categoryDao.getCategoryByCate(category);
}

}
