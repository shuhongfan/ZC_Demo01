package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Members;
import com.app.mapper.MembersDAO;
import com.app.service.MembersService;
@Service
public class MembersServiceImpl implements MembersService{
	@Resource MembersDAO membersDao;
public List<Members> getMembersPager(@Param("skip") int skip,@Param("size") int size){
return membersDao.getMembersPager(skip, size);
}
public  Members getMembersById(int id){
return membersDao.getMembersById(id);
}
public int getMembersCount(){
return membersDao.getMembersCount();
}
public int insert(Members entity){
return membersDao.insert(entity);
}
public int delete(int id){
return membersDao.delete(id);
}
public int update(Members entity){
return membersDao.update(entity);
}
public List<Members> getAllMembers(){
return membersDao.getAllMembers();
}
@Override
public List<Members> login(Members entity) {
	// TODO Auto-generated method stub
	return membersDao.login(entity);
}
@Override
public List<Members> getMembersByType(int type) {
	// TODO Auto-generated method stub
	return membersDao.getMembersByType(type);
}
@Override
public List<Members> getMembersByTel(String tel) {
	// TODO Auto-generated method stub
	return membersDao.getMembersByTel(tel);
}
@Override
public List<Members> login2(Members entity) {
	// TODO Auto-generated method stub
	return membersDao.login2(entity);
}

}
