package com.tje.model;


	public class PageMaker {

	    private int totalCount;
	    private int startPage;
	    private int endPage;
	    private boolean prev;
	    private boolean next;
	    
	    
	    
	    

	    public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public int getDisplayPageNum() {
			return displayPageNum;
		}

		public void setDisplayPageNum(int displayPageNum) {
			this.displayPageNum = displayPageNum;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public Criteria getCriteria() {
			return criteria;
		}

		// 하단 페이지 번호의 갯수를 의미
	    private int displayPageNum = 10;

	    private Criteria criteria;

	    public void setCriteria(Criteria criteria) {
	        this.criteria = criteria;
	    }

	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        calcData();
	    }

	    // 게시글의 전체 갯수가 설정되는 시점에 calcData()메서드를 호출하여 필요한 데이터들을 계산
	    private void calcData() {
	    	// 끝 페이지 번호 = Math.ceil(현재페이지/ 페이지 번호의 갯수) * 페이지 번호의 갯수)
	         endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);

	        startPage = (endPage - displayPageNum) + 1;

	        int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));

	        if (endPage > tempEndPage) {
	            endPage = tempEndPage;
	        }

	         prev = startPage == 1 ? false : true;
	        
	        
	        // 다음 링크 = 끝페이지 * 페이지 당 출력할 게시글의 갯수 >= 전체 게시글의 갯수 ? : false : true;
	         next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;

	    }
	}

