function select(url, pageNo){
     console.log("url:"+url);
     console.log("pageNo:"+pageNo);
     
     let frm = document.boardFrm;
     //$("#pageNo").val(1); //jquery
     frm.action = url;
     frm.pageNo.value=pageNo;//javascript
     frm.submit();//controller call  
   }


   //table 목록 click시 seq값 찾기
   $("#boardTable>tbody").on("click","tr",function(e){
     console.log("#boardTable>tbody");
     let tdArray = $(this).children();
     console.log('tdArray:'+tdArray);
     let seq = tdArray.eq(0).text();
     console.log('seq:'+seq);
     //div,seq
     //http://localhost:8080/ehr/board/doSelectOne.do?div=10&seq=393
     window.location.href = "/post/select?div="+$("#div").val()+"&seq="+seq;
     
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