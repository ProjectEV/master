package kr.co.dong.project;

public interface AuthService {
	
	String getAccessToken(String code);
	
    NaverUserInfo getUserInfo(String accessToken);
    
}