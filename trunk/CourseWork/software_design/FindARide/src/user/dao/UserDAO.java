package user.dao;

import user.model.UserVO;

import java.util.List;


public interface UserDAO
{
	public UserVO findByUserId(Long userId);
	
	public List<UserVO> findAll();
	
	public void addUser(UserVO userVO);
	
	public void updateUser(UserVO userVO);

	public void deleteUser(Long userID);

	public boolean isUserTableModified();

	public boolean isUsersFound();
	
}
