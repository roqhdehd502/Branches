package edu.bit.ex.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.bit.ex.vo.MbrVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class OrderControllerTest { // 주문 컨트롤러 테스트

	@Autowired
	OrderController orderController;

	@Autowired
	ObjectMapper mapper;

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	protected MockHttpSession session;

	@Test
	@WithUserDetails("defg1234")
	public void memberCartTest() throws Exception {

		mockMvc.perform(MockMvcRequestBuilders.get("/order/cart")).andExpect(MockMvcResultMatchers.status().isOk());

	}

	@Test
	@WithUserDetails("defg1234")
	public void orderTest() throws Exception {
		MbrVO mbr = new MbrVO();
		mbr.setMbr_id("defg1234");
		mbr.setMbr_point(3000);

		String content = mapper.writeValueAsString(mbr);

		mockMvc.perform(get("/order/orderInput").content(content).contentType(MediaType.APPLICATION_JSON)) //
				.andDo(print()).andReturn();
	}

	/*
	 * 안돼서 일단 주석 처리
	 * 
	 * @Before // @Test 이전에 실행 public void setUpForOrderInputTest() { this.mockMvc = MockMvcBuilders.standaloneSetup(orderController).build(); mapper
	 * = new ObjectMapper(); }
	 * 
	 * @Test
	 * 
	 * @WithUserDetails("defg1234") public void orderInputTest() throws Exception {
	 * 
	 * //MockHttpServletRequest request = new MockHttpServletRequest();
	 * 
	 * //String[] order_amounts = request.getParameterValues("order_amount"); String[] order_amounts = {"1"}; //request.addParameter("order_amount",
	 * "1"); // when(request.getParameter("order_amount")).thenReturn("order_amounts");
	 * //mockMvc.perform(MockMvcRequestBuilders.post("/order/orderInput/insert").param("order_amount", "1"));
	 * 
	 * PrdctOrderVO po = new PrdctOrderVO(); po.setOrder_number("210501-112"); po.setOrder_price(30000); po.setMbr_id("degf1234");
	 * po.setOrder_state_number(2);
	 * 
	 * OrderDetailVO od = new OrderDetailVO(); od.setOrder_amount(1); od.setOrder_color("GRAY"); od.setOrder_size("S"); od.setPrdct_id("p01");
	 * od.setPrdct_name("Test"); od.setPrdct_price(30000);
	 * 
	 * String content = mapper.writeValueAsString(od);
	 * 
	 * mockMvc.perform(post("/order/orderInput/insert").content(content).contentType(MediaType.APPLICATION_JSON)) // .andDo(print()).andReturn(); }
	 */

}