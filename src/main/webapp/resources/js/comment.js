// 댓글 수정 버튼 클릭
$(".commentAction.modify").on("click", function() {
    var commentItem = $(this).closest(".commentItem");
    var commentId = commentItem.data("comment-id");
    var commentContent = commentItem.find(".comments-comment p");
    var originalContent = commentContent.text();
    var commentInput = commentItem.find(".comments-comment input");

    // 댓글 내용을 수정 가능한 input으로 변경
    if (commentInput.length === 0) {
        commentInput = $("<input>")
            .attr("type", "text")
            .val(originalContent);
        commentContent.html(commentInput);
    } else {
        // 이미 input이 존재하는 경우, 해당 내용을 서버로 업데이트
        var newContent = commentInput.val();
        // 서버로 업데이트 요청을 보내는 로직을 구현 (AJAX 사용)
        $.ajax({
            type: "POST",
            url: "/comment/update", // 댓글 수정을 처리하는 서버 엔드포인트 URL로 변경
            data: {
                comment_id: commentId,
                comment_content: newContent
            },
            success: function(response) {
                // 서버로부터 업데이트된 댓글 내용을 받아와서 화면에 업데이트
                commentContent.text(newContent);
            },
            error: function(error) {
                // 업데이트 실패 시 필요한 작업을 수행
                commentContent.text(originalContent);
            }
        });
    }
});

// 댓글 삭제 버튼 클릭
$(".commentAction.delete").on("click", function() {
    var commentItem = $(this).closest(".commentItem");
    var commentId = commentItem.data("comment-id");

    // 삭제 확인 메시지 표시
    if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
        // 사용자가 확인을 클릭한 경우, 삭제 요청을 서버로 보냅니다.
        // 서버로 삭제 요청을 보내는 로직을 구현 (AJAX 사용)
        $.ajax({
            type: "POST",
            url: "/comment/remove", // 삭제를 처리하는 서버 엔드포인트 URL로 변경
            data: { comment_id: commentId },
            success: function(response) {
                // 삭제 성공 시 해당 댓글 아이템을 화면에서 제거
                commentItem.remove();
            },
            error: function(error) {
                // 삭제 실패 시 필요한 작업을 수행
            }
        });
    }
});
