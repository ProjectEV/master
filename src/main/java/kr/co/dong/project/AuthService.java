package kr.co.dong.project;

public interface AuthService {
	
	   String getAccessToken(String code);
	   
	   UserVO getUserInfo(String accessToken);
    
}