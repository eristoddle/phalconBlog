<?php
	try {
		//Create a DI
		$di = new Phalcon\DI\FactoryDefault();

		//Load ini file
		$config = new \Phalcon\Config\Adapter\Ini('../app/config/config.ini');
    	$di->set('config', $config);

		//Set up our views
		$di->set('view', function(){
			$view = new \Phalcon\Mvc\View();
			$view->setViewsDir(__DIR__.$config->phalcon->viewsDir);
			return $view;
		});

		//Our autoloaders
		$loader = new \Phalcon\Loader();
		$loader->registerDirs(array(
			__DIR__.$config->phalcon->controllersDir,
			__DIR__.$config->phalcon->modelsDir
		))->register();

		//Initialize our application
		$application = new \Phalcon\Mvc\Application($di);
		echo $application->handle()->getContent();
	} catch(\Phalcon\Exception $e) {
		echo "PhalconException: ", $e->getMessage();
	}
?>