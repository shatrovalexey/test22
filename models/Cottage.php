<?php

namespace app\models;

use Yii;

/**
 * Модель к сущности "{{%v_cottage}}".
 *
 * @property string $id - идентификатор
 * @property string $agent_id - идентификатор агента
 * @property string $street_id
 * @property string $building
 * @property integer $room_count
 * @property string $area_live
 * @property string $area_real
 * @property string $agent_fname
 * @property string $agent_sname
 * @property string $agent_phone
 * @property string $street_title
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
        return '{{%v_cottage}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['agent_id', 'street_id', 'building', 'area_real', 'area_live'], 'required'],
            [['agent_id', 'street_id', 'room_count'], 'integer'],
            [['area_live', 'area_real'], 'number'],
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
            'area_real' => 'площадь участка',
	    'agent_fname' => 'имя агента' ,
	    'agent_sname' => 'фамилия агента' ,
	    'agent_phone' => 'телефон агента' ,
	    'street_title' => 'название улицы'
        ];
    }
}
