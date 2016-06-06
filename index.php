<?php
//front crontroller
function page_not_found(){
	echo "404\n";
}

//echo "index.php\n";
$base_path='/var/www/html/piggy_assesment/';
$base_uri='/piggy_assesment';
$uri_raw = $_SERVER['REQUEST_URI'];
$uri = preg_replace(":^$base_uri:", "", $uri_raw);
//echo '$uri'."\n";
//var_dump($uri);
//we want to split on slashes
$parts_raw = explode('/', $uri);
$parts = array_slice($parts_raw, 1);
//echo "\$parts\n";
//var_dump($parts);
if(count($parts)>0&&$parts[0]!="") {
	$controller_name = $parts[0];
}
else{
	$controller_name = "DefaultController";
}
if(count($parts)>1){
	$function_name = $parts[1];
}
$params  = array_slice($parts, 2);
$controller_path = "$base_path/controllers/$controller_name.php";
//echo "\$controller_path\n";
//echo "";
if(file_exists($controller_path)){
	require($controller_path);
	$controller = new $controller_name;
	if(!isset($function_name)) {
		//default method
		$function_name = "index";
	}
	if(method_exists($controller, $function_name)) {
		call_user_func_array([$controller, $function_name], $params);
	}
	else{
		page_not_found();
	}
}
else{
	page_not_found();
}
?>
