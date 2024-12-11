package kr.co.dong.project;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AuthServiceImpl implements AuthService {

   private final String clientId = "UKU4azkZUS5fj9tK1XKf"; // 네이버 애플리케이션 ID
    private final String clientSecret = "0sYLTZYnY9"; // 네이버 애플리케이션 Secret
   
   
    @Override
    public String getAccessToken(String code) {
        String url = "https://nid.naver.com/oauth2.0/token"
            + "?grant_type=authorization_code"
            + "&client_id=" + clientId
            + "&client_secret=" + clientSecret
            + "&code=" + code
            + "&state=STATE_STRING";

        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(url, String.class);

        // 응답을 JSON으로 파싱
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response);
      
            return jsonNode.get("access_token").asText(); // 액세스 토큰 추출
        } catch (Exception e) {
            throw new RuntimeException("Failed to parse access token response", e);
        }
    }

    // 네이버 사용자 정보 요청
    @Override
    public UserVO getUserInfo(String accessToken) {
        String url = "https://openapi.naver.com/v1/nid/me";
        
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken); // 액세스 토큰 설정
        HttpEntity<String> entity = new HttpEntity<>(headers);

        // 네이버 API에 요청을 보내고 응답 받기
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        String response = responseEntity.getBody();

        // JSON 응답을 파싱
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response);  // 응답을 JSON으로 변환
            JsonNode responseNode = jsonNode.get("response");

            String user_name = responseNode.get("name").asText();
            String user_id = responseNode.get("email").asText();
            String user_phone = responseNode.get("mobile").asText();
            String user_password = "12345678";
            
            

            return new UserVO(user_name, user_id, user_phone, user_password); // NaverUserInfo 객체 반환
            
        } catch (Exception e) {
            throw new RuntimeException("Failed to parse user info response", e);
        }
    }
}
