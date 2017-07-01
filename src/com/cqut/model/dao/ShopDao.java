package com.cqut.model.dao;
import org.springframework.stereotype.Repository;
import com.cqut.model.pojo.Shop;

@Repository
public interface ShopDao {
	public Shop getShopInfo(String SessionUser);
	public void insertInd(Shop shop);

}
