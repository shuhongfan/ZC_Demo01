package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Ads;
public interface AdsService {
    public List<Ads> getAdsPager(@Param("skip") int skip,@Param("size") int size);
    public  Ads getAdsById(int id);   
    public int getAdsCount();   
    public int insert(Ads entity);   
    public int delete(int id);   
    public int update(Ads entity);
	public List<Ads> getAllAds();
}
