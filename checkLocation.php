<?php
error_reporting(0);
include "polyClass.php";
$pointLocation = new pointLocation();
$polygon = array("26.074360 91.533676","26.078754 91.557864","26.080680 91.580335","26.079983 91.596106","26.075352 91.606319","26.079425 91.611380","26.088034 91.616868","26.091530 91.621406","26.098214 91.634688","26.103256 91.648205","26.104399 91.662194","26.100904 91.679701","26.098540 91.692403","26.096869 91.704504","26.095532 91.720809","26.092666 91.723292","26.085482 91.724575","26.086417 91.734778","26.085964 91.746783","26.092632 91.765966","26.097026 91.778927","26.092639 91.779262","26.087636 91.782344","26.087412 91.788687","26.090580 91.794001","26.097238 91.809075","26.095446 91.816564","26.102826 91.823280","26.107123 91.835489","26.105658 91.852741","26.097834 91.868488","26.101108 91.871876","26.109661 91.864575","26.115976 91.853578","26.122132 91.847034","26.130743 91.856604","26.142417 91.857204","26.152819 91.870079","26.178856 91.867676","26.194212 91.861576","26.207718 91.852044","26.217479 91.838472","26.206910 91.790739","26.205581 91.752963","26.209355 91.742792","26.210548 91.734359","26.212454 91.731774","26.211588 91.726785","26.212281 91.712837","26.209432 91.690521","26.216593 91.681080","26.207507 91.673698","26.163643 91.641941","26.150738 91.623745","26.142957 91.599884","26.140953 91.571045","26.136638 91.558192","26.124925 91.541219","26.118452 91.518742","26.100571 91.497982","26.096794 91.501978","26.098567 91.516961","26.091322 91.531649");


$point = $_GET["latlng"];

if($pointLocation->pointInPolygon($point, $polygon))
	echo "True";
else
	echo "False";
?>