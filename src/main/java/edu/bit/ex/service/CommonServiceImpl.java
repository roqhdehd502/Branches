package edu.bit.ex.service;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.CommonMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class CommonServiceImpl implements CommonService {
	private CommonMapper commonMapper;

}