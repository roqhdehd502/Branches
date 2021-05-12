/* Session 설정 */
--show parameter processes;
--show parameter sessions;
--show parameter transactions;

--alter system set processes=75000 scope=spfile sid='DB202103152109';
--alter system set sessions=82505 scope=spfile sid='DB202103152109';
--alter system set transactions=90755 scope=spfile sid='DB202103152109';

/* SEQUENCE 설정 */
CREATE SEQUENCE board_comment_seq; -- 댓글 시퀀스 추가
CREATE SEQUENCE prdct_image_seq; -- 사진 시퀀스 추가
CREATE SEQUENCE board_seq; -- 게시글 시퀀스 추가
CREATE SEQUENCE prdct_order_seq; -- 주문 시퀀스 추가
CREATE SEQUENCE cart_seq; -- 장바구니 시퀀스 추가

/* inquiry 내용 추가 */
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (1, 'EXCHANGE'); -- 교환 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (2, 'REFUND'); -- 환불 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (3, 'CANCEL'); -- 배송전취소 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (4, 'SHIPPING'); -- 배송 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (5, 'FAULTY'); -- 불량 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (6, 'ORDER'); -- 주문및결제 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (7, 'PRODUCT'); -- 상품및재입고 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (8, 'POINT'); -- 적립금 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (9, 'MEMBER'); -- 회원관련 --
INSERT INTO inquiry (inquiry_number, inquiry_name) VALUES (10, 'ETC'); -- 기타 --
SELECT * FROM inquiry;
COMMIT;

/* board_type 내용 추가 */
INSERT INTO board_type (board_type_number, board_type_name) VALUES (1, 'NOTICE'); -- 공지
INSERT INTO board_type (board_type_number, board_type_name) VALUES (2, 'MAGAZINE'); -- 매거진
INSERT INTO board_type (board_type_number, board_type_name) VALUES (3, 'REVIEW'); -- 상품리뷰
INSERT INTO board_type (board_type_number, board_type_name) VALUES (4, 'PRDCTQNA'); -- 상품Q&A
INSERT INTO board_type (board_type_number, board_type_name) VALUES (5, 'MBRQNA'); -- 고객Q&A
INSERT INTO board_type (board_type_number, board_type_name) VALUES (6, 'PRDCTDETAIL'); -- 상품상세
SELECT * FROM board_type;
COMMIT;

/* authority 내용 추가 */
INSERT INTO authority (authority_number, authority_name) VALUES (1, 'ADMIN'); -- 관리자
INSERT INTO authority (authority_number, authority_name) VALUES (2, 'SELLER'); -- 판매자
INSERT INTO authority (authority_number, authority_name) VALUES (3, 'MEMBER'); -- 고객
SELECT * FROM authority;
COMMIT;

/* login_type 내용 추가 */
INSERT INTO login_type (login_number, login_kind) VALUES (1, 'GENERAL'); -- 일반
INSERT INTO login_type (login_number, login_kind) VALUES (2, 'KAKAO'); -- 카카오
INSERT INTO login_type (login_number, login_kind) VALUES (3, 'NAVER'); -- 네이버
INSERT INTO login_type (login_number, login_kind) VALUES (4, 'GOOGLE'); -- 구글
INSERT INTO login_type (login_number, login_kind) VALUES (5, 'FACEBOOK'); -- 페이스북
SELECT * FROM login_type;
COMMIT;

/* grade 내용 추가 */
INSERT INTO grade (grade_number, grade_name) VALUES (1, 'GOLD'); -- 골드
INSERT INTO grade (grade_number, grade_name) VALUES (2, 'SILVER'); -- 실버
INSERT INTO grade (grade_number, grade_name) VALUES (3, 'BRONZE'); -- 브론즈
SELECT * FROM grade;
COMMIT;

