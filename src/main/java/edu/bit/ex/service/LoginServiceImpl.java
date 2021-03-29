package edu.bit.ex.service;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.LoginMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class LoginServiceImpl implements LoginService {
	private LoginMapper loginMapper;

}