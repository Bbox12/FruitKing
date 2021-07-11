<?php
 header('Content-Type: application/json');


require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array();



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



   $ID=isset($_POST['ID']) ? $_POST['ID'] : '';

   
    $ID=test_input($ID);


    $address =$_POST['address'];
    $address=test_input($address);
    $IP=$_POST['IP'];
    $IP=test_input($IP);


           
      
         $user = $db-> add_order_platters($ID,$mobile,$date,$from,$time,$details,$address,$IP);
      

        if ($user) {
  
  $response["error"] = FALSE;

        } else {
            // user failed to store
    $response["error"] = TRUE;
        
        }
    
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters missing!";
    echo json_encode($response);
}
    echo json_encode($response);

function test_input($from) {
  $from = trim($from);
  $from = stripslashes($from);
  $from = htmlspecialchars($from);
  return $from;
}
?>