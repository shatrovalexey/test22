<?php

namespace app\models;

/**
 * This is the common model class for any real estate objects.
 *
 * @property string $id
 * @property string $agent_id
 * @property string $street_id
 * @property string $building
 * @property integer $room_count
 * @property string $z_plos
 *
 * @property Agent $agent
 * @property Street $street
 */
use Yii;

class Realestate extends \yii\db\ActiveRecord {
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAgent()
    {
        return $this->hasOne( Agent::className( ) , [ 'id' => 'agent_id' ] ) ;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStreet()
    {
        return $this->hasOne( Street::className( ) , [ 'id' => 'street_id' ] ) ;
    }
}