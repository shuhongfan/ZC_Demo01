package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface CategoryDAO {
    public List<Category> getCategoryPager(@Param("skip") int skip,@Param("size") int size);
    public  Category getCategoryById(int id);   
    public int getCategoryCount();   
    public int insert(Category entity);   
    public int delete(int id);   
    public int update(Category entity);
	public List<Category> getAllCategory();
	public List<Category> getCategoryByCate(int category);
}
