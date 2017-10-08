<?php
	/**
	* @package AgentController класс для агентов
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/

namespace app\controllers;

class AgentController extends \yii\web\Controller
{
    /** Информация об агенте по ID
    * @return string - JSON-строка с найденной записью
    */
    public function actionIndex( ) {
	$agent_id = \Yii::$app->request->get( 'id' ) ;
	if ( $result = ( new \app\models\Agent( ) )->findOne( $agent_id ) ) {
		\Yii::$app->response->format = \yii\web\Response::FORMAT_JSON ;

		return $result->getAttributes( ) ;
	}

	return null ;
    }

}
