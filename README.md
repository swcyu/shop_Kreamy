# 온라인 중고거래 중개사이트_KREAMY

## 개요
- Spring 프로젝트
- 기술 / 환경
  - Spring
  - JavaScript
  - HTML
  - CSS
  - Oracle
  - Apache-tomcat
  - STS
- 기간: 2021.06.04 ~ 2021.07.02 (21일)

## 내용
- 한정판 제품 전용 중고거래 중개 사이트를 구현하였습니다.
- 소비자(판매자와 구매자) 화면과 관리자 화면을 구현하였습니다.
  - 전체 상품 페이지
    - 검색 필터를 사용하여 원하는 제품을 카테고리별, 브랜드별, 가격대별로 볼 수 있습니다.
    - 정렬하기 기능을 이용하여 상품을 인기순, 낮은 즉시 구매가순, 높은 즉시 구매가순, 브랜드순, 발매일순으로 정렬할 수 있습니다.
    - 검색 필터와 정렬하기 기능의 중복적용이 가능합니다
      - 적용된 기능은 태그 형식으로 확인할 수 있습니다.
      - 기능이 적용된 상품의 갯수가 표시됩니다.
  - 고객센터와 관리자 페이지를 구현하였습니다.
    - 고객센터
      - 고객에게 보여지는 공지사항, 1:1 문의, 검수기준 등의 내용을 표시합니다.
    - 관리자 페이지
      - 공지사항 관리, 1:1 문의 답변, 검수기준 수정 등을 할 수 있습니다.
- 단순한 쇼핑몰의 결제 환경이 아닌 입찰을 통한 거래 진행 방법을 구현하였습니다. 