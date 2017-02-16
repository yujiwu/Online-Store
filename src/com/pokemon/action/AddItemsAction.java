package com.pokemon.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.pokemon.pojo.Item;
import com.pokemon.pojo.User;

public class AddItemsAction extends BaseAction implements ModelDriven<Item> {

	private static final long serialVersionUID = 1L;

	private Item item;

	@Override
	public Item getModel() {
		item = new Item();
		return item;
	}

	private File photo;
	private String photoContentType;
	private String photoFileName;

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	@Override
	public String execute() throws Exception {
		ServletContext application = ServletActionContext.getServletContext();
		String imgPlace = application.getRealPath("/img/"+ photoFileName);
		//read file from temp folder to indicated folder
		FileInputStream in = new FileInputStream(photo);
		FileOutputStream out = new FileOutputStream(imgPlace);
		byte [] buffer = new byte [1024];
		int len=0;
		while((len = in.read(buffer)) != -1){
			out.write(buffer, 0, len);
		}
		out.close();
		in.close();
		
		// save item into table named "item" in database
		item.setPhotoLoc("img/"+ photoFileName);
		sellerService.save(item);
		// update the connection table named "user_item" functioning as 
		// establish relationship between user and item
		Map<String, Object> session = ActionContext.getContext().getSession();
		Integer userId = ((User) session.get("user")).getUserId();
		sellerService.addItems(item.getItemId(), userId);
		return SUCCESS;
	}

}
