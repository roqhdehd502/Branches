package edu.bit.ex.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import edu.bit.ex.vo.PrdctOrderVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderServiceTest {

	@Autowired
	private OrderService orderService;

	@Test
	public void testExist() {
		assertNotNull(orderService);
	}

	@Test
	public void getPrdctCartTest() {
		orderService.getPrdctCart("testId");
	}

	@Test
	public void insertOrderTest() {
		PrdctOrderVO po = new PrdctOrderVO();
		po.setOrder_number("210501-112");
		po.setOrder_price(30000);
		po.setMbr_id("degf1234");
		po.setOrder_state_number(2);

		orderService.insertOrder(po);
	}

}
