<?php

namespace app\models;

use Yii;

/**
 * Класс модели для сущности "{{%v_appart}}".
 *
 * @property string $appart_id
 * @property string $real_estate_id
 * @property string $agent_id
 * @property string $street_id
 * @property string $building
 * @property integer $room_count
 * @property string $area_live
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
            [['agent_id', 'street_id', 'building', 'area_live', 'stage'], 'required'],
            [['agent_id', 'street_id', 'room_count','stage'], 'integer'],
            [['area_live'], 'number'],
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
            'area_live' => 'площадь жилая',
            'stage' => 'площадь участка',
	    'agent_fname' => 'имя агента' ,
	    'agent_sname' => 'фамилия агента' ,
	    'agent_phone' => 'телефон агента' ,
	    'street_title' => 'название улицы'
        ];
    }
}
