
$(document).ready(function(){
	$('#ge-list').on('change', modifyObs);
	start_persistence({
		key: $('#ge-list').val(),
		membrecy: 'persistent'
	});
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
		change_persistence_key($('#ge-list').val());
		$('div .doc-obs').hide();


		//añade la funcion de ocultar y mostrar los bloques de observaciones
		$(':checkbox').change(function(){

			var checkbox = $(this);
			var docName = checkbox.attr('encoded');

			docObs = "#obs-"+docName;
			
			$(docObs).stop().slideToggle(400, function(){
				console.log($(docObs).children('input').length);
				var observaciones = $(docObs+'-block').children('input');

				var i = 0;
				while (getValueInt('obs-count') > i){
					addObs(docName, false);
					console.log(getValueInt('obs-count') + " - " + observaciones.length);
					i++;
					if (i > 20) break;
				}

				if (checkbox.is(':checked') && i == 0){
					addObs(docName, true);
				}


				observaciones.each(function(i, obj){
					obj.required = checkbox.is(':checked');
					if (obj.required == true){
						obj.setAttribute('pattern', '\\S.+');
					} else {
						console.log('lala');
						obj.setAttribute('pattern', '.*');
					}
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

function addObs(aDoc, count){
	target = $("#obs-"+aDoc+"-block");
	nextID = target.children().length / 2;
	name = aDoc+"-"+(nextID);

	target.append("<label name = '"+name+"', id = 'label-"+name+"''> Observacion #"
					+ (nextID+1) +" (<a class = 'delete-obs' onclick = \"deleteObs('"
					+name+"')\"> eliminar </a>)</label>");

	target.append("<input required type = 'text' name = '"
					+name+"' id = 'input-"+name
					+"' pattern = "+'"\\S.+"' 
					+"  title = 'La observacion esta vacia o tiene espacios en blanco al inicio'"
					+"  class = 'persistent obs-control form-control'>");

	if (count)
		setValueInt('obs-count', '++');
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

	setValueInt('obs-count', '--');
	unsetStored($(input));

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

			var oldName = input.getAttribute('name');
			var current = decreaseAttr("name", input);
			var newID 	= decreaseAttr("id", input);
		
			swapValues(oldName	, current);
			set($('#'.newID));
		}
	}

}

/*
Decrementa en 1 el valor del indice del atributo 'attr' 
del objeto 'obj' (obj es un DOM object de javascript)
Devuelve el nuevo valor del 'attr'
*/

function decreaseAttr(attr, obj){

	var attrID = getIDFrom(obj.getAttribute(attr));
	var prefix = getPrefixFrom(obj.getAttribute(attr));

	obj.setAttribute(attr, prefix+"-"+(attrID-1));

	return prefix+"-"+(attrID-1);
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