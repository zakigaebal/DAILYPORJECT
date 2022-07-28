<%@page import="Model.ChartDTO"%>
<%@page import="Model.t_expenseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="echarts.js"></script>
<style type="text/css">

@font-face {
  font-family: 'KOTRAHOPE';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
}

html {
  font-family: "KOTRAHOPE";
}
.chartBtn {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  color: #ffffff;
  background-color: #e47b52; 
  border-radius: 30px;
  padding: 10px 40px;
  border-style: solid;
  border-color: #FFFFFF;
  cursor: pointer;
  width: 300px;
  font-weight: 900;
  margin: 3px;
}
.btnGroup{
	display: flex;
	justify-content: center
}
#main{
	display: flex;
	justify-content: center
}
</style>

</head>
<body>
<%
ArrayList<ChartDTO> list = (ArrayList<ChartDTO>)request.getAttribute("list");
System.out.print(list.get(0).getSum());

%>
<div class="page">
		<header>
			<a href="./index.jsp"><img src="./img/dailyLogo.png" alt="���ϸ��ΰ�"></a>
		</header>
	</div>
<h1 style="text-align: center">���ϸ� �� ��Ʈ</h1>

<div id="main" style="width:100%; height:700px;"></div>

    <!-- �ٸ� ��Ʈ�� ���� ��ư -->
    <div class="btnGroup">
    	<input id='go week'
    	type='button' class='chartBtn'
    	onclick=window.location.href='http://localhost:8081/day22/ChartsWeek.jsp?'
    	value='���� 7�ϰ� ��Ʈ ����'/>
    	<input id='go month'
	 	type='button' class='chartBtn'
	 	onclick=window.location.href='http://localhost:8081/day22/MonthListService?'
	 	value='���� ��Ʈ ����'/>
	 	<input id='go main'
	 	type='button' class='chartBtn'
	 	onclick=window.location.href='http://localhost:8081/day22/index.jsp'
	 	value='�������� ����'/>
	 	
    </div>
    
    <script type="text/javascript">
    	
        var chartDom = document.getElementById('main');
        var myChart = echarts.init(chartDom);
        var option;
        
        option = {
        xAxis: { // ī�װ�
            type: 'category',
            data: [
            	<%for(int i = 0; i < list.size(); i ++){%>
            	"<%=list.get(i).getCate()%>",
            	<%}%>
            ]
        },
        yAxis: { // ��
            type: 'value'
        },
        series: [
            {
            data: [
            	<%for(int i = 0; i < list.size(); i++){%>
            	parseInt(<%=list.get(i).getSum() %>),
            	<%}%>
            ],
            type: 'bar'
            }
        ]
        };

        myChart.setOption(option);

    </script>

    

    
    
</body>
</html>