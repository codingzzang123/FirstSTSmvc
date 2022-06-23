package com.hosun.web.book.controller;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class WriteForm {
	
	  @NotNull
	  @Min(value=100000)
	  private String isbn;
	  
	  @NotEmpty(message="[필수]")
	  private String bookname;
	  
	  @NotEmpty(message="[필수]")
	  private String writer;
	  
	  @NotEmpty(message="[필수]")
	  private String publisher;
	  
	  @NotNull
	  @Min(value=5000)
	  private String price;
	  
	  @NotEmpty(message="[필수]책 소개를 간략히 입력하세요.")
	  private String info;
	
	  private MultipartFile img;

	   public String getIsbn() {
	      return isbn;
	   }
	
	   public void setIsbn(String isbn) {
	      this.isbn = isbn;
	   }
	
	   public String getbookname() {
	      return bookname;
	   }
	
	   public void setbookname(String bookname) {
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
	
	   
	   public String getInfo() {
	      return info;
	   }
	
	   public void setInfo(String info) {
	      this.info = info;
	   }
	
	   public MultipartFile getImg() {
	      return img;
	   }
	
	   public void setImg(MultipartFile img) {
	      this.img = img;
	   }
	
	   public WriteForm() {}
	
	   public WriteForm(@NotNull @Min(100000) String isbn, String bookname, String writer, String publisher,
	         @NotNull String price, String info, MultipartFile img) {
	      super();
	      this.isbn = isbn;
	      this.bookname = bookname;
	      this.writer = writer;
	      this.publisher = publisher;
	      this.price = price;
	      this.info = info;
	      this.img = img;
	   }
}
