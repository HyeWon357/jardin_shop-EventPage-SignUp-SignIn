package com.jardin.shop.Dto;

import java.sql.Timestamp;

public class ReplyDto {
	
	int r_num; //댓글 번호
	int r_listnum; //게시판 번호
	String r_user; //사용자 아이디
	String r_pw; //사용자 비번
	String r_comment; //댓글
	Timestamp r_date; // 댓글 날짜
	
	public ReplyDto() {
		
	}
	
	public ReplyDto(int r_num, int r_listnum, String r_user, String r_pw, String r_comment, Timestamp r_date) {
		this.r_num = r_num;
		this.r_listnum = r_listnum;
		this.r_user = r_user;
		this.r_pw = r_pw;
		this.r_comment = r_comment;
		this.r_date = r_date;
	}
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getR_listnum() {
		return r_listnum;
	}
	public void setR_listnum(int r_listnum) {
		this.r_listnum = r_listnum;
	}
	public String getR_user() {
		return r_user;
	}
	public void setR_user(String r_user) {
		this.r_user = r_user;
	}
	public String getR_pw() {
		return r_pw;
	}
	public void setR_pw(String r_pw) {
		this.r_pw = r_pw;
	}
	public String getR_comment() {
		return r_comment;
	}
	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	
}
