
$(document).ready(function(){
	$('#ge-list').on('change', modifyObs);
});

/*
Realiza una llamada ajax al servidor para habilitar las 
observaciones a los documentos requeridos de la 
grupo empresa seleccionada
*/

function modifyObs(){
	obs = $('#observaciones-block');
	obs.empty();
	$.ajax({
		method: "POST",
		url: "/Vista/_observaciones.php",
		cache: false,
		data: {empresa: $("#ge-list").val()}
	}).done(function (html){
		obs.append(html);

		$('div .doc-obs').hide();


		//añade la funcion de ocultar y mostrar los bloques de observaciones
		$(':checkbox').change(function(){

			var checkbox = $(this);
			var docName = checkbox.attr('encoded');

			docObs = "#obs-"+docName;
			
			$(docObs).stop().slideToggle(400, function(){
				console.log($(docObs).children('input').length);
				var observaciones = $(docObs+'-block').children('input');

				if (checkbox.is(':checked') && observaciones.length == 0){
					addObs(docName);
				}

				observaciones.each(function(i, obj){
					obj.required = checkbox.is(':checked');
					console.log("changing");
				});
			});
		});
	});				

}

/*
Añade una fila para una nueva observacion en la 
lista de observaciones de 'aDoc'.
*/

function addObs(aDoc){
	target = $("#obs-"+aDoc+"-block");
	nextID = target.children().length / 2;
	name = aDoc+"-"+(nextID);

	target.append("<label name = '"+name+"', id = 'label-"+name+"''> Observacion #"
					+ (nextID+1) +" (<a class = 'delete-obs' onclick = \"deleteObs('"
					+name+"')\"> eliminar </a>)</label>");

	target.append("<input required type = 'text' name = '"
					+name+"' id = 'input-"+name
					+"' class = 'form-control'>");
}

/*
 Elimina la observacion 'obs' y re-enumera las observaciones 
 siguientes para mantener consistencia.
*/

function deleteObs(obs){
	var label = "#label-"+obs;
	var input = "#input-"+obs;
	var id = getIDFrom(obs);
	var doc = getPrefixFrom(obs);
	$(label).remove();
	$(input).remove();

	var labelsAndInputs = $("#obs-"+doc+"-block").children();

	if (labelsAndInputs.length == 0){
		addObs(doc);
	}
	else {
		for(var i = id*2; i < labelsAndInputs.length; i += 2){
			label = labelsAndInputs[i];
			input = labelsAndInputs[i+1];
	
			decreaseAttr("name", label);
			decreaseAttr("id", label);
			id = Math.floor(i/2);
			label.innerHTML = "Observacion #" + (id+1) 
								+" (<a class = 'delete-obs' onclick = \"deleteObs('"
								+doc+"-"+id+"')\"> eliminar </a>)";
	
			decreaseAttr("name", input);
			decreaseAttr("id", input);
		}
	}
}

/*
Decrementa en 1 el valor del indice del atributo 'attr' 
del objeto 'obj' (obj es un DOM object de javascript)
*/

function decreaseAttr(attr, obj){

	var attrID = getIDFrom(obj.getAttribute(attr));
	var prefix = getPrefixFrom(obj.getAttribute(attr));

	obj.setAttribute(attr, prefix+"-"+(attrID-1));
}

/* 	Obtiene el id de la cadena 'cad' (el id es un identificador 
	numerico que se encuentra al final de la cadena, 
	precedido por n '-', sin comillas)
*/
function getIDFrom(cad){
	return cad.substr(indexOfLast('-', cad)+1);
}

//Obtiene el prefijo de la cadena desde el primer caracter hasta el ultimo guion (-)
function getPrefixFrom(cad){
	return cad.substr(0, indexOfLast('-', cad));
}


 //Obtiene el indice del ultimo caracter k dentro de la cadena cad.
function indexOfLast(k, cad){
	var i = cad.length - 1;

	while(i >= 0 && cad[i] != k) i--;

	return i;
}