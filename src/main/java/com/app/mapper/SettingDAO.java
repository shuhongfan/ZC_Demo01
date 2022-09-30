package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface SettingDAO {
    public List<Setting> getSettingPager(@Param("skip") int skip,@Param("size") int size);
    public  Setting getSettingById(int id);   
    public int getSettingCount();   
    public int insert(Setting entity);   
    public int delete(int id);   
    public int update(Setting entity);
	public List<Setting> getAllSetting();
}
