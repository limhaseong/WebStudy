package com.test;

public class FriendDTO
{
	//주요 속성 구성
	private String userName = "";			//-- 이름
	private String userAge = "";			//-- 나이  int age; 도 가능
	private String gender = "";				//-- 성별
	//private String ideal;
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리할 수 있다.
	private String[] ideal;					//-- 이상형
	
	//getter / setter 구성
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	
	public String getUserAge()
	{
		return userAge;
	}
	public void setUserAge(String userAge)
	{
		this.userAge = userAge;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String[] getIdeal()				// check~!!!
	{
		return ideal;
	}
	public void setIdeal(String[] ideal)	// check~!!!
	{
		this.ideal = ideal;
	}
}
