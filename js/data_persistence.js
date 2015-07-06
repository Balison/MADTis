var data;

var saveState = function(){
	node = $(this);
	console.log(node.attr('name') + " has changed to: " + node.val());

	save(node);

	console.log("stored for: " + name_for(node) + " -> " + localStorage.getItem(name_for(node)));

}

$(document).on('DOMNodeInserted', 'input', function(e){
	nodeName = e.target.getAttribute('name');
	node = $('input[name="'+ nodeName +'"]');
	console.log(node.attr('name'));
	if (node.hasClass(data.membrecy))
		start_to_listen(node);
});

function name_for(node){
	return data.key+"-"+data.membrecy+"-"+node.attr('name');
}

function start_to_listen(node){
	console.log("starting to save state of: "+node.attr('name'));
	node.on('keypress keyup change input', saveState);
	console.log("last value for: "+name_for(node) + " -> " +get(node));
	if (get(node) !== null){
		set(node);
	}
}

function start_persistence(aData){
	data = aData;
	console.log('data persistence started for:' + data.key + " with: " + data.membrecy);

	$("."+data.membrecy).each(function(){
		start_to_listen($(this));
	});
}

function change_persistence_key(newKey){
	data.key = newKey;
	console.log("new Key -> "+data.key);
	$('.'+data.membrecy).each(function(){
		set($(this));
	})
}

function unsetStored(node){
	localStorage.removeItem(name_for(node));
	console.log(name_for(node) + " -> " + get(node));
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
	console.log("value: "+name+" -> "+localStorage.getItem(data.key+"-"+data.membrecy+"-"+id));
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