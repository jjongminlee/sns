package du.board.service.impl;

import java.io.File;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap.Generator;
import org.springframework.cglib.core.GeneratorStrategy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.uuid.Generators;

import du.board.dao.BoardDAO;
import du.board.domain.BoardVO;
import du.board.service.BoardService;

import du.user.domain.UserVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service
public class BoardServiceImpl implements BoardService{

	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private EgovPropertyService propertyService;
	
	@Override
	public BoardVO selectBoard(long idx) {
		
		return boardDAO.selectBoard(idx);
	}
	
	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList();
	}
	@Override
	public void insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		
		boardDAO.insertBoard(board);
	}
	
	@Override
	public void updateBoard(BoardVO board) {
		boardDAO.updateBoard(board);
		
	}

	@Override
	public void deleteBoard(long idx) {
		boardDAO.deleteBoard(idx);
		
	}

//	private void updateBoardAttFile(BoardVO board) throws Exception{
//		// TODO Auto-generated method stub
//		String handleType = board.getHandleType();
//		BoardAttFileVO criteria = board.getCriteria();
//		boolean hasAttFile = board.hasAttFile();
//		
//		if("fix".equals(handleType)) {
//			return;
//		}
//		if(hasAttFile) {
//			deleteBoardAttFile(criteria);
//		}
//		if("del".equals(handleType)) {
//			return;
//		}else if("chg".equals(handleType)) {
//			insertBoardAttFile(board);
//		}
//	}


//	private void insertBoardAttFile(BoardVO boardVO) throws Exception{
//		if(!boardVO.isExistAttFile()) {
//			return;
//		}
//		
//		BoardAttFileVO attFileVO = new BoardAttFileVO(boardVO);
//		try {
//			uploadBoardAttFileVO(attFileVO);
//		}catch(Exception e) {
//			new RuntimeException();
//		}
//		boardDAO.insertBoardAttFile(attFileVO);
//		
//	}
//
//
//	private void uploadBoardAttFileVO(BoardAttFileVO attFileVO) throws Exception{
//		// 1. filePath
//		String fileStorePath = propertyService.getString("fileStorePath");
//		String dailyPath = LocalDate.now().toString();
//		String filePath = fileStorePath + dailyPath;
//		
//		File directory = new File(filePath);
//		if(!directory.exists()) {
//			directory.mkdir();   //폴더가 존재하지 않으면 폴더 생성.
//		}
//		attFileVO.setFilePath(filePath);
//		
//		// 2. oldFilename   MultipartFile : Multipart Resolver로 전해받은 파라미터 형태.
//		MultipartFile multipartFile = attFileVO.getAttFile();
//		String originalFilename = multipartFile.getOriginalFilename();
//		attFileVO.setOldFilename(originalFilename);
//		
//		// 3. newFilename and fileSize
//		int pos = originalFilename.lastIndexOf(".");
//		String ext = originalFilename.substring(pos);  //ext : .을 포함한 확장자 추출
//		String newFilenameBody = Generators.timeBasedGenerator().generate().toString();  // newFilenameBody : 시간기반범용 고유식별자
//		String newFilename = newFilenameBody + ext;
//		attFileVO.setNewFilename(newFilename);
//		attFileVO.setFileSize(multipartFile.getSize());	
//		
//		// 4. real file copy
//		File newFile = new File(filePath + File.separator + newFilename);
//		multipartFile.transferTo(newFile); // 서버에 저장될 파일 경로  C:/Temp/날짜.
//	}
//
//
//	@Override
//	public BoardAttFileVO findBoardAttFile(BoardAttFileVO criteria) {
//		// TODO Auto-generated method stub
//		return boardDAO.selectBoardAttFile(criteria);
//	}
//
//
//	@Override
//	public void deleteBoardAttFile(BoardAttFileVO criteria) throws Exception {
//		// TODO Auto-generated method stub
//		BoardAttFileVO attFileVO = boardDAO.selectBoardAttFile(criteria);
//		String fullAttFilePath = attFileVO.getFullAttFilePath();
//		
//		File file = new File(fullAttFilePath);
//		if(file.exists() && !file.isDirectory()) {
//			file.delete();
//		}
//		boardDAO.deleteBoardAttFile(criteria);
//	}

}
