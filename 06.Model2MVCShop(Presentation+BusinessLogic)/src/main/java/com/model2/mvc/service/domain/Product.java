package com.model2.mvc.service.domain;

import java.sql.Date;

import org.springframework.web.bind.annotation.RequestMapping;

public class Product {

	private String fileName;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode;

	public Product() {
	}

	public String getProTranCode() {
		return proTranCode;
	}

	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getManuDate() {
		return manuDate;
	}

	public void setManuDate(String manuDate) {

		if (manuDate.length() == 10) {
			String[] md = manuDate.split("-");
			String y = md[0];
			String m = md[1];
			String d = md[2];

			this.manuDate = y + m + d;
		}else {
			this.manuDate=manuDate;
		}

	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	// Override
	public String toString() {
		return "ProductVO : [fileName]" + fileName + "[manuDate]" + manuDate + "[price]" + price + "[prodDetail]"
				+ prodDetail + "[prodName]" + prodName + "[prodNo]" + prodNo;
	}
}