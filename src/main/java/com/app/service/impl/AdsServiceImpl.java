package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Ads;
import com.app.mapper.AdsDAO;
import com.app.service.AdsService;
@Service
public class AdsServiceImpl implements AdsService{
	@Resource AdsDAO adsDao;
public List<Ads> getAdsPager(@Param("skip") int skip,@Param("size") int size){
return adsDao.getAdsPager(skip, size);
}
public  Ads getAdsById(int id){
return adsDao.getAdsById(id);
}
public int getAdsCount(){
return adsDao.getAdsCount();
}
public int insert(Ads entity){
return adsDao.insert(entity);
}
public int delete(int id){
return adsDao.delete(id);
}
public int update(Ads entity){
return adsDao.update(entity);
}
public List<Ads> getAllAds(){
return adsDao.getAllAds();
}

}
