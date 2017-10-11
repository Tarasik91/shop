package com.myshop.util;


public class PaginationUtil {
	public static PaginationModel<?> getMaxMinValue(PaginationModel<?> model ){
		int totalSize = model.getCount();
		int maxPage =  totalSize / Constants.PAGE_SIZE;
		int currentPage = model.getPage();
		if (totalSize % Constants.PAGE_SIZE > 0){
			maxPage++;
		}
		
		if (maxPage < Constants.PAGINATION_SIZE){
			model.setMinPageNumber(1);
			model.setMaxPageNumber(maxPage);
			model.setLastPageNumber(maxPage);
		}else if (model.getPage() > maxPage - Constants.PAGINATION_SIZE){
			model.setMinPageNumber(maxPage - Constants.PAGINATION_SIZE);
			model.setMaxPageNumber(maxPage);
			model.setLastPageNumber(maxPage);
		}else {
			model.setMinPageNumber(currentPage - 2);
			model.setMaxPageNumber(currentPage + 2);
			model.setLastPageNumber(maxPage);
			
		}
		return model;
	}
}
