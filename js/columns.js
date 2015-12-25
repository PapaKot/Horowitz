//Vanilla JS + todo = rulez
function listColumns(ul,num,rule){
	var cWidth=Math.floor((ul.parentNode.offsetWidth-rule*(num-1))/num);
	ul.style.width = cWidth+'px';
	var cHeight=ul.offsetHeight/num
		,arLi=[]
		,arUl=[ul]
		,ulIndex=0
		,maxHeight=0;
	//устанавливаем ширину колонки
	ul.style.width=cWidth+'px';
	ul.style.width=(cWidth-(ul.offsetWidth-cWidth))+'px';
	ul.style.cssFloat=ul.style.styleFloat='left';
	if(ul.id)ul.removeAttribute('id');
	//копируем элементы из списка
	todo.loop(ul.getElementsByTagName('article'),function(i){
		arLi.push(this.cloneNode(true));
	});
	//удаляем все из списка
	while(ul.firstChild)ul.removeChild(ul.firstChild);
	//создаем колонки (клонируем список)
	for(var i=num;i>1;i--)
		arUl.push(ul.parentNode.appendChild(ul.cloneNode(true)));
	//распределяем элементы в колонки, считаем максимальную высоту колонки
	for(var i=0;i<arLi.length;i++){
		arUl[ulIndex].appendChild(arLi[i]);
		if(maxHeight<arUl[ulIndex].offsetHeight)
			maxHeight=arUl[ulIndex].offsetHeight;
		if(arUl[ulIndex].offsetHeight>=cHeight&&arUl.length-1>ulIndex){
			ulIndex++;
			arUl[ulIndex].style.marginLeft=rule+'px';
		};
	};
	//одинаковая высота колонок
	todo.loop(arUl,function(){
		this.style.height=maxHeight+'px';
	});
};