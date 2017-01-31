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

}
