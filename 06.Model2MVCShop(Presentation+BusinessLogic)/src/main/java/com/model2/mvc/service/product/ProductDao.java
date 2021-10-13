package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	
	// INSERT
	public void insertProduct(Product product) throws Exception;

	// SELECT ONE
	public Product getProduct(int prodNo) throws Exception;
	
	// SELECT LIST
	public List<Product> getProductList(Search search) throws Exception;
	
	// UPDATE
	public void updateProduct(Product product) throws Exception;

	public int getTotalCount(Search search) throws Exception;

}
