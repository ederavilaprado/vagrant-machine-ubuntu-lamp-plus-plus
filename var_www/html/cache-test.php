<?php
    $mem = new Memcached();
    $mem->addServer("127.0.0.1", 11211);
 
    $result = $mem->get("blah");
 
    if ($result) {
        echo $result;
    } else {
        echo "No matching key found yet. Let's start adding that now!";
        $mem->set("blah", "I am data!  I am held in memcached!") or die("Couldn't save anything to memcached...");
    }

    echo "<br />--------------------<br />";

    $arrResult = $mem->get("php_array");
    if ($arrResult) {
        echo "From cache:<br />";
        echo var_dump($arrResult);

    } else {
        $myArray = array(1, 2, 3, 4, 5, 6);
        $mem->set("php_array", $myArray, time() + 10);
        echo "<br>Set to cache";
    }

?>