<?php

namespace app\controllers;

class AgentController extends \yii\web\Controller
{
    /** Информация об агенте по ID
    * @return string - JSON-строка с найденной записью
    */
    public function actionIndex( ) {
	$agent_id = \Yii::$app->request->get( 'id' ) ;
	$result = ( new \app\models\Agent( ) )
		->findOne( $agent_id )->getAttributes( ) ;

	return json_encode( $result ) ;
    }

}
