<?php

	function renderInputFieldset($id, $name){
		echo <<< HTML
			<fieldset>
				<div class='form-group'>
					<label for = '$id'>Correccion $name:</label>
					<input name = '$id' type='file' class='btn btn-primary' required><br>
				</div>
			</fieldset>
HTML;

	}
?>