/* category 내용 추가 */
INSERT INTO category (category_number, category_name) VALUES (1, 'OUTER_COAT'); -- 아우터-코트
INSERT INTO category (category_number, category_name) VALUES (2, 'OUTER_JACKET'); -- 아우터-자켓
INSERT INTO category (category_number, category_name) VALUES (3, 'OUTER_JUMPER'); -- 아우터-점퍼/무스탕
INSERT INTO category (category_number, category_name) VALUES (4, 'OUTER_CARDIGAN'); -- 아우터-가디건
INSERT INTO category (category_number, category_name) VALUES (5, 'OUTER_PADDING'); -- 아우터-패딩
INSERT INTO category (category_number, category_name) VALUES (6, 'TOP_TSHIRT'); -- 상의-티셔츠
INSERT INTO category (category_number, category_name) VALUES (7, 'TOP_SHIRT'); -- 상의-블라우스/셔츠
INSERT INTO category (category_number, category_name) VALUES (8, 'TOP_KNIT'); -- 상의-니트/스웨터
INSERT INTO category (category_number, category_name) VALUES (9, 'TOP_HOOD'); -- 상의-후드티
INSERT INTO category (category_number, category_name) VALUES (10, 'TOP_SWEAT'); -- 상의-맨투맨
INSERT INTO category (category_number, category_name) VALUES (11, 'TOP_SLEEVELESS'); -- 상의-슬리브리스
INSERT INTO category (category_number, category_name) VALUES (12, 'BOTTOM_DENIM'); -- 하의-데님
INSERT INTO category (category_number, category_name) VALUES (13, 'BOTTOM_COTTON'); -- 하의-코튼
INSERT INTO category (category_number, category_name) VALUES (14, 'BOTTOM_SHORT'); -- 하의-숏
INSERT INTO category (category_number, category_name) VALUES (15, 'BOTTOM_SLACKS'); -- 하의-슬랙스
INSERT INTO category (category_number, category_name) VALUES (16, 'BOTTOM_TRAINING'); -- 하의-트레이닝/조거
INSERT INTO category (category_number, category_name) VALUES (17, 'BOTTOM_LEGGINGS'); -- 하의-레깅스
INSERT INTO category (category_number, category_name) VALUES (18, 'BOTTOM_SKIRT'); -- 하의-스커트
INSERT INTO category (category_number, category_name) VALUES (19, 'DRESS_MINI'); -- 드레스-미니
INSERT INTO category (category_number, category_name) VALUES (20, 'DRESS_MIDI'); -- 드레스-미디
INSERT INTO category (category_number, category_name) VALUES (21, 'DRESS_MAXI'); -- 드레스-맥시
INSERT INTO category (category_number, category_name) VALUES (22, 'DRESS_OVERALL'); -- 드레스-오버롤
INSERT INTO category (category_number, category_name) VALUES (23, 'BAG_BACKPACK'); -- 가방-백팩
INSERT INTO category (category_number, category_name) VALUES (24, 'BAG_CROSS'); -- 가방-메신저/크로스
INSERT INTO category (category_number, category_name) VALUES (25, 'BAG_SHOULDER'); -- 가방-숄더/토트
INSERT INTO category (category_number, category_name) VALUES (26, 'BAG_ECO'); -- 가방-에코백
INSERT INTO category (category_number, category_name) VALUES (27, 'BAG_CLUTCH'); -- 가방-클러치
INSERT INTO category (category_number, category_name) VALUES (28, 'SHOES_SHOES'); -- 신발-구두
INSERT INTO category (category_number, category_name) VALUES (29, 'SHOES_BOOTS'); -- 신발-부츠
INSERT INTO category (category_number, category_name) VALUES (30, 'SHOES_SANDALS'); -- 신발-샌들
INSERT INTO category (category_number, category_name) VALUES (31, 'SHOES_SLIPPERS'); -- 신발-슬리퍼
INSERT INTO category (category_number, category_name) VALUES (32, 'SHOES_SNEAKERS'); -- 신발-스니커즈
INSERT INTO category (category_number, category_name) VALUES (33, 'ETC_BAG'); -- ETC-가방
INSERT INTO category (category_number, category_name) VALUES (34, 'ETC_HAT'); -- ETC-모자
INSERT INTO category (category_number, category_name) VALUES (35, 'ETC_ACCESSORIES'); -- ETC-악세서리
SELECT * FROM category;
COMMIT;

/*============================================================================*/

/* mbr 더미데이터 추가 */
INSERT INTO mbr (mbr_id, mbr_pw, mbr_name, authority_number, mbr_gender, mbr_birth, mbr_email, login_number, contact_number, mbr_nickname, mbr_point, grade_number) 
VALUES ('abcd1234', '1234', '홍길동', 1, '남', '1994-09-12', 'abcd1234@naver.com', 1, '01012345678', '닉네임1', 0, 3);
INSERT INTO mbr (mbr_id, mbr_pw, mbr_name, authority_number, mbr_gender, mbr_birth, mbr_email, login_number, contact_number, mbr_nickname, mbr_point, grade_number) 
VALUES ('bcde1234', '1234', '김철수', 2, '남', '1994-09-12', 'bcde1234@naver.com', 1, '01023456789', '닉네임2', 0, 3);
INSERT INTO mbr (mbr_id, mbr_pw, mbr_name, authority_number, mbr_gender, mbr_birth, mbr_email, login_number, contact_number, mbr_nickname, mbr_point, grade_number) 
VALUES ('cdef1234', '1234', '김영희', 2, '여', '1994-09-12', 'cdef1234@naver.com', 1, '01012345678', '닉네임3', 0, 3);
INSERT INTO mbr (mbr_id, mbr_pw, mbr_name, authority_number, mbr_gender, mbr_birth, mbr_email, login_number, contact_number, mbr_nickname, mbr_point, grade_number) 
VALUES ('defg1234', '1234', '김회원', 3, '남', '1994-09-12', 'defg1234@naver.com', 1, '01012345678', '닉네임4', 0, 3);
SELECT * FROM mbr;
COMMIT;

