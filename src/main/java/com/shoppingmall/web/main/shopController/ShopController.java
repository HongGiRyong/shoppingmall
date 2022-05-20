package com.shoppingmall.web.main.shopController;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingmall.web.main.item.ItemVo;
import com.shoppingmall.web.main.shopService.ShopService;

@Controller
public class ShopController {
	private ShopService shopService;
	private SearchCommand searchCommand1;

	@Autowired
	public ShopController(ShopService shopService) {
		this.shopService = shopService;
	}

	public void setSearchCommand(SearchCommand searchCommand) {
		this.searchCommand1 = searchCommand;
	}

	@RequestMapping(value = "/jmain", method = RequestMethod.GET)
	public String test(@RequestParam(defaultValue = "1") int vpage, Model model, HttpSession session) {
		List<ItemVo> result = shopService.allList();
		int listCnt = shopService.allcount();// db 등에서 전체 게시물 카운트 해서 값 가져오기
		int lastpage = (int) (Math.ceil((double) listCnt / 10)); // 올림 메소드(소수점을 올려서 정수로 내보냄) 그리고 한 페이지에 데이터를 10개씩 보여줌
		System.out.println(vpage);
		int test = vpage * 10;
		int hap = test - 10;
		List<ItemVo> index = new ArrayList<ItemVo>();
		for (int i = hap; i < test; i++) {
			if (i == listCnt) {
				break;
			} else {
				index.add(result.get(i));
			}
		}
		model.addAttribute("lastpage", lastpage);
		// 토탈 데이터 갯수가 10개 이하라면 1 10개씩 끊는다.
		model.addAttribute("allList", index);
		return "main/jmain";
	}

