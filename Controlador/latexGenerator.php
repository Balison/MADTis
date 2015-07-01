<?php
	function genMultipleEnumeration($arg)
	{
		$latex = "";

		foreach ($arg as $key => $values) {
			$latex = $latex.bold($key).endl().enumerate($values).endl().endl();
		}

		return $latex;
	}

	function endl(){
		return "\n";
	}

	function bold($str){
		return "\\textbf $str";
	}

	function enumerate($list){
		$latex = "\\begin{enumerate}\n";
		foreach ($list as $str) {
			$latex = $latex.item($str).endl();
		}
		return $latex."\\end{enumerate}";
	}
	function item($str)
	{
		return "\\item $str";
	}
?>