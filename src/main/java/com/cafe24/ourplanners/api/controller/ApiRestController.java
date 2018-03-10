package com.cafe24.ourplanners.api.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1")
public class ApiRestController {

	 @RequestMapping(value = "/members/")
	 public ResponseEntity<?> v1Foo() {
	   return ResponseEntity.ok("v1 foo");
	 }
	 @RequestMapping(value = "/v2/foo")
	 public ResponseEntity<?> v2Foo() {
	   return ResponseEntity.ok("v2 foo");
	 }
}
