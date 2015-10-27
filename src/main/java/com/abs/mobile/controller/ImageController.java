package com.abs.mobile.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.service.CartService;
import com.abs.mobile.service.OrderService;
import com.abs.util.exception.BusinessException;
import com.abs.weixin.utils.Sign;

import sun.misc.BASE64Decoder;   
import sun.misc.BASE64Encoder;

@Controller
@RequestMapping("/mobile/image")
public class ImageController extends BaseController {
	
    /**
     * 上传图片
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/upLoadImage")
    @ResponseBody
    public Result upLoadImage(String formFile,HttpServletRequest httpRequest) throws BusinessException {
        
        Result request = new Result();
        Map<String, Object> resultMap =  new HashMap<String, Object>();
        
        // 配置Tomcat 参考tomcat.cfg
        String projectPath = "/yyyy/userImg";
        String realPathString = "c:\\yyyy\\userImg";
        
        String imgPath = uploadFile(formFile,projectPath,realPathString);//进行文件上传操作，上传到服务器中存放（这里是上传到服务器项目文件夹中存到）  
        
//        boolean result = false;//最终上传成功与否的标志  
          
//        custCheckInfo = new CustomerCheckInfo();  
//        custCheckInfo.setCust_tax_code(cust_tax_code);  
//        custCheckInfo.setPhonenum(phoneNum);  
//        custCheckInfo.setUpdate_time(df.format(new Date()));  
//          
//        boolean save_flag = customerService.saveRegistCertInfo(custCheckInfo);//保存路径  
//          
//        //判断数据库中的路径是否存在，并且文件夹中的文件是否存在(判断是否上传成功的标志)  
//        boolean is_success = isSuccessUpload(licenceName, cust_tax_code, phoneNum);  
//        if(save_flag && is_success){  
//            result = true;  
//        }  
//          
//        //如果证件上传成功，则记录到记录表中  
//        if(result){  
//            StateRecordInfo record = new StateRecordInfo();  
//            record.setCust_tax_code(cust_tax_code);  
//            record.setPhonenum(phoneNum);  
//            record.setState_id(state_id);  
//              
//            saveStateRecord(record);//执行状态保存操作  
//        }  
        
        resultMap.put("imgPath", imgPath);
        request.setData(resultMap);
        return request;
    }
    
    
    /**
     * 
     * @param fileData
     * @param realPathString 
     * @param projectPath 
     * @param fileName
     * @return
     */
    public String uploadFile(String fileData, String projectPath, String realPathString){  
        //在自己的项目中构造出一个用于存放用户照片的文件夹  
        //如果此文件夹不存在则创建一个  
        File f = new File(realPathString);  
        if(!f.exists()){  
            f.mkdir();  
        }  
        //拼接文件名称，不存在就创建  
        String nonce_str = Sign.create_nonce_str();
        
        realPathString = realPathString + "/" + nonce_str + ".jpg";  
        f = new File(realPathString);  
        if(!f.exists()){  
            f.mkdir();  
        }  
          
        //log.info("====文件保存的位置："+imgPath);  
          
        //使用BASE64对图片文件数据进行解码操作  
        BASE64Decoder decoder = new BASE64Decoder();  
        try {  
            //通过Base64解密，将图片数据解密成字节数组  
            byte[] bytes = decoder.decodeBuffer(fileData);  
            //构造字节数组输入流  
            ByteArrayInputStream bais = new ByteArrayInputStream(bytes);  
            //读取输入流的数据  
            BufferedImage bi = ImageIO.read(bais);  
            //将数据信息写进图片文件中  
            ImageIO.write(bi, "jpg", f);// 不管输出什么格式图片，此处不需改动  
            bais.close();  
        } catch (Exception e) {
            
        }  
        return projectPath+ "/" + nonce_str + ".jpg";  
    }  
    
}
