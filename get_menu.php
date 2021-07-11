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



try{
$server_ip="139.59.38.160";
  $response = array("menu"=>array(),"tezads"=>array(),"submenu"=>array(),"subsubmenu"=>array(),"ads"=>array(),"manualbookings"=>array(),"bookings"=>array(),"images"=>array(),"qrbookings"=>array());

   $result =$conn->query("SELECT ID FROM  user_details WHERE ID=$mobile");
          
         if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
          $uID=$row["ID"];
        }
         }


          $qrbookings=mysqli_query($conn, "SELECT s.ID,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered,b.End_Date,b.End_Time,b.Cost,b.ETR,b.Cost,b.pCost,b.PaymentMode,b.PaymentVerified,b.Is_Paid,(SELECT Photo FROM foods WHERE ID=s.FoodID) AS Photo FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID INNER JOIN book_ride b ON b.ID=d.ID WHERE b.User='$uID'  GROUP BY d.ID ORDER BY d.ID DESC LIMIT 5");

         
    while ($user1 = mysqli_fetch_assoc($qrbookings)) {

$jsonRow_201=array(
                 "ID"=>$user1['ID'],
            "OrderID"=>$user1['OrderID'],
                 "End_Time"=>$user1['End_Time'], 
                             "End_Date"=>$user1['End_Date'],
                              "Photo"=>'http://'.$server_ip.'/'.'Fruit'.'/'.'Dashboard'.'/'.'products'.'/'.$user1['Photo'],
            "Cost"=>$user1['Cost'],
              "pCost"=>$user1['pCost'],
                     "Delivered"=>$user1['Delivered'],
                           "ETR"=>$user1['ETR'],
                                      "PaymentMode"=>$user1['PaymentMode'],
                                                "PaymentVerified"=>$user1['PaymentVerified'],
                                                            "Is_Paid"=>$user1['Is_Paid'],
 );

array_push($response["qrbookings"], $jsonRow_201);
  

}

      
            $bookings=mysqli_query($conn, "SELECT s.ID,s.OrderID,s.CanteenID,s.Date, s.Time,d.Delivered,b.End_Date,b.End_Time,b.Cost,b.ETR,b.Cost,b.pCost,b.PaymentMode,b.PaymentVerified,b.Is_Paid,(SELECT Photo FROM foods WHERE ID=s.FoodID) AS Photo FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID INNER JOIN book_ride b ON b.ID=d.ID WHERE b.User_ID='$uID'  GROUP BY d.ID ORDER BY d.ID DESC LIMIT 5");

         
    while ($user1 = mysqli_fetch_assoc($bookings)) {

$jsonRow_201=array(
                 "ID"=>$user1['ID'],
            "OrderID"=>$user1['OrderID'],
                 "End_Time"=>$user1['End_Time'], 
                             "End_Date"=>$user1['End_Date'],
                              "Photo"=>'http://'.$server_ip.'/'.'Fruit'.'/'.'Dashboard'.'/'.'products'.'/'.$user1['Photo'],
            "Cost"=>$user1['Cost'],
              "pCost"=>$user1['pCost'],
                     "Delivered"=>$user1['Delivered'],
                           "ETR"=>$user1['ETR'],
                                      "PaymentMode"=>$user1['PaymentMode'],
                                                "PaymentVerified"=>$user1['PaymentVerified'],
                                                            "Is_Paid"=>$user1['Is_Paid'],
 );

array_push($response["bookings"], $jsonRow_201);
  

}

  $manualbookings=mysqli_query($conn, "SELECT (SELECT Name FROM user_details WHERE ID=b.User_ID) AS Name,s.ID,s.OrderID,s.CanteenID,d.Delivered,b.Date,b.Time,b.Cost,b.ETR,b.Cost,b.pCost,b.PaymentMode,b.PaymentVerified,b.Is_Paid,(SELECT Photo FROM foods WHERE ID=s.FoodID) AS Photo FROM `store_order` s INNER JOIN delievered d ON s.OrderID=d.OrderID INNER JOIN book_ride b ON b.ID=d.ID WHERE b.User='$uID'  GROUP BY d.ID ORDER BY d.ID ");

         
    while ($user1 = mysqli_fetch_assoc($manualbookings)) {

$jsonRow_201=array(
                 "ID"=>$user1['ID'],
                     "Name"=>$user1['Name'],
            "OrderID"=>$user1['OrderID'],
                 "End_Time"=>$user1['Time'], 
                             "End_Date"=>$user1['Date'],
                              "Photo"=>'http://'.$server_ip.'/'.'Fruit'.'/'.'Dashboard'.'/'.'products'.'/'.$user1['Photo'],
            "Cost"=>$user1['Cost'],
              "pCost"=>$user1['pCost'],
                     "Delivered"=>$user1['Delivered'],
                           "ETR"=>$user1['ETR'],
                                      "PaymentMode"=>$user1['PaymentMode'],
                                                "PaymentVerified"=>$user1['PaymentVerified'],
                                                            "Is_Paid"=>$user1['Is_Paid'],
 );

array_push($response["manualbookings"], $jsonRow_201);
  

}

           

    
    $ads=mysqli_query($conn, "SELECT `ID`,`Name`, `Weight`, `Unit`, `Description`, `MRP`, `JalpanPrice`, `Discount`, `Photo`,isOutOfStock FROM `foods` WHERE `Recomended`!=0 ORDER BY ID");
    while ($user1 = mysqli_fetch_assoc($ads)) {

$jsonRow_201=array(
              "ID"=>$user1['ID'],
            "Name"=>$user1['Name'],
                 "Description"=>$user1['Description'], 
                    "MRP"=>$user1['JalpanPrice'],
                 "Discount"=>$user1['Discount'], 
                   "Unit"=>$user1['Unit'], 
                          "Photo"=>'http://'.$server_ip.'/'.'Fruit'.'/'.'Dashboard'.'/'.'products'.'/'.$user1['Photo'],
                        "isOutOfStock"=>$user1['isOutOfStock'],
 );

array_push($response["ads"], $jsonRow_201);
  

}
    
            $menu=mysqli_query($conn, "SELECT `ID`, `Name`,`Photo`,`Colors`, `isActive`, `User`, `Date`, `Time` FROM `menu_type` WHERE `isActive`=1 ");

              $submenu=mysqli_query($conn, "SELECT `ID`, `Photo`, `Name`, `isActive`, `Date`, `Time` FROM `subsubmenu` WHERE `isActive`=1 ");


    $subsubmenu=mysqli_query($conn, "SELECT `ID`, `IDSubmenu`, `Category`, `isActive`, `Date`, `Time` FROM `subsubmenu` WHERE `isActive`=1");



     $tezads=mysqli_query($conn, "SELECT `ID`, `Photo` FROM `eTez_AD` ");    

     while ($user1 = mysqli_fetch_assoc($subsubmenu)) {

$jsonRow_201=array(
     "ID"=>$user1['ID'],
            "Name"=>$user1['Category'],
                 "IDSubmenu"=>$user1['IDSubmenu'],         
 );

array_push($response["subsubmenu"], $jsonRow_201);
  
}   