	@RequestMapping(value = "/jmain", method = RequestMethod.POST)
	public String search(@ModelAttribute("cmd") SearchCommand searchCommand,
			@RequestParam(defaultValue = "1") int vpage, HttpServletResponse response, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		setSearchCommand(searchCommand);
		if (searchCommand.getItemcatecode().equals("F")) {
			List<ItemVo> search = shopService.searchAll(searchCommand.getKeyword());

			int listCnt = shopService.keycount(searchCommand.getKeyword());
			int lastpage = (int) (Math.ceil((double) listCnt / 10));
			int test = vpage * 10;
			int hap = test - 10;
			List<ItemVo> index = new ArrayList<ItemVo>();
			for (int i = hap; i < test; i++) {
				if (i == listCnt) {
					break;
				} else {
					index.add(search.get(i));
				}
			}
			model.addAttribute("lastpage", lastpage);
			// 토탈 데이터 갯수가 10개 이하라면 1 10개씩 끊는다.
			model.addAttribute("search", index);
		} else {
			List<ItemVo> search = shopService.search(searchCommand.getKeyword(), searchCommand.getItemcatecode());

			int listCnt = shopService.keycatecount(searchCommand.getKeyword(), searchCommand.getItemcatecode());
			int lastpage = (int) (Math.ceil((double) listCnt / 10));
			int test = vpage * 10;
			int hap = test - 10;
			List<ItemVo> index = new ArrayList<ItemVo>();
			for (int i = hap; i < test; i++) {
				if (i == listCnt) {
					break;
				} else {
					index.add(search.get(i));
				}
			}
			model.addAttribute("lastpage", lastpage);
			// 토탈 데이터 갯수가 10개 이하라면 1 10개씩 끊는다.
			model.addAttribute("search", index);
		}
		System.out.println(searchCommand.getItemcatecode());
		System.out.println(searchCommand.getKeyword());
		Cookie[] cookies = request.getCookies(); // 모든 쿠키를 배열로 가져온다.
		List<String> cook = new ArrayList<String>();// 그 쿠키를 리스트에 담을 리스트 생성한다.
		if (cookies != null) {// 만약에 쿠키배열이 값이 있다
			for (Cookie c : cookies) { // 쿠키
				try {
					System.out.println(c.getName());
					cook.add(URLDecoder.decode(c.getName(), "UTF-8"));
					for (int i = 0; i < cook.size(); i++) {
						if (cook.get(i).equals("JSESSIONID")) {
							System.out.println(cook.get(i));
//									cook.remove("JSESSIONID");

						}
					}

					model.addAttribute("cookies", cook);

				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			for (int j = 0; j < cook.size(); j++) {
				if (!cook.get(j).equals(searchCommand.getKeyword())) {
					if (session != null) {
						Cookie cookie;
						try {
							cookie = new Cookie(URLEncoder.encode(searchCommand.getKeyword(), "utf-8"),
									URLEncoder.encode(searchCommand.getKeyword(), "utf-8"));
							cookie.setMaxAge(60 * 60 * 24);
							// cookie.setMaxAge(10);
							cookie.setPath("/");
							response.addCookie(cookie);
//							cook.add(URLDecoder.decode(cookie.getValue(), "UTF-8"));
//							model.addAttribute("cookies",cook);
							// model.addAttribute("cookie",searchCommand.getKeyword());
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					} else {
						if (request.getCookies() == null) {
							Cookie cookie;
							try {
								cookie = new Cookie(URLEncoder.encode(searchCommand.getKeyword(), "utf-8"),
										URLEncoder.encode(searchCommand.getKeyword(), "utf-8"));
								cookie.setMaxAge(60 * 60 * 24);
								// cookie.setMaxAge(10);
								cookie.setPath("/");
								response.addCookie(cookie);
//								cook.add(URLDecoder.decode(cookie.getValue(), "UTF-8"));
//								model.addAttribute("cookies",cook);
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						} else {
							Cookie[] cokie = request.getCookies();
							for (int i = 0; i < cokie.length; i++) {
								cokie[i].setMaxAge(0);
								cokie[i].setPath("/");
								response.addCookie(cokie[i]);
							}
						}
					}

				} else {
					continue;
				}
			}

		}
		return "main/seach";

	}

	@RequestMapping("search")
	public String seachlist(@RequestParam(defaultValue = "1") int vpage, HttpServletResponse response, Model model) {
		System.out.println("123123123123123");

		if (searchCommand1.getItemcatecode().equals("F")) {
			List<ItemVo> search = shopService.searchAll(searchCommand1.getKeyword());

			int listCnt = shopService.keycount(searchCommand1.getKeyword());
			int lastpage = (int) (Math.ceil((double) listCnt / 10));
			int test = vpage * 10;
			int hap = test - 10;
			List<ItemVo> index = new ArrayList<ItemVo>();
			for (int i = hap; i < test; i++) {
				if (i == listCnt) {
					break;
				} else {
					index.add(search.get(i));
				}
			}
			model.addAttribute("lastpage", lastpage);
			// 토탈 데이터 갯수가 10개 이하라면 1 10개씩 끊는다.
			model.addAttribute("search", index);
		} else {
			List<ItemVo> search = shopService.search(searchCommand1.getKeyword(), searchCommand1.getItemcatecode());
			int listCnt = shopService.keycatecount(searchCommand1.getKeyword(), searchCommand1.getItemcatecode());
			int lastpage = (int) (Math.ceil((double) listCnt / 10));
			int test = vpage * 10;
			int hap = test - 10;
			List<ItemVo> index = new ArrayList<ItemVo>();
			for (int i = hap; i < test; i++) {
				if (i == listCnt) {
					break;
				} else {
					index.add(search.get(i));
				}
			}
			model.addAttribute("lastpage", lastpage);
			// 토탈 데이터 갯수가 10개 이하라면 1 10개씩 끊는다.
			model.addAttribute("search", index);
		}
		return "main/seach";
	}

	@RequestMapping("cate/{catecode}")
	public String itemcate(@PathVariable String catecode, @RequestParam(defaultValue = "1") int vpage, Model model) {
		List<ItemVo> result = shopService.catelist(catecode);
		int listCnt = shopService.catecount(catecode);
		int lastpage = (int) (Math.ceil((double) listCnt / 10));
		int test = vpage * 10;
		int hap = test - 10;
		List<ItemVo> index = new ArrayList<ItemVo>();
		for (int i = hap; i < test; i++) {
			if (i == listCnt) {
				break;
			} else {
				index.add(result.get(i));
			}
		}
		if (catecode.equals("A")) {
			model.addAttribute("categori", "상의");
			model.addAttribute("cates", catecode);
		} else if (catecode.equals("B")) {
			model.addAttribute("categori", "하의");
			model.addAttribute("cates", catecode);
		} else if (catecode.equals("C")) {
			model.addAttribute("categori", "신발");
			model.addAttribute("cates", catecode);
		} else if (catecode.equals("D")) {
			model.addAttribute("categori", "악세서리");
			model.addAttribute("cates", catecode);
		} else if (catecode.equals("E")) {
			model.addAttribute("categori", "모자");
			model.addAttribute("cates", catecode);
		}
		model.addAttribute("lastpage", lastpage);
		// 토탈 데이터 갯수가 10개 이하라면 1 10개씩 끊는다.
		model.addAttribute("cate", index);
		return "main/catelist";
	}

}
