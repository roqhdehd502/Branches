package edu.bit.ex.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.service.FileService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/file/*")
public class FileController {
	private FileService fileService;

	// 테스트 인덱스 페이지(리다이렉트용)
	@GetMapping("/index")
	public ModelAndView index(ModelAndView mav) {
		log.info("index...");
		mav.setViewName("file/index");
		return mav;
	}

	// 테스트 파일 업로드 페이지
	@GetMapping("/upload_view")
	public ModelAndView upload_view(ModelAndView mav) {
		log.info("upload_view...");
		mav.setViewName("file/upload_view");
		return mav;
	}

	// 테스트 파일 업로드
	@PostMapping("/fileupload")
	public ResponseEntity<String> upload(@RequestBody MultipartFile[] uploadfiles) {
		ResponseEntity<String> entity = null;
		log.info("upload...");

		try {
			for (MultipartFile f : uploadfiles) {
				fileService.saveFile(f);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}