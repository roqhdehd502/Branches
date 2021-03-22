package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.PrdctImageVO;

@Mapper
public interface FileMapper {
	// @Insert("INSERT INTO prdct_image (image_number, image_name, image_path, board_id) VALUES (prdct_image_seq.nextval, #{uploadfiles},
	// 'D:/Others/Programming/Project Space/branches/branches_project/src/main/resources/static/prdct_img/', 28)")
	public void saveFile(String saveName);

	public PrdctImageVO getMagazineImage();
}