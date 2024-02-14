package com.rentcar.frontController;

import java.util.HashMap;

import com.rentcar.controller.rentcar.CarListController;
import com.rentcar.controller.user.LoginCheckController;
import com.rentcar.controller.user.LoginOutController;
import com.rentcar.controller.user.MainController;
import com.rentcar.controller.user.UserInfoController;

public class HandlerMapping {
  private HashMap<String, Controller> mappings;
  public HandlerMapping() { 
	  mappings=new HashMap<String, Controller>();
	  mappings.put("/main.do", new MainController());
//	  mappings.put("/join.do", new JoinUserController());	
	  mappings.put("/loginCheck.do", new LoginCheckController());	
	  mappings.put("/loginOut.do", new LoginOutController());	
//	  mappings.put("/validateId.do", new ValidateIdController());
	  mappings.put("/userInfo.do", new UserInfoController());
//	  mappings.put("/updateUser.do", new UpdateUserController()); 
//	  mappings.put("/deleteUser.do", new DeleteUserController());
//	  
	  mappings.put("/carList.do", new CarListController());
//	  mappings.put("/selectCarOption.do", new SelectCarOptionController());
//	  mappings.put("/reservateCar.do", new ReservateCarController());
//	  mappings.put("/userReserveList.do", new UserReserveListController());
//	  mappings.put("/deleteRes.do", new DeleteResController());
//	  
//	  mappings.put("/uploadCarImg.do", new UploadCarImgController());
//	  mappings.put("/insertCar.do", new InsertCarController());
//	  mappings.put("/rentcarInfo.do", new CarInfoController());
	  
	 
	  

  }
  public Controller getController(String key) { 
	  return mappings.get(key);
  }
}
