/*===================
 	GuestDTO.java
===================*/

package com.test;

public class GuestDTO
{
	// 주요 속성 구성
	private String name = "";		//-- 게시물 작성자
	private String title = "";		//-- 게시물 제목
	private String content = "";	//-- 게시물 내용
	
	// ※ 여기에서 사용하는 변수명(속성명)의 앞 두 글자는 소문자로 작성할 것~!!!
	//    numScore  →  getNumScore() / setNumScore()
	//	  nScore	→  getNScore()   / setNScore() → 대문자가 겹치면서 종종 버전이나 플랫폼에서 충돌날 경우가 있음
	//				    getnScore()   / setnScore() → 이렇게 될 수 있음
	//				    getNscore()   / setNscore() → 이렇게 될 수 있음
	//	  와 같이 setter 가 속성명을 불러오는 과정에서
	//    인식이 어긋나는 경우가 발생할 수 있기 때문...
	
	// ※ 여기에서 사용하는 변수명(속성명)은
	//    HTML 의 form 태그에서 name 속성으로 지정하여 사용할 것.
	//    그래야 속성 데이터 수신 및 속성 매핑을
	//    액션 태그를 활용하여 자동으로 처리해줄 수 있기 때문...
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
}
