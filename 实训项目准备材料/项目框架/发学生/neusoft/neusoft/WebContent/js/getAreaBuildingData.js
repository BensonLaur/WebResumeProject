function getAreaBuildingData(obj,hasNull){
	 $.ajax({
            type: "get",
            dataType: "text",
            url: "/getAreaBuildingData.jsp?areaId=" + obj.value,
            success: function(data){  
		       if(hasNull){
                  $("#buildingId").html('<option value="">请选择楼宇</option>' + data);
               }else{
            	  $("#buildingId").html(data);  
               }
	        }
	 });
}