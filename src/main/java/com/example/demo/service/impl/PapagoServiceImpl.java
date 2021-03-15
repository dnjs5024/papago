package com.example.demo.service.impl;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.demo.service.PapagoService;
import com.example.demo.vo.MessageVO;
import com.example.demo.vo.TranslateVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PapagoServiceImpl implements PapagoService {

	@Override
	public String getTranslate(TranslateVO tlVO) {
		String clientId = "KLmy8SB9oPjCwb5I6gLO";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "RIhB4Nmdp0";//애플리케이션 클라이언트 시크릿값";
        String source=tlVO.getSource();
        String target=tlVO.getTarget();
        String targetText=tlVO.getTargetText();
        try {
            String text = URLEncoder.encode(targetText, "UTF-8");
            System.out.println("text="+text);
            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            System.out.println("con="+con);
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source="+source+"&target="+target+"&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);          
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer sb = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	sb.append(inputLine);
            }
            br.close();
            System.out.println(sb.toString());
            ObjectMapper om = new ObjectMapper();
            MessageVO messageVO = om.readValue(sb.toString(), MessageVO.class);
            System.out.println(messageVO);
            System.out.println(messageVO.getMessage());
            Map<String,Object>rMap=(Map<String, Object>) messageVO.getMessage().get("result");
            System.out.println(rMap.get("translatedText"));
            String resut =(String) rMap.get("translatedText");
            return resut;
        } catch (Exception e) {
            System.out.println(e);
        }
		return null;
	}
}
