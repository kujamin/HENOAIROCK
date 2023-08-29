$(document).ready(function() {
    // 페이지 로드 시 댓글 가져오기
	$("#doAddComment").on("click", function() {
        var commentText = $("#comments").val();

        if (!commentText) {
            alert("댓글을 입력하세요.");
            $("#comments").focus();
            return;
        }

        var userId = "${sessionScope.user.userId}";
        var postSeq = $("#seq").val();
        
        $.ajax({
            type: "POST",
            url: "/post/create",
            dataType: "json",
            data: {
                postSeq: postSeq,
                cmtContents: commentText,
                userId: userId
            },
            success: function(response) {
                if (response.success) {
                    var newComment = 
                    alert("댓글이 추가되었습니다.");
                    location.reload();
                } else {
                    alert(response.message);
                }
            }
        });
});

//이미지 클릭스 음악 상세 페이지 출력
$("#musicClick").on("click", function (e) {
	 let musicId = $('#musicId').val();
    console.log('musicId:' + musicId);
    // 팝업 창 열기
    let popupUrl = "/music/music_detail/?musicId=" + musicId;
    let popupName = "MusicDetailPopup";
    let popupOptions = "width=800,height=600,resizable=yes,scrollbars=yes";
    window.open(popupUrl, popupName, popupOptions);
    
});

$(document).on("click", ".delete-comment-button", function() {
	console.log('버튼클릭');
    var commentId = $(this).data("comment-id");

    $.ajax({
        type: "POST",
        url: "/post/deleteComment",
        data: {
            cmtSeq: commentId
        },
        success: function(response) {
            if (response.success) {
                // 삭제 성공 시에 필요한 로직을 추가하세요.
                alert("댓글이 삭제되었습니다.");
                location.reload(); // 댓글 삭제 후 페이지 리로드
            } else {
                alert("댓글 삭제에 실패했습니다.");
            }
        },
        error: function() {
            alert("댓글 삭제에 실패했습니다.");
        }
    });
});
    
    // 댓글 수정 버튼 클릭 시 수정 폼 보여주기
    $(document).on("click", ".edit-comment-button", function() {
        var commentId = $(this).data("comment-id");
        var commentText = $(this).closest(".comment").find(".comment-text").text(); // 기존 댓글 내용 가져오기
        var commentActions = $(this).closest(".comment").find(".comment-actions");
        var editedCommentForm = $(this).closest(".comment").find(".comment-edit-form");
        
        // 기존 내용 가져와서 셋팅
        editedCommentForm.find(".editedComment").val(commentText);
        editedCommentForm.find(".commentId").val(commentId);
        
        // 수정, 삭제 버튼 숨기고 폼 표시
        commentActions.find(".edit-comment-button, .delete-comment-button").hide();
        editedCommentForm.show();
        
        // 기존 댓글 내용 숨기기
        $(this).closest(".comment").find(".comment-text").hide();
    });

    // 수정 취소 버튼 클릭 시 이전 댓글 내용 표시
    $(document).on("click", ".cancelEdit", function() {
        var commentActions = $(this).closest(".comment").find(".comment-actions");
        var editedCommentForm = $(this).closest(".comment").find(".comment-edit-form");
        
        editedCommentForm.hide(); // 수정 폼 숨기기
        
        // 수정, 삭제 버튼 보이기
        commentActions.find(".edit-comment-button, .delete-comment-button").show();
        
        // 기존 댓글 내용 보이기
        $(this).closest(".comment").find(".comment-text").show();
    });

    // 수정 완료 버튼 클릭 시 수정 내용 서버로 전송
    $(document).on("click", ".submitEdit", function() {
        var editedComment = $(this).siblings(".editedComment").val();
        var commentId = $(this).siblings(".commentId").val();

        $.ajax({
            type: "POST",
            url: "/post/updateComment",
            data: {
                cmtSeq: commentId,
                cmtContents: editedComment
            },
            success: function(response) {
                if (response.success) {
                    var editedCommentText = response.editedComment.cmtContents;
                    var commentToUpdate = $(".edit-comment-button[data-comment-id='" + commentId + "']").siblings(".comment-text");
                    commentToUpdate.text(editedCommentText);
                    $(".comment-edit-form").hide();
                    location.reload();
                } else {
                    alert("댓글 수정에 실패했습니다.");
                }
            },
            error: function() {
                alert("공백은 안돼 ㅋㅋ");
            }
        });
    });

    // 댓글 추가 END

    
    
    // 수정으로 이동
    $("#doUpdate").on("click", function() {
    	if (confirm('수정화면으로 이동하시겠습니까?') == false) return;
    	window.location.href = "/post/post_mng?div="+$("#div").val()+"&seq="+$("#seq").val();
    });

    // 삭제
    $("#doDelete").on("click", function() {
      console.log("doDelete");
      console.log("seq:" + $("#seq").val());
      if (confirm('삭제 하시겠습니까') == false) return;

      $.ajax({
        type: "GET",
        url: "/post/delete",
        asyn: "true",
        dataType: "html",
        data: {
          postDiv: $("#div").val(),
          postSeq: $("#seq").val(),
          userId: $("#userId").val()
        },
        success: function(data) { // 통신 성공
          console.log("success data:" + data);
          // 성공, 실패
          // 성공->board_list.jsp로 이동
          let parsedJson = JSON.parse(data);
          if ("1" == parsedJson.msgId) {
            alert(parsedJson.msgContents);
            moveToListView();
          } else {
            alert(parsedJson.msgContents);
          }
        },
        error: function(data) { // 실패시 처리
          console.log("error:" + data);
        }
      });
    });

    function moveToListView() {
      window.location.href = "/post?div=" + $("#div").val();
    }
    $("#moveToList").on("click", function() {
      moveToListView();
    });

  });