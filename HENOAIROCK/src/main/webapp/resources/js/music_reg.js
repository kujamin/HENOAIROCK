	function redirectToMusicReg(genre) {
        // genre 값을 받아와서 검색 쿼리에 추가한 뒤 리다이렉트
        window.location.href = 'music_reg?genre=' + encodeURIComponent(genre);
    }
	
	function redirectToMusicRegEmo(feeling) {
        // genre 값을 받아와서 검색 쿼리에 추가한 뒤 리다이렉트
        window.location.href = 'music_reg?feeling=' + encodeURIComponent(feeling);
    }
	
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
	

	function select(url, pageNo){
     console.log("url:"+url);
     console.log("pageNo:"+pageNo);
     let frm = document.boardFrm;
     //$("#pageNo").val(1); //jquery
     frm.action = url;
     frm.pageNo.value=pageNo;//javascript
     frm.submit();//controller call  
   }


   $(document).ready(function() {
	   $("tr").on("click", function() {
		   	var musicId = $(this).find("[data-musicid]").data("musicid");
	        var title = $(this).closest("tr").find(".title").data("title");
	        var artist = $(this).closest("tr").find(".artist").data("artist");
	        var album = $(this).closest("tr").find(".album").data("album");
	        var genre = $(this).closest("tr").find(".genre").data("genre");
	        var feeling = $(this).closest("tr").find(".feeling").data("feeling");
	        var albumImage = $(this).closest("tr").find(".album-image").attr("src");

	            // 앨범 이미지를 부모 페이지의 엘리먼트에 추가
        var parentAlbumImageContainer = window.opener.document.getElementById("albumImageContainer");
        if (parentAlbumImageContainer) {
            parentAlbumImageContainer.querySelector(".selected-album-image").src = albumImage;
            parentAlbumImageContainer.querySelector(".selected-title").textContent = title;
            parentAlbumImageContainer.querySelector(".selected-artist").textContent = artist;
            parentAlbumImageContainer.querySelector(".selected-album").textContent = album;
            parentAlbumImageContainer.querySelector(".selected-musicId").value = musicId;
	            } else {
	                console.error("Element with ID 'albumImageContainerParent' not found in the parent window.");
	            
	        } 
	        window.close();
	    });

	    $("#boardTable>tbody").on("click", "tr", function(e) {
	        if ($(e.target).hasClass("add-music-btn")) {
	            return;
	        }
	        let tdArray = $(this).children();
	        let musicId = tdArray.eq(8).text();
	        console.log('musicId:' + musicId);
	    });
	});

 

   