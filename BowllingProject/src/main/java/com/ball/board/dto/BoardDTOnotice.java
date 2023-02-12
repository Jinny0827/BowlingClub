package com.ball.board.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("boardDTOnotice")
public class BoardDTOnotice {

	private int bno;
	private String subject;
	private String writer;
	private Date reg_date;
	private String content;
	private int readCount;
	private String imageName;
	private String imagePath;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	/*
	 *  sql Date 는 시 분 초를 지원하지 않는다. sql문 내부 아예 다까보면 시분초 자체가 없음
	 *  sysdate() : 현 시스템의 년월일시분초를 그대로 복붙 -> sql에서 사용 가능
	 *  java.util.date : sysdate()와 동일 근데 날짜 출력방식 더러움
	 */
	public Date getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "BoardDTOnotice [bno=" + bno + ", subject=" + subject + ", writer=" + writer + ", reg_date=" + reg_date
				+ ", readCount=" + readCount + ", imageName=" + imageName + ", imagePath=" + imagePath + "]";
	}

}
