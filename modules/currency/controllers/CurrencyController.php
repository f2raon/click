<?php

namespace app\modules\currency\controllers;

use yii\console\Controller;
use app\modules\currency\models\Currency;

/**
 * Default controller for the `currency` module
 */
class CurrencyController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $url = 'http://www.cbr.ru/scripts/XML_daily.asp';
        $decoded = simplexml_load_string(file_get_contents($url));
        foreach ($decoded as $item) {
            $currency = Currency::findOne(['name' => $item->Name]);
            if (empty($currency)) {
                $currency = new Currency();
            }
            $currency->name = $item->Name;
            $currency->rate = $item->Value;
            $currency->save();
        }
        die("done\r\n");
    }
}
