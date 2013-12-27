<?php
use Phalcon\DI\FactoryDefault,
    Phalcon\Mvc\View,
    Phalcon\Mvc\Router,
    Phalcon\Mvc\Url as UrlResolver,
    Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter,
    Phalcon\Mvc\View\Engine\Volt as VoltEngine,
    Phalcon\Mvc\Model\Metadata\Memory as MetaDataAdapter,
    Phalcon\Session\Adapter\Files as SessionAdapter;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();
/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set(
    'url', function () use ($config) {
        $url = new UrlResolver();
        $url->setBaseUri($config->application->baseUri);
        return $url;
    }, true
);
/**
 * Setting up the view component
 */
$di->set(
    'view', function () use ($config, $di) {
        $view = new View();

        $view->setViewsDir($config->application->viewsDir);

        $view->registerEngines(
            array(
                '.volt' => function ($view, $di) use ($config) {

                        $volt = new VoltEngine($view, $di);

                        $volt->setOptions(
                            array(
                                'compiledPath' => $config->application->cacheDir,
                                'compiledSeparator' => '_'
                            )
                        );

                        return $volt;
                    },
                '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
            )
        );

        return $view;
    }, true
);
/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->set(
    'db', function () use ($config) {
        return new DbAdapter(array(
            'host' => $config->database->host,
            'username' => $config->database->username,
            'password' => $config->database->password,
            'dbname' => $config->database->dbname
        ));
    }
);
/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->set(
    'modelsMetadata', function () {
        return new MetaDataAdapter();
    }
);
/**
 * Start the session the first time some component request the session service
 */
$di->set(
    'session', function () {
        $session = new SessionAdapter();
        $session->start();
        return $session;
    }
);

//Register the flash service with custom CSS classes
$di->set(
    'flash', function () {
        return new \Phalcon\Flash\Direct(array(
            'error' => 'alert alert-error',
            'success' => 'alert alert-success',
            'notice' => 'alert alert-info',
        ));
    }
);

//Set up encryption key
$di->set(
    'crypt', function () use ($config) {
        $crypt = new Phalcon\Crypt();
        $crypt->setKey($config->application->encryptKey);
        return $crypt;
    }
);

//Dispatcher
$di->set(
    'dispatcher', function () use ($di) {
        $eventsManager = $di->getShared('eventsManager');
        $security = new Security($di);
        $eventsManager->attach('dispatch', $security);
        $dispatcher = new Phalcon\Mvc\Dispatcher();
        $dispatcher->setEventsManager($eventsManager);
        return $dispatcher;
    }
);

//Load config into the di
$di->set('config', $config);

//Logging
$di->set(
    'pingLogger', function () use ($config) {
        $logger = new \Phalcon\Logger\Adapter\File($config->application->logsDir . 'ping.log');
        return $logger;
    }
);

//Cache
$di->set(
    'viewCache', function () use ($config) {

        //Cache for one day
        $frontCache = new \Phalcon\Cache\Frontend\Data(array(
            "lifetime" => 86400
        ));

        //Set file cache
        $cache = new Phalcon\Cache\Backend\File($frontCache, array(
            "cacheDir" => $config->application->cacheDir
        ));

        return $cache;
    }
);

//Router
$di->set(
    'router', function () {
        $router = new Router();
        $router->add(
            "/", array(
                'controller' => 'posts',
                'action' => 'index',
            )
        );
        return $router;
    }
);