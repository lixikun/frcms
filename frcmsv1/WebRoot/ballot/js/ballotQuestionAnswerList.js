var importFlag = false;

$(function () {	
    $('#answerList').datagrid({
        url: '/Ballot/Ballot!queryBallotQuestionAnswer.do',
        queryParams:{
			"ballotId":CommonUtils.getUrlVal("ballotId"),
			"questionId":CommonUtils.getUrlVal("questionId")
		},
        loadFilter:function(data){			
			return CommonUtils.loadFilter(data);
		}
    })    
})