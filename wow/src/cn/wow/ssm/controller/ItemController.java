package cn.wow.ssm.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.po.RollPic;
import cn.wow.ssm.service.ItemService;
import cn.wow.ssm.vo.Index;
import cn.wow.ssm.vo.ItemPicture;
import cn.wow.ssm.vo.ItemSortName;
import cn.wow.ssm.vo.PageBean;

@RequestMapping("/item")
@Controller
public class ItemController {
	@Resource
	private ItemService itemService;
	
	@RequestMapping("/addItem")
	public void addItem(Item item,MultipartFile item_pic,HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String originalFilename = item_pic.getOriginalFilename();
		//上传图片
		if(item_pic!=null && originalFilename!=null && originalFilename.length()>0){
			//存储图片的物理路径
			String pic_path = "F:\\Program Files\\tomcat\\wowPicture\\";
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			String url=pic_path+newFileName;
			File newFile = new File(url);
			ItemPic itemPic = new ItemPic();        
			itemPic.setUrl("/wowPic/"+newFileName);                          //设置图片的url
			itemService.insertItem1(item, itemPic);//将商品的信息和图片插入
      		item_pic.transferTo(newFile);             //将内存中的数据写入磁盘
			response.getWriter().write("添加商品成功");
		}
	}
	@RequestMapping("/insertRollPic")//上传滚动图片
	public void insertRollPic(MultipartFile pic,HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String originalFilename = pic.getOriginalFilename();
		//上传图片
		if(pic!=null && originalFilename!=null && originalFilename.length()>0){
			//存储图片的物理路径
			String pic_path = "F:\\Program Files\\tomcat\\rollPic\\";
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
			String url=pic_path+newFileName;
			File newFile = new File(url);   
			RollPic rollPic = new RollPic();
			rollPic.setUrl("/rollPic/"+newFileName);
			rollPic.setCreateTime(new Date());
			itemService.insertRollPic(rollPic);  //将商品的信息和图片插入
      		pic.transferTo(newFile);             //将内存中的数据写入磁盘
			response.getWriter().write("添加商品成功");
		}
	}
	
	//获取商品的分类信息，用于商品的添加！！！
	@RequestMapping("/gainIndex")
	public @ResponseBody Index gainItemClassify(Model model)
	{ 	Index indexDate = itemService.getIndex();
		return indexDate;
		
	}
	
    //商品的排序以及商品的展示
	@RequestMapping("/ItemOrder")
    public String ItemOrder(Integer parent_id,Integer sortId,Integer sortName,Integer id,String fuzzyName,Model model,Integer pNum)
    {
    	PageBean<ItemPicture> pageBean = null;
    	ItemSortName itemSortName= new ItemSortName();   //所有查询条件的包装类
    	itemSortName.setSortId(sortId);                  //升序还是降序
    	itemSortName.setSortName(sortName);             
    	itemSortName.setpNum(pNum);                  
    	if(parent_id==null)                              //如果parent_id为空则为模糊查询
    	{
    		itemSortName.setFuzzyName(fuzzyName);
    		pageBean = itemService.selectItemFuzzy(itemSortName);
        	model.addAttribute("fuzzyName",fuzzyName );
        	//model.addAttribute("pageBean", pageBean);
        	
    	}
    	else                                            //parent_id不为空，则是根据分类来查询
    	{
    		itemSortName.setParent_id(parent_id);
    		itemSortName.setId(id);
    		pageBean = itemService.ItemOrder(itemSortName);
    		model.addAttribute("parent_id",parent_id );
    		model.addAttribute("id", id);
    	}
    	model.addAttribute("pageBean", pageBean);      //将分页的pageBean数据传到前台
		return "item/showItem";
    }
    
    
    @RequestMapping("/selectItemFuzzy")
    public String selectItemFuzzy(String fuzzyName,Model model)
    {
    	PageBean pageBean = new PageBean();
    	ItemSortName itemSortName= new ItemSortName();
    	itemSortName.setFuzzyName(fuzzyName);   //将fuzzyName放在参数包装类中
    	pageBean = itemService.selectItemFuzzy(itemSortName);//在实体bean类已消除空格的问题
    	model.addAttribute("fuzzyName",fuzzyName );
        model.addAttribute("pageBean", pageBean);
    	return "item/showItem";
    }
    @RequestMapping("itemDetails")
    public String ItemDetails(Integer id,Model model)
    {
    	ItemPicture itemPicture = itemService.selectItemById(id);
    	model.addAttribute("itemPicture", itemPicture);
    	return "cart/itemDetails";
    }
	@RequestMapping("/showRollPic")
    public String showRollPic(Model model)
    {
        List<RollPic> rollPic = itemService.getRollPic();
        model.addAttribute("rollPic", rollPic);
        System.out.println(rollPic.size());
    	return "index";
    }
}
