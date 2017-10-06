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
 * @property string $z_plos
 * @property string $u_plos
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
            [['agent_id', 'street_id', 'building', 'u_plos'], 'required'],
            [['agent_id', 'street_id', 'room_count'], 'integer'],
            [['z_plos', 'u_plos'], 'number'],
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
            'u_plos' => 'площадь участка',
        ];
    }
}
