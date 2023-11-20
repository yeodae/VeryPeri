package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.ABoardMapper;
import com.example.project.mapper.ProductMapper;
import com.example.project.model.ABoard;
import com.example.project.model.Delivery;
import com.example.project.model.Product;
import com.example.project.model.Wish;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductMapper productMapper;

	@Override
	public HashMap<String, Object> insertProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productMapper.insertProduct(map);
		resultMap.put("pNo", map.get("pNo"));
		System.out.println(resultMap);
		return resultMap;
	}

	//이미지 등록 
	@Override
	public int insertProductImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.insertProductImg(map);
	}
	//상세 이미지 등록
	@Override
	public int insertProductDetailedImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.insertProductDetailedImg(map);
	}
	
	@Override
	public HashMap<String, Object> selectProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", productMapper.selectProductList(map));
		resultMap.put("cnt", productMapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public List<Product> selectProductInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectProductInfo(map);
	}

	@Override
	public int deleteProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.deleteProduct(map);
	}

	@Override
	public int productStockPLUS(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		return productMapper.productStockPLUS(map);
	}

	
	//체크박스 찜목록 삭제
		@Override
		public int removeWishProduct(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteWishProduct(map);
		}
		
		//찜목록 상품 출력
		@Override
		public List<Wish> searchWishProdeuct(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.selectWishProdeuct(map);
		}

		//단일상품 제거
		@Override
		public int removeSingleProdeuctWish(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteSingleProdeuctWish(map);
		}
		//찜목록 전체 제거
		@Override
		public int removeAllWish(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteAllWish(map);
		}
		//장바구니 등록
		@Override
		public int editcart(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.insertcart(map);
		}


		@Override
		public HashMap<String, Object> searchProductList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", productMapper.searchProductList(map));
			resultMap.put("cnt", productMapper.selectCnt(map));
			return resultMap;
		}


		@Override
		public HashMap<String, Object> searchProductList2(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", productMapper.searchProductList2(map));
			resultMap.put("cnt", productMapper.selectCnt(map));
			return resultMap;
		}
		
		@Override
		public List<Product> selectVProductList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.selectVProductList(map);
		}


		@Override
		public int insertProductBuy(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.insertProductBuy(map);
		}


		@Override
		public int insertProductBuy2(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.insertProductBuy2(map);
		}
		
//----------------------------------------------------------------------------------------------------------나연 작업 중
//아티스트별 제품 메인 페이지 구현
		//Artist_Main + 페이징
		@Override
		public HashMap<String, Object> searchProductMain(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", productMapper.selectProductMain(map));
			return resultMap;
		}

//제품별 전체 목록 출력 페이지 구현
		//Category_Main + 페이징
		@Override
		public HashMap<String, Object> searchProductALL(HashMap<String, Object> map) {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", productMapper.selectProductALL(map));
			return resultMap;
		}

//위시리스트 담기
		@Override
		public int insertWish(HashMap<String, Object> map) {
			// 위시리스트 중복방지
	        int existingCount = productMapper.searchWish(map);
	        if (existingCount > 0) {
	            return 0; // 또는 에러 처리 등을 고려하여 적절한 값을 반환
	        }
	        return productMapper.insertWish(map);
	    }
	
//상품전체조회
		@Override
		public List<Product> searchProductNewList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.searchProductNewList(map);
		}
		
/* 베스트아이템 불러오기*/
		@Override
		public List<Product> bestItemLoad(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.bestItemLoad(map);
		}

		
		
		
//주문내역상세조회
		@Override
		public List<Product> selectOrderpuduct(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.selectOrderpuduct(map);
				}
//날짜별 주문내역조회


@Override
public List<Product> selectOrderpuductSearch(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return productMapper.selectOrderpuductSearch(map);
}

@Override
public List<Product> together(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return productMapper.together(map);
}

@Override
public Product selectProductStock(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return productMapper.selectProductStock(map);
}


		
}
