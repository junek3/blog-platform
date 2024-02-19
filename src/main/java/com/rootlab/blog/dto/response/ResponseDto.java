package com.rootlab.blog.dto.response;

import com.rootlab.blog.common.ResponseCode;
import com.rootlab.blog.common.ResponseMessage;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@Getter
@AllArgsConstructor
public class ResponseDto {

    private String code;
    private String message;

    public static ResponseDto of(String code, String message) {
        return new ResponseDto(code, message);
    }

    public static ResponseEntity<ResponseDto> DatabaseError() {
        ResponseDto responseBody = new ResponseDto(ResponseCode.DATABASE_ERROR, ResponseMessage.DATABASE_ERROR);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(responseBody);
    }
}