while ($user1 = mysqli_fetch_assoc($menu)) {

$jsonRow_201=array(
   "ID"=>$user1['ID'],
            "Name"=>$user1['Name'],
               "Photo"=>$user1['Photo'],
                        "Colors"=>$user1['Colors'],           
 );

array_push($response["menu"], $jsonRow_201);
  
}

while ($user1 = mysqli_fetch_assoc($submenu)) {

$jsonRow_201=array(
   "ID"=>$user1['ID'],
            "Name"=>$user1['Name'],
                         "Photo"=>'http://' . $server_ip . '/' . 'Fruit'.'/'.'Dashboard'.'/'.'products'. '/'.$user1['Photo'],
                              
 );

array_push($response["submenu"], $jsonRow_201);
  
}




while ($user1 = mysqli_fetch_assoc($tezads)) {

$jsonRow_201=array(
            
                          "Photo"=>'http://' . $server_ip . '/' . 'eTez'.'/'.'ad'. '/'.$user1['Photo'],
 );

array_push($response["tezads"], $jsonRow_201);
  
}


 $images=mysqli_query($conn, "SELECT `ID`,`Title`, `Description`, `Photo`, `User`, `Date`, `Time` FROM `canteen_AD` WHERE `isActive`=1");
    while ($user1 = mysqli_fetch_assoc($images)) {

$jsonRow_201=array(

                          "Photo"=>'http://'.$server_ip.'/'.'Fruit'.'/'.'Dashboard'.'/'.'products'.'/'.$user1['Photo'],
 );

array_push($response["images"], $jsonRow_201);
  

}

 
 if (isset($_POST['category'])){
    $category= $_POST['category'];
    $category=test_input($category);

     $result =$conn->query("SELECT `ID` FROM `menu_type` WHERE `Name`='$category'");
          
         if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
          $uID=$row["ID"];
        }
         }



                 $cat=mysqli_query($conn, "SELECT `Name` FROM `foods` WHERE `IDMenu`='$uID' ");


    while ($user1 = mysqli_fetch_assoc($cat)) {

$jsonRow_201=array(
               
              "Name"=>$user1['Name'],
               
 );

array_push($response["cat"], $jsonRow_201);
  

}
    }

   echo json_encode($response);    

} catch(Error $e) {
    $trace = $e->getTrace();
    echo $e->getMessage().' in '.$e->getFile().' on line '.$e->getLine().' called from '.$trace[0]['file'].' on line '.$trace[0]['line'];
}

}
}
 
    
 
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>