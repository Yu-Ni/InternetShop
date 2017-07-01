package com.cqut.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cqut.model.pojo.Commodity;
import com.cqut.model.pojo.Notice;
import com.cqut.model.service.BuyerService;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/buyerController")
public class BuyerController {
	
	@Autowired
	private BuyerService service;
	/**
	 * 
	 * @Description:根据类别名称查找商品
	 * @param @param typename
	 * @param @return   
	 * @return String  
	 * @throws
	 * @author wangnengneng
	 * @date 2017年6月20日
	 */
	@RequestMapping("/selectByTypeName")
	@ResponseBody
	public String selectByTypeName(String typename){
		List<Commodity> list=service.selectByTypeName(typename);
		return JSONArray.fromObject(list).toString();
	}
	/**
	 * 
	 * @Description: 查找所有商品
	 * @param @return   
	 * @return String  
	 * @throws
	 * @author wangnengneng
	 * @date 2017年6月20日
	 */
	@RequestMapping("/selectAll")
	@ResponseBody
	public String selectAll(){
		List<Commodity> list=service.selectAll();
		return JSONArray.fromObject(list).toString();
	}
/**
 * 
 * @Description: TODO
 * @param @return   
 * @return String  
 * @throws
 * @author wangnengneng
 * @date 2017年6月20日
 */
	@RequestMapping("/selectNotice")
	@ResponseBody
	public String selectNotice() {
		List<Notice> Noticelist=service.selectNotice();
		return JSONArray.fromObject(Noticelist).toString();
	}
	
}
