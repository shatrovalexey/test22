<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%agent}}".
 *
 * @property string $id
 * @property string $fname
 * @property string $sname
 * @property string $phone
 *
 * @property Appart[] $apparts
 * @property Cottage[] $cottages
 */
class Agent extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%agent}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fname', 'sname', 'phone'], 'required'],
            [['fname', 'sname'], 'string', 'max' => 40],
            [['phone'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'идентификатор',
            'fname' => 'имя',
            'sname' => 'фамилия',
            'phone' => 'телефон',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApparts()
    {
        return $this->hasMany(Appart::className(), ['agent_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCottages()
    {
        return $this->hasMany(Cottage::className(), ['agent_id' => 'id']);
    }
}
