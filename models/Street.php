<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%street}}".
 *
 * @property string $id
 * @property string $title
 *
 * @property Appart[] $apparts
 * @property Cottage[] $cottages
 */
class Street extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%street}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title'], 'required'],
            [['title'], 'string', 'max' => 60],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'идентификатор',
            'title' => 'название',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApparts()
    {
        return $this->hasMany(Appart::className(), ['street_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCottages()
    {
        return $this->hasMany(Cottage::className(), ['street_id' => 'id']);
    }
}
