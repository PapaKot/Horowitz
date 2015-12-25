<?
class main extends module{
function run(){
	global $_events,$_struct,$_site,$_out;
	/*
	$_events->addListener('SectionReady',$this);
	
	$id = param('id');
	
	if($id=='home' || !$id){
		if(($sec = $_struct->getSection('faq'))
			&& ($modules = $sec->getModules())
			&& ($m = $modules->getByName('faq'))
		){
			$_events->addListener('PageReady',$m,array('tagname' => 'faq','sort' => '`sort` desc','size' => 6,'out_place' => '/page/section'));
		}
	}
	*/
}
function onSectionReady(){
	
}
}
?>