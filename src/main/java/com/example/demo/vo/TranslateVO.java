package com.example.demo.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
public class TranslateVO {

	private String source;
	private String target;
	private String targetText;
}
