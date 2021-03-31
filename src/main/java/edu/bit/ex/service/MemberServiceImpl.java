package edu.bit.ex.service;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	private MemberMapper loginMapper;

}