package com.cafe24.ourplanners.util.wordcloud;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cafe24.ourplanners.util.SearchServiceBoardCriteria;
import com.twitter.penguin.korean.tokenizer.KoreanTokenizer;
import com.twitter.penguin.korean.tokenizer.KoreanTokenizer.KoreanToken;

import scala.collection.Seq;

public class KoreanWords {
	
	/*
	  정규화 normalization (입니닼ㅋㅋ -> 입니다 ㅋㅋ, 샤릉해 -> 사랑해)

한국어를 처리하는 예시입니닼ㅋㅋㅋㅋㅋ -> 한국어를 처리하는 예시입니다 ㅋㅋ
토큰화 tokenization

한국어를 처리하는 예시입니다 ㅋㅋ -> 한국어Noun, 를Josa, 처리Noun, 하는Verb, 예시Noun, 입Adjective, 니다Eomi ㅋㅋKoreanParticle
어근화 stemming (입니다 -> 이다)

한국어를 처리하는 예시입니다 ㅋㅋ -> 한국어Noun, 를Josa, 처리Noun, 하다Verb, 예시Noun, 이다Adjective, ㅋㅋKoreanParticle
어구 추출 phrase extraction

한국어를 처리하는 예시입니다 ㅋㅋ -> 한국어, 처리, 예시, 처리하는 예시
정규화	https://open-korean-text.herokuapp.com/normalize?text=오픈코리안텍스트
토큰화	https://open-korean-text.herokuapp.com/tokenize?text=오픈코리안텍스트
어근화	https://open-korean-text.herokuapp.com/stem?text=오픈코리안텍스트
어구 추출	https://open-korean-text.herokuapp.com/extractPhrases?text=오픈코리안텍스트
	 */
	// 텍스트를 형태소 분석해서 명사만 가져오는 메소드
	public synchronized static List<SearchServiceBoardCriteria> getNounWords(SearchServiceBoardCriteria ssbcri) {
		String searchWord = ssbcri.getKeyword();
		// wordcloud에 저장할 명사 list
		List<SearchServiceBoardCriteria> wcList = new ArrayList<>();
		// 단어와 반복회수를 갖는 MAP
		Map<String, Integer> wordCountMap = new HashMap<>();
		// 단어,품사 속성을 갖는 MAP
		Map<String, String> wordPartMap = new HashMap<>();
		
		
		Seq<KoreanTokenizer.KoreanToken> tokens = KoreanTextParser.getTokens(searchWord);
		
		Seq<KoreanToken> koreanTokens = KoreanTextParser.getStemmed(tokens);
		
		List<com.twitter.penguin.korean.KoreanTokenJava> koreanTokenJavaList = KoreanTextParser.getTokensToJavaKoreanTokenList(koreanTokens);
		
		for(com.twitter.penguin.korean.KoreanTokenJava koreanTokenJava : koreanTokenJavaList) {
			
			//품사
			String part = koreanTokenJava.getPos().toString();
			//단어
			//String koreanWord = koreanTokenJava.getText().toString();
			System.out.println(koreanTokenJava.getText()+" / " + koreanTokenJava.getPos());
			if(part.equals("Noun") || part.equals("ProperNoun") || part.equals("Hashtag") || part.equals("Verb")) {
				
				System.out.println("tokenize tostring : " + koreanTokenJava.toString());
				
				String word = koreanTokenJava.getText();
				
				if(wordCountMap.get(word)==null) {
					wordCountMap.put(word, 1);
					wordPartMap.put(word, part);
				} else {
					wordCountMap.put(word, wordCountMap.get(word)+1);
				}
			}
		}
		
		for(Map.Entry<String, Integer> map : wordCountMap.entrySet()) {
			SearchServiceBoardCriteria scri = new SearchServiceBoardCriteria();
			String word = map.getKey();
			int count = map.getValue();
			//해당 단어가 형태소 분석후 여러번 나오더라도 해당 단어는 한번 검색 된 것으로 취급함
			
			//명사만 리스트에 저장
			
			String part = wordPartMap.get(word);
			
			if(part.equals("Noun"))
			{
				scri.setKeyword(word);
				
				scri.setBoard_type(ssbcri.getBoard_type());
				scri.setCategory_srl(ssbcri.getCategory_srl());
				scri.setSubcategory_srl(ssbcri.getSubcategory_srl());
				
				wcList.add(scri);
			}
			
		}
		
		return wcList;
	}
	
}
