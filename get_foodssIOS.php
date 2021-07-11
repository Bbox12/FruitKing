<?php


header('Content-Type: application/json');
        require_once 'DB_Connect.php';
        // connecting to database
        $db = new Db_Connect();
        $conn = $db->connect();

 
if(!$conn){
   echo "Could not connect to DBMS"; 
    }else { 


if (isset($_POST['_mId'])){
 
    $mobile= $_POST['_mId'];
   
    $mobile=test_input($mobile);
  }


if (isset($_POST['menu'])){
 
    $menu= $_POST['menu'];
   
    $menu=test_input($menu);

}else{
     $menu="";
}


if (isset($_POST['food'])){
 
    $food= $_POST['food'];
   
    $food=test_input($food);

}else{
      $food="";
}


if (isset($_POST['submenu'])){
 
    $submenu= $_POST['submenu'];
   
    $submenu=test_input($submenu);

}else{
     $submenu="";
}



try{
$server_ip="139.59.38.160";
  $response = array("second"=>array());




     
     $second=mysqli_query($conn, "SELECT f.ID,f.IDMenu,f.IDSubsubmenu,f.isOutOfStock,sm.Category AS Submenu,m.Name AS Menu,m.Colors,f.Name,f.Weight,f.Unit,f.Description,f.MRP,f.JalpanPrice,f.Discount,f.Photo,smsm.Name AS PrimaryCategory FROM `foods` f  INNER JOIN submenu sm ON sm.ID=f.IDSubsubmenu INNER JOIN menu_type m ON m.ID=f.IDMenu INNER JOIN subsubmenu smsm ON smsm.ID=f.IDSubmenu WHERE f.Available=1  AND f.IDMenu='$food' AND sm.Category='$submenu' GROUP BY f.ID ");

     while ($user1 = mysqli_fetch_assoc($second)) {

$jsonRow_201=array(
  "ID"=>$user1['ID'],
    
              "Brand"=>$user1['Brand'],
                 "IDSubsubmenu"=>$user1['IDSubsubmenu'],
                         "Name"=>$user1['Name'],
                          "Weight"=>$user1['Weight'],
                          "Unit"=>$user1['Unit'],
                            "Colors"=>$user1['Colors'],
                                  "PrimaryCategory"=>"",
                         "MRP"=>$user1['MRP'],
                          "FruitExpressPrice"=>$user1['JalpanPrice'],
                             "Discount"=>$user1['Discount'],
                          "Photo"=>'http://' . $server_ip . '/' . 'Fruit'.'/'.'Dashboard'.'/'.'products'. '/'.$user1['Photo'],
                                "Menu"=>$user1['Menu'],
                          "Subsubmenu"=>$user1['Subsubmenu'],
                         "Submenu"=>$user1['Submenu'],
                         "Description"=>$user1['Description'],
                            "isOutOfStock"=>$user1['isOutOfStock'],

                            
 );

array_push($response["second"], $jsonRow_201);
  
}





      

   echo json_encode($response);    

} catch(Error $e) {
    $trace = $e->getTrace();
    echo $e->getMessage().' in '.$e->getFile().' on line '.$e->getLine().' called from '.$trace[0]['file'].' on line '.$trace[0]['line'];
}

}

 
    
 
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>