   function select(url, pageNo){
     console.log("url:"+url);
     console.log("pageNo:"+pageNo);
     console.log("genre:"+ $("#genre"));
     
     let frm = document.boardFrm;
     //$("#pageNo").val(1); //jquery
     frm.action = url;
     frm.pageNo.value=pageNo;//javascript
     frm.genre.value = $("#genre");
     frm.submit();//controller call  
   }
   
   $("#boardTable>tbody").on("click","tr",function(e){
	     console.log("#boardTable>tbody");
	     let tdArray = $(this).children();
	     console.log('tdArray:'+tdArray);
	     let musicId = tdArray.eq(7).text();
	     
	     let popupUrl = "music/music_detail/?musicId=" + musicId;
	     let popupName = "MusicDetailPopup";
	     let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
	     window.open(popupUrl, popupName, popupOptions);
	   });
   
 
   function doRetrieveCall(pageNo){
       let frm = document.boardFrm;
       //$("#pageNo").val(1); //jquery
       frm.pageNo.value=pageNo;//javascript
       frm.submit();//controller call    
   }
   
   $("#searchWord").on("keypress",function(e){
      console.log("searchWord");
      if(13 == e.which){//enter keycode
        e.preventDefault();
        doRetrieveCall(1);
      }
   });
   
   
   $("#doRetrieve").on("click",function(){
        console.log("doRetrieve");
        doRetrieveCall(1);
   });