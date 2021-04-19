package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.vo.MbrVO;

@Mapper
public interface TestLoginMapper {
	// 일반 로그인 리스트
	@Select("SELECT * FROM mbr WHERE login_number = 1")
	public List<MbrVO> getGeneralList();

	// 카카오 로그인 리스트
	@Select("SELECT * FROM mbr WHERE login_number = 2")
	public List<MbrVO> getKakaoList();

	// 네이버 로그인 리스트
	@Select("SELECT * FROM mbr WHERE login_number = 3")
	public List<MbrVO> getNaverList();

	// 구글 로그인 리스트
	@Select("SELECT * FROM mbr WHERE login_number = 4")
	public List<MbrVO> getGoogleList();
}