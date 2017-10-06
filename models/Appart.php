<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%v_appart}}".
 *
 * @property string $appart_id
 * @property string $real_estate_id
 * @property string $agent_id
 * @property string $street_id
 * @property string $building
 * @property integer $room_count
 * @property string $z_plos
 * @property string $stage
 *
 * @property Agent $agent
 * @property Street $street
 */
class Appart extends \app\models\Realestate
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%v_appart}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['agent_id', 'street_id', 'building', 'u_plos', 'stage'], 'required'],
            [['agent_id', 'street_id', 'room_count','stage'], 'integer'],
            [['z_plos'], 'number'],
            [['building'], 'string', 'max' => 30],
            [['agent_id'], 'exist', 'skipOnError' => true, 'targetClass' => Agent::className(), 'targetAttribute' => ['agent_id' => 'id']],
            [['street_id'], 'exist', 'skipOnError' => true, 'targetClass' => Street::className(), 'targetAttribute' => ['street_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'идентификатор',
            'agent_id' => 'идентификатор агента',
            'street_id' => 'идентификатор улицы',
            'building' => 'номер дома',
            'room_count' => 'кол-во комнат',
            'z_plos' => 'площадь жилая',
            'stage' => 'площадь участка',
        ];
    }
}
