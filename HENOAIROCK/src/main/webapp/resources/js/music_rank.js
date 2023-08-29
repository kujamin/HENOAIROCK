	function redirectToMusicReg(genre) {
        // genre 값을 받아와서 검색 쿼리에 추가한 뒤 리다이렉트
        window.location.href = 'music_rank?genre=' + encodeURIComponent(genre);
    }
	
	function redirectToMusicRegEmo(feeling) {
        // genre 값을 받아와서 검색 쿼리에 추가한 뒤 리다이렉트
        window.location.href = 'music_rank?feeling=' + encodeURIComponent(feeling);
    }
	
	 $("tr").on("click", function() {
	      var musicId = $(this).find("[data-musicid]").data("musicid");
	      console.log("Clicked Music ID:", musicId);
	      	// 팝업 창 열기
		    let popupUrl = "/music/music_detail/?musicId=" + musicId;
		    let popupName = "MusicDetailPopup";
		    let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
		    window.open(popupUrl, popupName, popupOptions);
	    });