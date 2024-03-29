<?php
header('content-type: text/html; charset=utf-8');

$bdd = new PDO('mysql: host=localhost; dbname=bddapp; charset=utf8;', 'superadmin', 'superadmin'); //changer en fonction de bdd