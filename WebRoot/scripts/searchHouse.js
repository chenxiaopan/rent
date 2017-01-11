	function doSearch() {
		var title = $("[name=title]").val();
		var price = $("[name=price]").val();
		var street = $("[name=street_id]").val();
		var type = $("[name=type_id]").val();
		var floorage = $("[name=floorage]").val();
/* 		alert("title:" + title + "price:" + price + "street:" + street
				+ "type:" + type); */
		document.location.href = 'searchHouse.do?title=' + title + '&price='
				+ price + '&street=' + street + '&type=' + type + '&floorage='
				+ floorage;
	}