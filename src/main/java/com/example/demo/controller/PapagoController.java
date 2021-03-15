package com.example.demo.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.PapagoService;
import com.example.demo.vo.TranslateVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PapagoController {
	
	@Resource
	PapagoService papago;
	
	@GetMapping("/papago")
	public @ResponseBody String getTranslate(Model model,TranslateVO tlVO) {
		log.info("tlVO==>{}",tlVO);
		String text =papago.getTranslate(tlVO);
		log.info("text==>{}",text);
		return text;
	}
}
