
var entregable = [];
var indice = [];
var tamano = [];


function subir(){
	var valido = $("form").valid();
	for(var i = 0; i < entregable.length && valido; i++){
		if(tamano[i] > 0){
			var suma = 0;
			for(var j = 0; j < indice[i]; j++){
				suma += parseInt($("#nota-"+i+"-"+j).val());
			};
			$("#campo"+i).prop("disabled", false);
			$("#campo"+i).val(suma/tamano[i]);
		}
	};
	if(valido)
		$("form").submit();
}


function agregarDetalle(i){
	if(entregable[i] == undefined){
		entregable[i] = i;
		indice[i] = 0;
		tamano[i] = 0;
	}
	if(tamano[i] == 0){
		$("#detalle"+i).append("<thead id=\"cabeza\"><tr><th>Nombre</th>" +
			"<th>Nota</th><th></th></tr>").append("</thead>");	
		$("#campo"+i).val('');
		$("#campo"+i).prop("disabled", true);
	}
	agregarFila(i);
}

function agregarFila(i){
	$("#detalle"+entregable[i]).append(
		"<tr id =\"fila-"+entregable[i]+"-"+indice[i]+"\">" +
		"<td><input type=\"text\" id=\"nombre-"+entregable[i]+"-"+indice[i]+
		"\" name=\"nombre-"+entregable[i]+"-"+indice[i]+"\" required></td>" + 
		"<td><input type=\"number\" min=\"0\" max=\"100\" id=\"nota-"+entregable[i]+"-"+indice[i]+
		"\" name=\"nota-"+entregable[i]+"-"+indice[i]+"\" required></td>" +
		"<td><input type=\"button\" id=\"enlace-"+entregable[i]+"-"+indice[i]+
		"\" onclick=\"eliminarFila("+entregable[i]+","+indice[i]+")\" value=\"Eliminar\"></td></tr>");
	indice[i]++;
	tamano[i]++;
}

function eliminarFila(entrega, ind){
	$("#fila-"+entrega+"-"+ind).remove();
	tamano[entrega]--;
	if(tamano[entrega] == 0){
		$("#campo"+entrega).prop("disabled", false);
		$("#detalle"+entrega).empty();
		indice[entrega] = 0;
	}
	else{
		indice[entrega]--;
		for(var j = ind + 1; j <= tamano[entrega]; j++){
			decrementar(entrega, j);
		}
	}
}

function decrementar(entrega, n){
	$("#fila-"+entrega+"-"+n).attr("id", "fila-"+entrega+"-"+(n-1));
	$("#nombre-"+entrega+"-"+n).attr("name", "nombre-"+entrega+"-"+(n-1));
	$("#nota-"+entrega+"-"+n).attr("name", "nota-"+entrega+"-"+(n-1));
	$("#nombre-"+entrega+"-"+n).attr("id", "nombre-"+entrega+"-"+(n-1));
	$("#nota-"+entrega+"-"+n).attr("id", "nota-"+entrega+"-"+(n-1));
	$("#enlace-"+entrega+"-"+n).attr("id", "enlace-"+entrega+"-"+(n-1));
	$("#enlace-"+entrega+"-"+(n-1)).attr("onclick", "eliminarFila("+entrega+","+(n-1)+")");
}