<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html >
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="image/png" href="https://i.pinimg.com/originals/22/e4/e0/22e4e079c332b3f3589f4a8b73545076.png" rel="icon" style="color: tomato;"> 
<title>실시간 비대면 강의</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<style>
    body{
        height: 100%;        
    }
@media screen and (max-width: 900px) {
    #form{
        width: 100%;
    }
  }
  
  /* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
  @media screen and (max-width: 600px) {
    #form{
        width: 100%;
    }
  }
#form{
    height: 130px;
    width: 400px;
    overflow: hidden;
    margin: auto;
    align-content: center;
    text-align: center;
    padding: 20px 20px;
    text-align: center;
    
}
input:nth-child(odd){
    padding: 20px 20px;
}
input:nth-child(even){
    padding: 10px 20px;
    border: none;
}
input{
    position: relative;
    width: 100%;
    outline: none;
    margin-top: 10px;
    left: 0;
    right: 0;
    display: block;
}
</style>

<body>
<div id="header">
<h1 style="text-align: center;">실시간 비대면강의</h1>
</div>
<div id="form" style="background-color: cornsilk;height: auto;">
		<input type="hidden" value="${memId }" id="memId"  />
		<input type="hidden" value="${classNo }" id="classNo"/>
        <input type="hidden" name="roomId" id="value" placeholder="Enter room id Eg:x2bdfy45v7" value="">
		<input type="hidden" value="Join Room" id="submit">
       <input type="button" value="화상강의 시작" id="newRoom" style="color: darkorange;background-color: aliceblue;font-size: 30px;">
       <div style="margin-top: 15px;">수강생들의 출석이 <a style="color: hotpink;font-weight: 800;">인정된 상태로</a> 시작됩니다.</div> 
       	<div>추후 출석상태를 관리하여 주시기 바랍니다.</div>
</div>

<script >
    
    var classNo = document.getElementById("classNo").value;
    var memId = document.getElementById("memId").value;
    
    var form = document.getElementById("submit")
    form.addEventListener('click', ()=>{
        const x = document.getElementById("value");
        if(x.value == ""){
            //alert("Room id is empty!!!")
            swal("Oops.. ","Room id is empty !!")
        }else{
            location.replace("https://192.168.0.153:3000/"+x.value);
            //location.replace("https://videocallappwebrtc.herokuapp.com/"+x.value);
            
            x.value = "";
        }
    });

    const y = document.getElementById("newRoom");
    y.addEventListener('click', ()=>{
        swal("화상강의를 시작합니다.","해당 과목의 화상강의실을 불러오는중.").then((value)=>{
        	
            if(value == true){

            	window.open("https://192.168.0.153:3000/"+classNo+"?memId="+memId);         	
                //window.location.href = "https://videocallappwebrtc.herokuapp.com/";
            }else{
                swal("취소 !!","화상강의실 생성을 취소합니다.");
            }
        })
    });
</script>

</body>
</html>