package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.OrderMapper;
import com.example.project.mapper.PaymentMapper;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;
import com.example.project.model.Product;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentMapper paymentMapper;
	
	//상품 출력 
	@Override
	public List<Product> searchProductAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.selectProductAll(map);
	}
	
	@Override
	public List<DeliveryUser> searchDeliveryUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.selectDeliveryUserInfo(map);
	}
	
	//멤버쉽 유저인지 체크
	@Override
	public HashMap<String, Object> searchMembershipCheck(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int memCheck = paymentMapper.selectMembershipCheck(map);
		Product Kit = paymentMapper.selectMembershipKit(map);
		
		if(memCheck == 0) {
			//멤버쉽 구독 안함
			resultMap.put("sub", 0);
		}
		else {
			//멤버쉽 구독함
			resultMap.put("sub", 1);
		}
		
		if(Kit != null){
			//멤버쉽 키트 구매 함
			if(Kit.getKitYn() =='Y') {
				resultMap.put("kit", 1);
			}else{
				//구매 안햇음
				resultMap.put("kit", 0);
			}
		}
		
		return resultMap;
	}
	
	//결제 오더 테이블 등록
	@Override
	public HashMap<String, Object> addProductBuy(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int subscribe = paymentMapper.selectMembershipProduct(map);
		
		int kitYn = paymentMapper.selecKitProduct(map);

		//키트인지 아닌지 체크, 키트면 
		if( kitYn > 0) {
			//키트 구매이력 Y로 변경
			paymentMapper.updateMembershipKit(map);
			System.out.println("키트 맞아용 체크 함");
			}

		//멤버쉽 구독 상품 구매 체크 후 맞으면 멤버쉽 테이블 업데이트 
		if( subscribe > 0) {
			paymentMapper.insertMembership(map);
			System.out.println("멤버쉽 구독 맞아용 멤버쉽 테이블 추가함~");
			paymentMapper.updateUserMembershipY(map);
			System.out.println("멤버쉽 구독 맞아용 유저 테이블 업데이트함~");
			paymentMapper.insertGboardProfile(map);
			System.out.println("멤버쉽 구독 맞아용 프로필 업데이트함~");
			}
		
			/*
			 * if() { paymentMapper.selectMember(map); }
			 */
		
		System.out.println("위에 두 개 체크 함");
		
		//재고 업데이트
		paymentMapper.updateStock(map);
		System.out.println("재고 업데이트 함");
		
		//주문내역 테이블 업데이트 + buyNo 탈취
		paymentMapper.insertProductBuy(map);
		resultMap.put("buyNo", map.get("buyNo"));
		
		System.out.println("주문 테이블 업데이트 함");
		
		 Integer uPoint2Value = (Integer) map.get("uPoint2");
		 
		 
		 paymentMapper.paymentPointUse(map);
		
		return resultMap;
		
	}
	
	//결제 후 배송 테이블 등록 
		@Override
		public int addDelivery(HashMap<String, Object> map) {
		    // 구매한 상품이 멤버십 상품인지 확인
		    int isMembershipProduct = paymentMapper.selectMembershipProduct(map);

		    // 기본 배송 상태 설정
		    String deliveryState = "배송 완료";  // 필요에 따라 이 값을 변경하세요

		    // 멤버십 상품인 경우 배송 상태를 업데이트
		    if (isMembershipProduct > 0) {
		        deliveryState = "배송 완료";  // 멤버십 상품의 경우 다른 값으로 변경하세요
		    }

		    // 맵에 배송 상태 설정
		    map.put("dState", deliveryState);

		    // T4_DELIVERY 테이블에 삽입
			 paymentMapper.paymentPointInsert(map); 
		    return paymentMapper.insertDelivery(map);
		}

	@Override
	public HashMap<String, Object> addProductBuy2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int subscribe = paymentMapper.selectMembershipProduct(map);
		
		int kitYn = paymentMapper.selecKitProduct(map);

		//키트인지 아닌지 체크, 키트면 
		if( kitYn > 0) {
			//키트 구매이력 Y로 변경
			paymentMapper.updateMembershipKit(map);
			System.out.println("키트 맞아용 체크 함");
			}

		//멤버쉽 구독 상품 구매 체크 후 맞으면 멤버쉽 테이블 업데이트 
		if( subscribe > 0) {
			paymentMapper.insertMembership(map);
			System.out.println("멤버쉽 구독 맞아용 멤버쉽 테이블 추가함~");
			paymentMapper.updateUserMembershipY(map);
			System.out.println("멤버쉽 구독 맞아용 유저 테이블 업데이트함~");
			paymentMapper.insertGboardProfile(map);
			System.out.println("멤버쉽 구독 맞아용 프로필 업데이트함~");
			}
		
		System.out.println("위에 세 개 체크 함");
		
		//재고 업데이트
		paymentMapper.updateStock(map);
		System.out.println("재고 업데이트 함");
		
		//주문내역 테이블 업데이트 + buyNo 탈취
		paymentMapper.insertProductBuy(map);
		resultMap.put("buyNo", map.get("buyNo"));
		
		System.out.println("주문 테이블 업데이트 함");
		
		return resultMap;
	}

	@Override
	public int addDelivery2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.insertDelivery(map);
	}
	
	@Override
	public int addDelivery3(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.insertNonDelivery(map);
	}
	
	@Override
	public int useUserPoint2(HashMap<String, Object> map) {
	    // TODO Auto-generated method stub
	    Integer uPoint2Value = (Integer) map.get("uPoint2");

	    if (uPoint2Value == null || uPoint2Value == 0) {
	        // uPoint2가 0원이거나 null인 경우
	        return paymentMapper.paymentPointUse(map);
	    } else {
	        // uPoint2가 값이 있는 경우
	        paymentMapper.paymentPointUse(map);
	        return paymentMapper.paymentPointInsert(map);
	    }
	}




	
}
