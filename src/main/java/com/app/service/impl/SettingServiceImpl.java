package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Setting;
import com.app.mapper.SettingDAO;
import com.app.service.SettingService;
@Service
public class SettingServiceImpl implements SettingService{
	@Resource SettingDAO settingDao;
public List<Setting> getSettingPager(@Param("skip") int skip,@Param("size") int size){
return settingDao.getSettingPager(skip, size);
}
public  Setting getSettingById(int id){
return settingDao.getSettingById(id);
}
public int getSettingCount(){
return settingDao.getSettingCount();
}
public int insert(Setting entity){
return settingDao.insert(entity);
}
public int delete(int id){
return settingDao.delete(id);
}
public int update(Setting entity){
return settingDao.update(entity);
}
public List<Setting> getAllSetting(){
return settingDao.getAllSetting();
}

}
