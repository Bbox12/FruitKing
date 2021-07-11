<?php
 header('Content-Type: application/json');


require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("user"=> array());



if (isset($_POST['date']) ){
 
    // receiving the post params
   $mobile =isset($_POST['mobile']) ? $_POST['mobile'] : '';
   $date = isset($_POST['date']) ? $_POST['date'] : '';
   $time = isset($_POST['time']) ? $_POST['time'] : '';
   $details=isset($_POST['details']) ? $_POST['details'] : '';
   $from=isset($_POST['from']) ? $_POST['from'] : '';
   $address=isset($_POST['address']) ? $_POST['address'] : '';

   
    $mobile=test_input($mobile);
    $details=test_input($details);
    $time=test_input($time);
    $date=test_input($date);
    $from=test_input($from);
    $address=test_input($address);






    $ID =$_POST['ID'];
    $ID=test_input($ID);



           
      
         $user = $db-> add_order_plattersIOS($ID,$mobile,$date,$from,$time,$details,$address);
      

        if ($user) {
  
          $jsonRow_201=array(
  "ID"=>1,   
                
                
 );

array_push($response["user"], $jsonRow_201);

        } else {
       $jsonRow_201=array(
  "ID"=>0,   
                
                
 );

array_push($response["user"], $jsonRow_201);
        
        }
    
} else {
    $jsonRow_201=array(
  "ID"=>0,   
                
                
 );

array_push($response["user"], $jsonRow_201);
        
}
    echo json_encode($response);

function test_input($from) {
  $from = trim($from);
  $from = stripslashes($from);
  $from = htmlspecialchars($from);
  return $from;
}
?>