<?php
class metaArticles extends module{
	protected $table = 'articles_meta';
	function run(){
		global $_out;
		$mysql = new mysql();
		$row = filter_var(param('row'),FILTER_VALIDATE_INT);
		if(($rs = $mysql->query('select * from `'.$mysql->getTableName($this->table).'` where '
				.'`section`="'.$this->getSection()->getId().'" and `module`="'.$this->getConf('module',true).'" and `id_article`='.($row ? $row : 0)))
			&& ($r = $mysql->fetch($rs))
		){
			if($v = $r['title']) $_out->setMeta('title',$v);
			if($v = $r['keywords']) $_out->setMeta('keywords',$v);
			if($v = $r['description']) $_out->setMeta('description',$v);
			if(($v = $r['h1']) && ($e = $_out->query('/page/section')->item(0)))
				$e->setAttribute('h1',$v);
		}
	}
	function getConf($name,$required = false){
		$v = $this->evaluate('string(config/@'.$name.')');
		if(!$v && $required) vdump('No '.$name.' has been chosen');
		return $v;
	}
}