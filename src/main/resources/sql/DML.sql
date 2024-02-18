-- 회원가입
INSERT INTO user
VALUES ('email@email.com', 'password11', 'nickname', '01012345678', '부산광역시 부산진구', '롯데백화점', null);

INSERT INTO user
VALUES ('test@gmail.com', 'password12', 'nick', '01056781212', '서울특별시 마포구', '골든빌오피스텔', null);

-- 로그인
SELECT *
FROM user
WHERE email = 'email@email.com';

-- 게시물 작성
INSERT INTO board(title, content, write_datetime, favorite_count, comment_count, view_count, email)
VALUES ('제목입니다', '내용입니다', '2024-02-18 09:18', 0, 0, 0, 'email@email.com');

INSERT INTO image(image_path, board_number)
VALUES ('image_url', 1);

-- 댓글 작성
INSERT INTO comment(content, write_datetime, user_email, board_number)
VALUES ('댓글입니다', '2024-02-18 09:30', 'email@email.com', 1);

UPDATE board
SET comment_count = comment_count + 1
WHERE board_number = 1;

INSERT INTO comment(content, write_datetime, user_email, board_number)
VALUES ('다시 댓글입니다', '2024-02-18 09:32', 'email@email.com', 1);

UPDATE board
SET comment_count = comment_count + 1
WHERE board_number = 1;

-- 좋아요
INSERT INTO favorite(email, board_number)
VALUES ('email@email.com', 1);

UPDATE board
SET favorite_count = favorite_count + 1
WHERE board_number = 1;

DELETE
FROM favorite
WHERE email = 'email@email.com'
  AND board_number = 1;

UPDATE board
SET favorite_count = favorite_count - 1
WHERE board_number = 1;

-- 게시물 수정
UPDATE board
SET title   = '수정된 제목입니다',
    content = '수정된 내용입니다'
WHERE board_number = 1;

DELETE
FROM image
WHERE board_number = 1;

INSERT INTO image(image_path, board_number)
VALUES ('image_url', 1);

INSERT INTO image(image_path, board_number)
VALUES ('image_url222', 1);

-- 게시물 삭제
DELETE
FROM comment
WHERE board_number = 1;

DELETE
FROM favorite
WHERE board_number = 1;

DELETE
FROM board
WHERE board_number = 1;

-- 상세 게시물 불러오기
SELECT B.board_number   AS board_number,
       B.title          AS title,
       B.content        AS content,
       B.write_datetime AS write_datetime,
       B.email          AS writer_email,
       U.nickname       AS nickname,
       U.profile_image  AS profile_image
FROM board AS B
         LEFT JOIN user AS U
                   ON B.email = U.email
WHERE board_number = 1;

SELECT image_path
FROM image
WHERE board_number = 1;

SELECT U.email         AS email,
       U.nickname      AS nickname,
       U.profile_image AS profile_image
FROM favorite AS F
         INNER JOIN user AS U
                    ON F.email = U.email
WHERE F.board_number = 1;

SELECT U.nickname       AS nickname,
       U.profile_image  AS profile_image,
       C.write_datetime AS write_datetime,
       C.content        AS contents
FROM comment AS C
         LEFT JOIN user AS U
                   ON C.user_email = U.email
WHERE board_number = 1
ORDER BY write_datetime DESC;

-- 최신 게시물 리스트 불러오기
SELECT *
FROM board_list_view
ORDER BY write_datetime DESC
LIMIT 0, 5;

SELECT board_number, ANY_VALUE(image_path) AS image_path
FROM image
GROUP BY board_number;

-- 검색어 리스트 불러오기
SELECT *
FROM board_list_view
WHERE title LIKE '%제목%'
   OR content LIKE '%내용%'
ORDER BY write_datetime DESC
LIMIT 0, 5;

-- 주간 상위 게시물 3개 불러오기
SELECT *
FROM board_list_view
WHERE write_datetime BETWEEN '2024-02-12 09:00' AND '2024-02-19 09:00'
ORDER BY favorite_count DESC, comment_count DESC, view_count DESC, write_datetime DESC
LIMIT 3;

-- 특정 유저 게시물 리스트 불러오기
SELECT *
FROM board_list_view
WHERE writer_email = 'email@email.com'
ORDER BY write_datetime DESC;

-- 인기 검색어 리스트 불러오기
SELECT search_word, count(search_word) AS search_count
FROM search_log
WHERE relation IS FALSE
GROUP BY search_word
ORDER BY search_count DESC
LIMIT 15;

-- 관련 검색어 리스트
SELECT search_word, count(search_word) AS search_count
FROM search_log
WHERE relation IS TRUE
GROUP BY search_word
ORDER BY search_count DESC
LIMIT 15;

-- 유저 정보 불러오기
SELECT *
FROM user
WHERE email = 'email@email.com';

-- 닉네임 수정
UPDATE user
SET nickname = '수정된 닉네임'
WHERE email = 'email@email.com';

-- 프로필 이미지 수정
UPDATE user
SET profile_image = 'modified_url'
WHERE email = 'email@email.com';