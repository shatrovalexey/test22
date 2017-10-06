<?php

namespace app\controllers;

class RealestateController extends \yii\web\Controller
{
    public function actionIndex( )
    {
	$className = preg_replace( '{Controller$}s' , '' , ( new \ReflectionClass( $this ) )->getShortName( ) ) ;
	$className = 'app\\models\\' . $className ;
	$rsh = new $className( ) ;
	$params = array( ) ;

	foreach ( $rsh->attributeLabels( ) as $key => $label ) {
		$value = \Yii::$app->request->get( $key ) ;

		if ( is_null( $value ) ) {
			continue ;
		}

		$params[ $key ] = explode( ',' , $value ) ;
	}

	$results = array( ) ;
	foreach ( $rsh->findAll( $params ) as $result ) {
		$results[] = $result->getAttributes( ) ;
	}

	return json_encode( $results ) ;
    }

}
