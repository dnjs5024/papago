package com.example.demo.vo;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
public class MessageVO {
	private Map<String,Object> message;
}
