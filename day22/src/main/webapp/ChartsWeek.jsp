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
<script type="text/javascript" src="jquery.js"></script>
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
<div class="page">
		<header>
			<a href="./index.jsp"><img src="./img/dailyLogo.png" alt="���ϸ��ΰ�"></a>
		</header>
	</div>
<h1 style="text-align: center">���ϸ� �� ��Ʈ</h1>

<div id="main" style="width: 100%; height:700px;"></div>

	 <!-- �ٸ� ��Ʈ�� ���� ��ư -->
	 <div class="btnGroup">
	 	<input id='go day' class='chartBtn'
	 	type='button'
	 	onclick=window.location.href='http://localhost:8081/day22/DayListService?'
	 	value='���� ��Ʈ ����'/>
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
	// �츮 html������ �غ� �� �Ǹ� ����
	$(document).ready( function(){
		 
		 loadData();
		 
	 } );
	
	// chart�� �ʿ��� main div��������
	 var chartDom = document.getElementById('main');
	 var myChart = echarts.init(chartDom);
	 var option;
	 // ���ó�¥ ��������
	 var today = new Date();
	 today = new Date();
	 
	 // ��¥�� oracle�� ���� ������ �������� �ٲٴ� �Լ�
	 function dateFormat(today){
		 var year = today.getFullYear()
		 var month = today.getMonth()+1
		 var day = today.getDate()
		 // ���׿����ڸ� �̿��ؼ� ���� 10���� ���� ��¥��� 0�߰�
		 var date = year + "-" + (month>9?month+"":"0"+month) + "-" + (day>9?day+"":"0"+day)
		 
		 return date
	 }
	 
     // ��¥����Ʈ �����
	 dates = [];
     
     
     for(let i = 6 ; i >= 0; i-- ){
    	 today = new Date();
    	 var last = new Date(today.setDate(today.getDate() - i))
    	 dates.push(dateFormat(last));
     }
     
     
	 // 14�� ī�װ� ����Ʈ
	 // ex) �Ƿ�, �ְ�/���, ����, �Ƿ�/�ǰ�, ȭ��ǰ, ī��
	 datasets = {//
		 '�Ƿ�' : ['�Ƿ�',0, 0, 0, 0, 0, 0, 0],
		 "�ְ�/���" : ["�ְ�/���", 0, 0, 0, 0, 0, 0, 0],
		 "����" : ["����", 0, 0, 0, 0, 0, 0, 0],
		 "�Ƿ�/�ǰ�" : ["�Ƿ�/�ǰ�", 0, 0, 0, 0, 0, 0, 0],
		 "ȭ��ǰ" : ["ȭ��ǰ", 0, 0, 0, 0, 0, 0, 0],
		 "ī��" : ["ī��", 0, 0, 0, 0, 0, 0, 0],
		 "�Ļ�"  : ["�Ļ�", 0, 0, 0, 0, 0, 0, 0],
		 "��/����"  : ["��/����", 0, 0, 0, 0, 0, 0, 0],
		 "�ڵ���"  : ["�ڵ���", 0, 0, 0, 0, 0, 0, 0],
		 "����"  : ["����", 0, 0, 0, 0, 0, 0, 0],
		 "��ȭ/����"  : ["��ȭ/����", 0, 0, 0, 0, 0, 0, 0],
		 "�"  : ["�", 0, 0, 0, 0, 0, 0, 0],
		 "����/����"  : ["����/����", 0, 0, 0, 0, 0, 0, 0],
		 "������"  : ["������", 0, 0, 0, 0, 0, 0, 0]
		 
	 }
	 // datasets�� Ű���鸸 ��Ƽ� �迭 �����
	 dataKeys = Object.keys(datasets);
	 
	 
	 // datasets�� ������ ������ ����
	 function makeData(res){
		 for (var i = 0; i < dates.length; i++) {
				for (var j = 0; j < res.length; j++) {
					if(res[j].day == dates[i]){
						// ��¥ ������ �־������
						for (var k = 0; k < dataKeys.length; k++) {
							// ���� �̸��� ��� �迭�� �� ����
							if(res[j].cate == dataKeys[k]){
								datasets[dataKeys[k]][i+1] = res[j].sum
							}
							
							//datasets["����"].splice(3, 3, 55)
						}
						// ---
						
						
					}
					//-----
					
				}
				//-------
		}
		 console.log(datasets)
	 }
	 
	 // DB���� �����͸� �������� ajax ��û
	 function loadData(){
		 
		 $.ajax({
			 url : 'WeekListService', // ���� ��û
			 type : 'get', // get? post?
			 data : {
				 // "key" : value,
			 },
			 dataType : 'json', // json�� �޾ƿö��� ���ٰ�
			 success : function(res){
				 // ��û�� �����ϸ� �������� �Ұ���
				 // res -> ������� ������ res�� ���
				 console.log(res);
				
				 makeData(res);
				 
				 dates.unshift("cate")
				 drawChart();
			 },
			 error : function(e){
				 // ��û�� �����ϸ� �������� �Ұ���
				 console.log(e);
			 }
			 
		 });
		 
	 }
	 
	 
       
    
     // ��Ʈ �׸���
	 function drawChart(){
		 console.log("start DrawChart")
		
		 // �غ�� data�鿡 ���缭 source �غ�
		 mysource = [];
		 mysource.push(dates)
		 for(let m = 0; m < dataKeys.length; m++){
			 mysource.push(datasets[dataKeys[m]])
		 } 
		 
		 // �غ�� data�鿡 ���缭 �� �غ�
		 var myseries = []
		 for (let n = 0; n < dataKeys.length; n++){
			 myseries.push({
		         type: 'line',
		         smooth: true,
		         seriesLayoutBy: 'row',
		         emphasis: { focus: 'series' }
		       })
		 }
		 myseries.push({
	         type: 'pie',
	         id: 'pie',
	         radius: '30%',
	         center: ['50%', '25%'],
	         emphasis: {
	           focus: 'self'
	         },
	         label: {
	           formatter: '{b}: {@2012} ({d}%)'
	         },
	         encode: {
	           itemName: 'cate',
	           value: '2012',
	           tooltip: '2012'
	         }
	       })
	       console.log(myseries)
		 
		 setTimeout(function () {
			   option = {
			     legend: {},
			     tooltip: {
			       trigger: 'axis',
			       showContent: false
			     },
			     dataset: {
			       source: mysource
			     },
			     xAxis: { type: 'category' },
			     yAxis: { gridIndex: 0 },
			     grid: { top: '55%' },
			     series: myseries
			   };
			   myChart.on('updateAxisPointer', function (event) {
			     const xAxisInfo = event.axesInfo[0];
			     if (xAxisInfo) {
			       const dimension = xAxisInfo.value + 1;
			       myChart.setOption({
			         series: {
			           id: 'pie',
			           label: {
			             formatter: '{b}: {@[' + dimension + ']} ({d}%)'
			           },
			           encode: {
			             value: dimension,
			             tooltip: dimension
			           }
			         }
			       });
			     }
			   });
			   myChart.setOption(option);
			 });

			 option && myChart.setOption(option);
	 }

	 
	 
	 </script>
	 
	 

	 
	 
	 
    
</body>
</html>