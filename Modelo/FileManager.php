<?php
	class FileManager{

		private $currentFolder;

		function __construct($aPath){
			$this->setPath($aPath);
		}

		public function goIntoFolder($aFolder){
			$this->setPath($this->currentFolder."/".$aFolder);
		}


		public	function setPath($aPath){
			$this->currentFolder = $aPath;
			$this->checkPath();
		}

		public function saveUploadedFile($tmpFile, $fileName, &$paths){
			$absolutePath = $this->currentFolder."/".$fileName;
			$result = move_uploaded_file($tmpFile, $absolutePath);
			
			if ($result)
				$paths[] = $absolutePath;
			return $result;
		}

		private function checkPath(){
			if (!file_exists($this->currentFolder)){
				mkdir($this->currentFolder, 0777);
				touch('index.php');
			}
		}
	}

?>