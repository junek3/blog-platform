package com.rootlab.blog.common;

public interface ResponseMessage {
    // HTTP Status 200
    String SUCCESS = "Success";

    // HTTP Status 400
    String VALIDATION_FAILED = "Validation failed";
    String DUPLICATE_EMAIL = "Duplicate email";
    String DUPLICATE_NICKNAME = "Duplicate nickname";
    String DUPLICATE_TEL_NUMBER = "Duplicate tel number";
    String NOT_EXIST_USER = "This user does not exist";
    String NOT_EXIST_BLOG = "This blog does not exist";

    // HTTP Status 401
    String SIGN_IN_FAILED = "Login info mismatch";
    String AUTHORIZATION_FAILED = "Authorization failed";

    // HTTP Status 403
    String NO_PERMISSION = "Do not have permission";

    // HTTP Status 500
    String DATABASE_ERROR = "Database error";
}