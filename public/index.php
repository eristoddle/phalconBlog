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
	} catch(\Phalcon\Exception $e) {
		echo "PhalconException: ", $e->getMessage();
	}
?>