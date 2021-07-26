package du.user.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import du.user.dao.UserDAO;
import du.user.domain.UserVO;
import du.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public Boolean selectPwd(String id, String password) {
		if(password.equals(userDAO.selectPwd(id))){
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void insertUser(UserVO user) {
		// TODO Auto-generated method stub
		userDAO.insertUser(user);
	}

	@Override
	public void updateUser(UserVO user) {
		// TODO Auto-generated method stub
		userDAO.updateUser(user);
	}

	@Override
	public UserVO selectUserInfo(String id) {
		// TODO Auto-generated method stub
		return userDAO.selectUserInfo(id);
	}

	@Override
	public Boolean loginProcess(HttpServletRequest request, UserVO user) {
		if(selectPwd(user.getUserId(), user.getPwd())) {
			setSession(request, user);
			
			return true;
		} else {
			return false;
		}
	}
	
	public void setSession(HttpServletRequest request, UserVO user) {
		UserVO userInfo = selectUserInfo(user.getUserId());
		
		if(userInfo != null) {
			HttpSession session = request.getSession(true);
			
			session.setAttribute("USER", userInfo);
		}
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		userDAO.deleteUser(id);
	}
}
