package cn.wow.ssm.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import cn.wow.ssm.po.ItemClassify;
import cn.wow.ssm.vo.Classify;

public class ListToXml {
	

	
		  /**
		   * 将数据库中查出来的数据放在一个xml配置文件里， 
		   * @param classifys
		   */
		  public static void parseNodeToXML(List<Classify> classifys)  {
			  File file = new File("");
			  String nowPath = file.getAbsolutePath(); //项目发布后获得tomcat里面的bin路径的绝对路径
			  int index = nowPath.lastIndexOf("bin");
			  StringBuffer newPath = new StringBuffer(nowPath);
			 //newPath = newPath.replace(index, index+3, "webapps\\wow\\xml\\node.xml");
			  
			try {
				OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream("C:\\Users\\lvlei\\Workspaces\\MyEclipse 8.6\\wow\\WebRoot\\xml\\node.xml"), "UTF-8");
				osw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				osw.write("\r\n");
				if (classifys != null && classifys.size() > 0) 
				{
				      osw.write("<menu>");
				      osw.write("\r\n");
				      for (int i = 0; i < classifys.size(); i++) {
				    	  Classify node = classifys.get(i);
				    	  osw.write("  <first>" );osw.write("\r\n");
				    	  osw.write("    <name>"+node.getFirstClassify().getName()+"</name>");osw.write("\r\n");
				    	  osw.write("    <id>"+node.getFirstClassify().getId()+"</id>");osw.write("\r\n");
				    	  osw.write("    <parent_id>"+node.getFirstClassify().getParent_id()+"</parent_id>");osw.write("\r\n");
				    	  List<ItemClassify> second = classifys.get(i).getSecondClassify();
				    	  if(second!=null && second.size()>0)
				    	  {
					    	  osw.write("    <list>");osw.write("\r\n");
					    	  for(int j = 0;j<second.size();j++)
					    	  {
					    		  osw.write("        <second>");osw.write("\r\n");
					    		  osw.write("          <name>"+second.get(j).getName()+"</name>");osw.write("\r\n");
					    		  osw.write("          <id>"+second.get(j).getId()+"</id>");osw.write("\r\n");
					    		  osw.write("          <parent_id>"+second.get(j).getParent_id()+"</parent_id>");osw.write("\r\n");
					    		  osw.write("        </second>");osw.write("\r\n");
					    		 
					    		  
					    	  }
					    	  osw.write("    </list>");osw.write("\r\n");
				    	  }
				          osw.write("  </first>");
				          osw.write("\r\n");
				      }
				      osw.write("</menu>");
				 }
				osw.flush();
				osw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		   
		  }
		
	
	
	   
	
	
}
