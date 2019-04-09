<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\modules\currency\models\Currency;
use yii\filters\auth\HttpBearerAuth;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
    
    public function actionLogin() {
        $post = Yii::$app->request->post();
        $login = new LoginForm();
        $login->username = $post['username'];
        $login->password = $post['password'];
        $login->login();
        if (!$login)
            return false;
        $arr = ['Access Token' => \Yii::$app->user->identity->accessToken];
        $decoded = json_encode($arr);
        return $decoded; 
    }
    
    public function actionGetcurrencylist() 
    {
        $post = Yii::$app->request->post();
        if (!$this->checkAuth($post))
            die('denied');

        if (isset($post['limit']))
            $limit = (int)$post['limit'] ?? 0;
        else
            $limit = -1;
        if (isset($post['offset']))
            $offset = (int)$post['offset'] ?? 0;
        else
            $offset = 0;
        $list = (new \yii\db\Query())
                ->select(['name', 'rate'])
                ->from('currency')
                ->limit($limit)
                ->offset($offset)
                ->all();
        
        return $this->sendData($list);
    }
    
    public function sendData($data) {
        header('Content-type: application/json');
        die(json_encode($data));
    }
    
    
    public function actionGetcurrencybyid() 
    {
        $post = Yii::$app->request->post();
        if (!$this->checkAuth($post))
            die('denied');
        if (empty($post['id']))
            die('denied');
        
        $model = Currency::findOne(['id' => (int)$post['id']]);
        if (empty($model))
            die('no-record');
            
        $data = [
            'name' => $model->name,
            'rate' => $model->rate
        ];
        return $this->sendData($data);
    }
    
    private function checkAuth($param) 
    {
        $post = Yii::$app->request->post();
        if (empty($post) || empty($post['Authentication'])) 
            return false;
        $user = \app\models\User::findIdentityByAccessToken($post['Authentication']);
        if (empty($user))
            return false;
        return true;
    }


    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}
