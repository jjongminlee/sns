package du.user.dao.impl;

import org.springframework.stereotype.Repository;

import du.user.dao.UserDAO;
import du.user.domain.UserVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class UserDAOImpl extends EgovAbstractMapper implements UserDAO {

	@Override
	public String selectPwd(String id) {
		// TODO Auto-generated method stub
		return selectOne("User.selectPwd", id);
	}

	@Override
	public void insertUser(UserVO user){
		insert("User.insertUser", user);
	}

	@Override
	public void updateUser(UserVO user) {
		// TODO Auto-generated method stub
		update("User.updateUser", user);
	}

	@Override
	public UserVO selectUserInfo(String id) {
		// TODO Auto-generated method stub
		return selectOne("User.selectUserInfo", id);
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		delete("User.deleteUser", id);
	}

}
