var data;

var saveState = function(){
	node = $(this);
	save(node);
}

$(document).on('DOMNodeInserted', 'input', function(e){
	nodeName = e.target.getAttribute('name');
	node = $('input[name="'+ nodeName +'"]');
	if (node.hasClass(data.membrecy))
		start_to_listen(node);
});

function name_for(node){
	return data.key+"-"+data.membrecy+"-"+node.attr('name');
}

function start_to_listen(node){
	node.on('keypress keyup change input', saveState);
	if (get(node) !== null){
		set(node);
	}
}

function start_persistence(aData){
	data = aData;

	$("."+data.membrecy).each(function(){
		start_to_listen($(this));
	});
}

function change_persistence_key(newKey){
	data.key = newKey;
	$('.'+data.membrecy).each(function(){
		set($(this));
	})
}

function unsetStored(node){
	localStorage.removeItem(name_for(node));
}

function set(node){
	node.attr('value', get(node));
}

function get(node){
	return localStorage.getItem(name_for(node));
}

function save(node){
	return localStorage.setItem(name_for(node), node.val());
}

function setValueInt(id, value){
	var name = data.key+"-"+data.membrecy+"-"+id;
	if (value == '++'){
		localStorage.setItem(name, getValueInt(id)+1);
	} else 
	if (value == '--'){
		localStorage.setItem(name, getValueInt(id)-1);
	}
}

function getValueInt(id){
	var name = data.key+"-"+data.membrecy+"-"+id;
	var value = localStorage.getItem(name);

	return value === null ? 0 : parseInt(value);
}

function swapValues(a, b){
	var aux = getValueInt(a);
	setValueInt(a, getValueInt(b));
	setValueInt(b, aux);
}