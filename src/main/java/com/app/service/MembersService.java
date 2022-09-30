package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Members;
public interface MembersService {
    public List<Members> getMembersPager(@Param("skip") int skip,@Param("size") int size);
    public  Members getMembersById(int id);   
    public int getMembersCount();   
    public int insert(Members entity);   
    public int delete(int id);   
    public int update(Members entity);
	public List<Members> getAllMembers();
	public List<Members> getMembersByType(int type);
	public List<Members> login(Members entity);
	public List<Members> getMembersByTel(String tel);
	public List<Members> login2(Members entity);
}
