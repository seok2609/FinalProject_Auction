<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script defer src="/js/wholesale/sale2.js"></script>
</head>
<body>
    <!-- ===========header=============== -->
<c:import url="../common/header.jsp"></c:import>
<c:import url="../temp/boot.jsp"></c:import>
<!-- ================================ -->

<h1>${param.plsPage}</h1>
    <table class="table table-striped" id="api">
        <thead>
            <tr>
                <td>whsalCd : 
                    <select name="whsalCd" id="whsalCd">
                        <option value="110001">어떤거1</option>
                        <option value="330201">어떤거2</option>
                    </select> 
                </td>
                <td>saleDate : 
                    <select name="saleDate" id="saleDate">
                        <option value="20221122">어떤거1</option>
                        <option value="20221129">어떤거2</option>
                    </select> 
                </td>
                <td>대분류 : 
                    <select name="largeCd" id="largeCd">
                        <option value="05">어떤거1</option>
                        <option value="06">어떤거2</option>
                    </select> 
                </td>
                <td>
                   
                    <input type="button" value="검색" @click="search()">
                </td>
            </tr>
            <tr>
                <th>saleDate</th>
                <th>도매시장</th>
                <th>법인</th>
                <th>소분류</th>
            </tr>
        </thead>
        <div class="json_table">
            <tbody class="table_body">

            </tbody>

        </div>
        <button type="button" onclick="getJSON()"> json 불러오는 버튼</button>
       </table>
            <div class="plsPage">

            </div>
            <!-- ===========footer=============== -->
<c:import url="../common/footer.jsp"></c:import>
<!-- ================================ -->
</body>
</html>