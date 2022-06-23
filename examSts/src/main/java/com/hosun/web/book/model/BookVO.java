package com.hosun.web.book.model;

public class BookVO {
	private int no;
	private String bookname;
	private String writer;
	private String publisher;
	private String price;
	private String img;
	private String info;
	private int isbn;
	
	public BookVO() {}

	public BookVO(String bookname, String writer, String publisher, String price, String img, String info,
			int isbn) {
		super();
		this.bookname = bookname;
		this.writer = writer;
		this.publisher = publisher;
		this.price = price;
		this.img = img;
		this.info = info;
		this.isbn = isbn;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	
}

 