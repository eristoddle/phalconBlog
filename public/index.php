<?php
	try {
		//Create a DI
		$di = new Phalcon\DI\FactoryDefault();

		//Set up our views
		$di->set(’view’, function(){
			$view = new \Phalcon\Mvc\View();
			$view->setViewsDir(’../app/views/’);
			return $view;
		});

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