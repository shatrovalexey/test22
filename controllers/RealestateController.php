<?php

namespace app\controllers;

class RealestateController extends \yii\web\Controller
{
    public function actionIndex( )
    {
	$shortClassName = preg_replace( '{Controller$}s' , '' , ( new \ReflectionClass( $this ) )->getShortName( ) ) ;
	$className = 'app\\models\\' . $shortClassName ;
	$obj = new $className( ) ;
	$params_where = array( ) ;
	$entityName = 'v_' . strToLower( $shortClassName ) ;

	$rsh = ( new \yii\db\Query( ) )->select( '*' )->from( $entityName ) ;

	foreach ( $obj->attributeLabels( ) as $key => $label ) {
		$value = \Yii::$app->request->get( $key ) ;

		if ( is_null( $value ) ) {
			continue ;
		}

		$args = [ ] ;

		if ( ! preg_match( '{[,-]}s' , $value ) ) {
			$args[ $key ] = $value ;
		} elseif ( strpos( $value , ',' ) === false ) {
			$args = explode( '-' , $value ) ;
			$args = array_merge( [ 'between' , $key ] , $args ) ;
		} else {
			$args = explode( ',' , $value ) ;
			$args = array_merge( [ 'and' , $key ] , $args ) ;
		}

		$rsh->andWhere( $args ) ;
	}

	$results = $rsh->all( ) ;

	return json_encode( $results ) ;
    }

}
