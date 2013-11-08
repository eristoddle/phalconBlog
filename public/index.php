<?php
	try {
		//Our autoloaders
		$loader = new \Phalcon\Loader();
		$loader->registerDirs(array(
			'../app/controllers/',
			'../app/models/'
		))->register();
	} catch(\Phalcon\Exception $e) {
		echo "PhalconException: ", $e->getMessage();
	}
?>