/* shipping 더미데이터 추가 */
INSERT INTO shipping (mbr_id, shipping_address) 
VALUES ('abcd1234', '서울시구로구');
SELECT * FROM shipping;
COMMIT; 

/* prdct 더미데이터 추가 */
INSERT INTO prdct (prdct_id, prdct_name, prdct_price, category_number, mbr_id) 
VALUES ('PRDCT12', '옷예시', '121680', 1, 'bcde1234');
INSERT INTO prdct (prdct_id, prdct_name, prdct_price, category_number, mbr_id) 
VALUES ('PRDCT34', '옷예시', '121680', 1, 'abcd1234'); -- 취급주의(관리자)
INSERT INTO prdct (prdct_id, prdct_name, prdct_price, category_number, mbr_id) 
VALUES ('PRDCT45', '옷예시', '121680', 1, 'defg1234'); -- 취급주의(회원)
SELECT * FROM prdct;
COMMIT; 

/* prdct_order 더미데이터 추가 */
INSERT INTO prdct_order (order_number, order_price, mbr_id) 
VALUES (prdct_order_seq.nextval, 121680, 'bcde1234');
INSERT INTO prdct_order (order_number, order_price, mbr_id) 
VALUES (prdct_order_seq.nextval, 121680, 'abcd1234'); -- 취급주의(관리자)
INSERT INTO prdct_order (order_number, order_price, mbr_id) 
VALUES (prdct_order_seq.nextval, 121680, 'defg1234'); -- 취급주의(회원)
SELECT * FROM prdct_order;
COMMIT; 

/* order_detail 더미데이터 추가 */
INSERT INTO order_detail (order_number, prdct_id, order_color, order_size, order_amount, prdct_price) 
VALUES (22, 'PRDCT12', 'RED', 'XL', 1, 121680);
INSERT INTO order_detail (order_number, prdct_id, order_color, order_size, order_amount, prdct_price) 
VALUES (23, 'PRDCT34', 'RED', 'XL', 1, 121680); -- 취급주의(관리자)
INSERT INTO order_detail (order_number, prdct_id, order_color, order_size, order_amount, prdct_price) 
VALUES (24, 'PRDCT45', 'RED', 'XL', 1, 121680); -- 취급주의(회원) 
SELECT * FROM order_detail;
COMMIT; 

/* prdct_detail 더미데이터 추가 */
INSERT INTO prdct_detail (prdct_id, prdct_color, prdct_size, prdct_stock) 
VALUES ('PRDCT12', 'RED', 'XL', 100);
INSERT INTO prdct_detail (prdct_id, prdct_color, prdct_size, prdct_stock) 
VALUES ('PRDCT34', 'RED', 'XL', 100); -- 취급주의(관리자) 
INSERT INTO prdct_detail (prdct_id, prdct_color, prdct_size, prdct_stock) 
VALUES ('PRDCT45', 'RED', 'XL', 100); -- 취급주의(회원)  
SELECT * FROM prdct_detail;
COMMIT; 

/* supply 더미데이터 추가 */
INSERT INTO supply (prdct_id, supply_amount) 
VALUES ('PRDCT12', 200);
INSERT INTO supply (prdct_id, supply_amount) 
VALUES ('PRDCT34', 200); -- 취급주의(관리자) 
INSERT INTO supply (prdct_id, supply_amount) 
VALUES ('PRDCT45', 200); -- 취급주의(회원)  
SELECT * FROM supply;
COMMIT;

/* cart 더미데이터 추가 */
INSERT INTO cart (cart_number, cart_price, mbr_id) 
VALUES (cart_seq.nextval, 121680, 'bcde1234');
INSERT INTO cart (cart_number, cart_price, mbr_id) 
VALUES (cart_seq.nextval, 121680, 'abcd1234');  -- 취급주의(관리자)
INSERT INTO cart (cart_number, cart_price, mbr_id) 
VALUES (cart_seq.nextval, 121680, 'defg1234');  -- 취급주의(회원)
SELECT * FROM cart;
COMMIT; 

