package com.hosun.web.movie.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class GetInfoUtil {
	
	private static final String KEY = "e8b937d602d4a3d3bda9a5be4c9a6a44";
	private static final String API_URL = "https://api.themoviedb.org/3/";
	
	public List<ContentsVO> getInfoList(){
		//int pages = getPages(type);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = "0001-01-01";

		List<ContentsVO> infoList = null;
		List<Integer> genreList = null;
		
		
		try {
			infoList = new ArrayList<ContentsVO>();
			
			for (int i = 1; i <= 2; i++) {
				String apiURL = API_URL+ "discover/movie"  + "?api_key=" + KEY
						+ "&with_watch_providers=337&watch_region=KR&language=ko&page=" + i;
				URL url = new URL(apiURL);
				System.out.println("URL url = "+ url);
				BufferedReader bf;

				bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

				String result = bf.readLine();
				//System.out.println("result = "+result);
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
				JSONArray list = (JSONArray) jsonObject.get("results");
				
				//System.out.println("\n JSONArray list = "+list);
				
				for (int j = 0; j < list.size(); j++) {
					ContentsVO vo = new ContentsVO();
					JSONObject contents = (JSONObject) list.get(j);
					
					vo.setOriginal_title(contents.get("original_title").toString());
					vo.setPoster_path(contents.get("poster_path").toString());
					
					//System.out.println("vo.getOriginal_title = "+vo.getOriginal_title());
					//System.out.println("vo.getPoster_path = "+vo.getPoster_path());
					infoList.add(vo);
				}
			}
		}catch(Exception e) {
			
		}
		//System.out.println("결과\n"+infoList.toString());
		return infoList;
	}
}
