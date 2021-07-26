package du.user.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import du.user.domain.UserVO;

@Service
public interface UserService {

	public Boolean selectPwd(String id, String password);
	
	public void insertUser(UserVO user);
	
	public void updateUser(UserVO user);
	
	public UserVO selectUserInfo(String id);
	
	public Boolean loginProcess(HttpServletRequest request, UserVO user); 
	
	public void deleteUser(String id);
}
