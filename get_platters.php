<?php


header('Content-Type: application/json');
        require_once 'DB_Connect.php';
        // connecting to database
        $db = new Db_Connect();
        $con = $db->connect();


 date_default_timezone_set('Africa/Johannesburg');
        $hour=date("H:i:s");
        $date=date("d-m-Y");
         $server_ip="139.59.38.160";

if(!$con){
   echo "Could not connect to DBMS";       
 }else {
   if (isset($_POST['ID'])){


 
    $otp= $_POST['ID'];
   
    $otp=test_input($otp);



  $response = array("platters"=>array(),"plattersname"=>array());


$sql="SELECT `ID`, `Name`, `Photo`, `Description`, `isActive`, `User`, `Date`, `Time` FROM `platter_type` WHERE `isActive`=1";
    


$result = $con->query($sql);


  while ($user = mysqli_fetch_assoc($result)) {

$jsonRow=array(
               "ID"=>$user['ID'],
                     "Name"=>$user['Name'],
                "Description"=>$user['Description'],
                "Photo"=>$user['Photo'],
        
             );


array_push($response["platters"], $jsonRow);


}



$plattersname="SELECT `ID`, `Name`, `Date`, `Time` FROM `platters` ";
    


$result = $con->query($plattersname);


  while ($user = mysqli_fetch_assoc($result)) {

$jsonRow=array(
               "ID"=>$user['ID'],
                     "Name"=>$user['Name'],
        
        
             );


array_push($response["plattersname"], $jsonRow);


}





}

 echo json_encode($response);


}


 

 
 function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}     



?>