<?php
 header('Content-Type: application/json');


require_once 'DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("user" => array());




if (isset($_POST['mobile']) ){
 
    // receiving the post params
   $mobile =isset($_POST['mobile']) ? $_POST['mobile'] : '';
   $pin = isset($_POST['pin']) ? $_POST['pin'] : '';
   $total = isset($_POST['total']) ? $_POST['total'] : '';
   $name=isset($_POST['name']) ? $_POST['name'] : '';
   $data=isset($_POST['data']) ? $_POST['data'] : '';
   $phone=isset($_POST['phone']) ? $_POST['phone'] : '';

   
    $mobile=test_input($mobile);
    $name=test_input($name);
    $total=test_input($total);
    $pin=test_input($pin);
    $data=test_input($data);
    $phone=test_input($phone);


   $amount=isset($_POST['amount']) ? $_POST['amount'] : '';
   $amount=test_input($amount);

   $paid=isset($_POST['paid']) ? $_POST['paid'] : '';
   $paid=test_input($paid);

    $address =$_POST['address'];
    $address=test_input($address);
    $IP=$_POST['IP'];
    $IP=test_input($IP);
    $pay =$_POST['pay'];
    $pay=test_input($pay);

           
      
         $user = $db-> add_order_Manual($mobile,$pin,$data,$total,$name,$phone,$address,$IP,$pay,$amount,$paid);
      

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

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>