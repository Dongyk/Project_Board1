package com.project.board.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.dao.BoardDao;
import com.project.board.dto.BoardDto;


@Controller
public class BoardServiceImpl implements BoardService {
	private static final int PAGE_ROW_COUNT=2;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=10;	
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public ModelAndView getList(HttpServletRequest request, int b_group) {
		final int PAGE_DISPLAY_COUNT=3;
				
		String endPageNum = request.getParameter("endPageNum");

		if(endPageNum == null){
			endPageNum = ""+PAGE_DISPLAY_COUNT;
		}
		//시작 row 번호와 끝 row 번호를 dto 에 담는다. 
		BoardDto dto=new BoardDto();
		dto.setStartRowNum(1);
		dto.setEndRowNum(Integer.parseInt(endPageNum));
		dto.setB_group(b_group);
		
		//1. BoardDao 객체를 이용해서 글목록을 얻어온다. 
		List<BoardDto> list=boardDao.getSelList(dto);
		
		String endRowNum =  "" + boardDao.getSelect_list(b_group);
		//2. 모델을 request 에 담는다.
		ModelAndView mView = new ModelAndView();
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("endRowNum", endRowNum);
		mView.addObject("list", list);
		
		mView.addObject("b_group", b_group);
		return mView;
	}

	@Override
	public void insert(HttpServletRequest request, BoardDto dto) {
		
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");
		System.out.println(realPath);
		
		//MultipartFile 객체의 참조값 얻어오기
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile=dto.getmFile();
		//원본 파일명
		if(mFile != null){
			System.out.println("mFile is not null");
			String orgFileName=mFile.getOriginalFilename();
			//파일 사이즈
			long fileSize=mFile.getSize();
			//저장할 파일의 상세 경로
			String filePath=realPath+File.separator;
			//디렉토리를 만들 파일 객체 생성
			File file=new File(filePath);
			if(!file.exists()){//디렉토리가 존재하지 않는다면
				file.mkdir();//디렉토리를 만든다.
			}
			//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			String saveFileName=System.currentTimeMillis()+orgFileName;
			try{
				//upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath+saveFileName));
			}catch(Exception e){
				e.printStackTrace();
			}
			dto.setImage(filePath+saveFileName);
		}
		boardDao.insert(dto);
	}

	@Override
	public void update(BoardDto dto) {
		boardDao.update(dto);
	}

	@Override
	public void delete(int num) {
		boardDao.delete(num);
	}

	@Override
	public ModelAndView updateForm(HttpServletRequest request, int num) {
		//수정할 글정보를 얻어온다. 
		BoardDto dto=boardDao.getData(num);
		//수정할 글정보를 ModelAndView 객체에 담고 
		ModelAndView mView=new ModelAndView();
		mView.addObject("dto", dto);
		//리턴해준다. 
		return mView;
	}

	@Override
	public ModelAndView insertForm(int b_group) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ModelAndView getList1(HttpServletRequest request, int pageNum) {
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		//CafeDto 객체를 생성해서
		BoardDto dto=new BoardDto();
		if(keyword != null){ //검색어가 전달된 경우
			if(condition.equals("titlecontent")){ //제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")){//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")){//작성자 검색
				dto.setWriter(keyword);
			}
			// list.jsp 뷰페이지에서 필요한 내용을 request 에 담는다.
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = boardDao.getCount1();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		//시작 row 번호와 끝 row 번호를 CafeDto 에 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//Dao 객체를 이용해서 글목록을 얻어온다. 
		List<BoardDto> list=boardDao.getList(dto);
		//ModelAndView 객체를 생성해서 글목록을 담는다.
		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		
		//리턴해주기 
		return mView;
	}

	@Override
	public ModelAndView getTotal_image() {
		
		List<BoardDto> list=boardDao.getTotal_image();
	
		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		
		return mView;
	}
}