/* cart_detail 더미데이터 추가 */
INSERT INTO cart_detail (cart_number, prdct_id, cart_color, cart_size, cart_amount, prdct_price) 
VALUES (21, 'PRDCT12', 'RED', 'XL', 1, 121680);
INSERT INTO cart_detail (cart_number, prdct_id, cart_color, cart_size, cart_amount, prdct_price) 
VALUES (22, 'PRDCT34', 'RED', 'XL', 1, 121680);  -- 취급주의(관리자) 
INSERT INTO cart_detail (cart_number, prdct_id, cart_color, cart_size, cart_amount, prdct_price) 
VALUES (23, 'PRDCT45', 'RED', 'XL', 1, 121680);  -- 취급주의(회원) 
DELETE FROM cart_detail;
SELECT * FROM cart_detail;
COMMIT; 

/* board 더미데이터 추가 */
INSERT INTO board (board_id, board_name, board_content, mbr_id, board_type_number, inquiry_number, prdct_id, order_number, board_like, board_hit) 
VALUES (board_seq.nextval, '게시글제목', '게시글내용', 'abcd1234', 1, 1, 'PRDCT34', 23, 0, 0); -- 공지사항(관리자)
INSERT INTO board (board_id, board_name, board_content, mbr_id, board_type_number, inquiry_number, prdct_id, order_number, board_like, board_hit) 
VALUES (board_seq.nextval, '매거진제목', '매거진내용', 'abcd1234', 2, 1, 'PRDCT34', 23, 0, 0); -- 매거진(관리자)
SELECT * FROM board;
COMMIT;

/* board_comment 더미데이터 추가 */
INSERT INTO board_comment (comment_id, board_id, mbr_id, comment_content) 
VALUES (board_comment_seq.nextval, 49, 'defg1234', '댓글작성했습니다.'); -- 매거진 댓글
SELECT * FROM board_comment;
COMMIT; 

/* prdct_image 더미데이터 추가 */
--INSERT INTO prdct_image (image_number, image_name, image_path, board_id) 
--VALUES (prdct_image_seq.nextval, '사진이름', '경로예시', 49); -- 매거진(관리자)
SELECT * FROM prdct_image ORDER BY image_number DESC;
DELETE FROM prdct_image WHERE image_number = 206;
--UPDATE prdct_image SET board_id = 49 WHERE image_number = 70;
COMMIT;

/* wish_list 더미데이터 추가 */
--INSERT INTO wish_list (mbr_id, board_id) 
--VALUES ('abcd1234', 28);
SELECT * FROM wish_list;
COMMIT; 

/*============================================================================*/

/* 공지사항 게시판 리스트 출력 */
SELECT *
FROM board
WHERE board_type_number = 1
ORDER BY board_id DESC, board_date DESC;

/* 매거진 게시판 리스트 출력 */
SELECT *
FROM board
WHERE board_type_number = 2
ORDER BY board_id DESC, board_date DESC;

DELETE FROM board WHERE board_id = 192;
COMMIT;

/* 매거진 게시판 썸네일 */
SELECT b.board_id, b.board_name, b.board_date, b.board_like, b.board_hit, p.image_name 
FROM board b, prdct_image p 
WHERE b.board_id = p.board_id AND 
    b.board_type_number = 2 AND 
    p.image_number IN (SELECT MIN(image_number) 
                       FROM prdct_image 
                       GROUP BY board_id) 
ORDER BY board_id DESC, board_date DESC;

/* 매거진 게시글 사진 가져오기 */
SELECT p.image_name, b.board_id 
FROM prdct_image p, board b 
WHERE p.board_id = b.board_id AND 
    b.board_id = 71;

/* 매거진 게시글 댓글 카운트 */
SELECT COUNT(comment_id) AS comment_count FROM board_comment WHERE board_id = 49;

/* 매거진 게시글 댓글 가져오기 */
SELECT c.comment_id, c.comment_content, c.comment_date, m.mbr_id 
FROM board_comment c, mbr m, board b 
WHERE c.mbr_id = m.mbr_id AND 
    c.board_id = b.board_id AND  
    b.board_id = 49 
ORDER BY c.comment_id DESC, c.comment_date DESC;

/* 유저 Q&A 리스트 가져오기 */
SELECT mbr_id, board_id, board_name, board_date 
FROM board 
WHERE mbr_id = 'defg1234' AND 
    board_type_number = 5 
ORDER BY board_id DESC, board_date DESC;

/* 유저 QNA 상세 */
SELECT i.inquiry_name, b.board_id, b.board_name, b.board_content, b.board_date 
FROM inquiry i, board b 
WHERE i.inquiry_number = b.inquiry_number AND 
    b.board_type_number = 5 AND 
    b.board_id = 435;
    
/* 유저 QNA 상세 댓글 불러오기 */
SELECT *
FROM board_comment
WHERE board_id = 23;