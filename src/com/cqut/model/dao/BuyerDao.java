package com.cqut.model.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.cqut.model.pojo.Buyer;
import com.cqut.model.pojo.Commodity;
import com.cqut.model.pojo.Notice;

@Repository
public interface BuyerDao {
  public List<Commodity> selectByTypeName(String typename);
  public List<Buyer> queryByUserName(String input);
  public List<Commodity> selectAll();
  public void insert(Buyer buyer);
  public void update(Buyer buyer);
  public void deleteBuyer(String buyers);
  public List<Notice> selectNotice();
}
 