/**
 * Created by liuyang on 2017/3/28.
 */

var numPerPage = 6;
var pageNum = 1;
var cp = getQueryString("p");

if (cp == null || cp.toString().length < 1) {
    cp = 0;
}

$(document).ready(function () {
    getAllPassedService(cp);
});

function getAllPassedService(cp) {
    $.ajax({
        url: "/controller/dailymes.con.php",
        data: {funName: "getPassedDailymes", cp: cp+1},
        type: "get",
        success: function (data) {
            var result = JSON.parse(data);
            var num = result.dailymesNum;

            if (num == 0) {
                $("#J_flashList").html("<p>暂时没有发布任何数据</p>")
            } else {
                var html = "";
				
                for (var item in result.dailymesInfo) {
                    html += "<div class='jin-flash_loading jin-flash_item'>" +
                        "<div class='jin-flash_h'>" +
                        "<div class='jin-flash_icon'>" +
                        "<a target='_blank' href='dailymesinfo.html?i=" + result.dailymesInfo[item + ""]['did'] + "'>" +
                        "<i class='jin-icon jin-icon_flashNews'></i>" +
                        "</a>" +
                        "</div>" +
                        "<div class='jin-flash_time'>"+result.dailymesInfo[item + ""]['create_at'] + "</div>" +
						"</div>" +
						"<div class='jin-flash_b'>" +
						"<h4 id='dailycontent' ";
						if(result.dailymesInfo[item]['is_red']==1){
							html += " style='color:red;' >";
						}else
							html +=">";
						if(result.dailymesInfo[item]['is_bord']==1){
							html +="<b>" +result.dailymesInfo[item + ""]['content'] + "</b></h4>" +
								"</div>"+
								"</div>";
						}else{
							html += result.dailymesInfo[item + ""]['content'] + "</h4>" +
							"</div>"+
							"</div>";
						}
                }
				html += "<div id='J_flashMore' class='jin-flash_more is-show'>" +
					"<a id='J_flashMoreBtn' class='jin-flash_more-btn' href='javascript:;' onclick='getAllPassedService(" +
					result.cp + ")'>" +
					"<i class='jin-icon jin-icon_expand'>点击加载更多</i>" +
					"</a>" +
					"</div>";
                $("#J_flashList").html(html).fadeIn(700);
            }
        }
    })
}

function submitApply() {
    //check apply form
    //if passed

    var serializedData = $("#service-apply-form").serialize();

    var name = $("#company-name");
    var url = $("#company-website");
    var contact = $("#contact-name");
    var phone = $("#contact-phone-number");
    var email = $("#contact-email");
    var description = $("#service-desc");

    if (name.val() == "") {
        $("#company-name-error").html("不能为空");
        return false;
    } else {
        $("#company-name-error").html("");
    }
    if (url.val() == "") {
        $("#company-website-error").html("不能为空");
        return false;
    } else {
        $("#company-website-error").html("");
    }
    if (contact.val() == "") {
        $("#contact-name-error").html("不能为空");
        return false;
    } else {
        $("#contact-name-error").html("");
    }
    if (phone.val() == "") {
        $("#contact-phone-number-error").html("不能为空");
        return false;
    } else {
        $("#contact-phone-number-error").html("请如实填写，否则我们将无法联系到您");
    }
    if (email.val() == "") {
        $("#contact-email-error").html("不能为空");
        return false;
    } else {
        $("#contact-email-error").html("请如实填写，否则我们将无法联系到您");
    }
    if (description.val() == "") {
        $("#service-desc-error").html("不能为空");
        return false;
    } else {
        $("#service-desc-error").html("");
    }

    $.ajax({
        url: "/controller/service.con.php",
        type: "get",
        data: serializedData + "&funName=addServiceApply",
        success: function (data) {
            var result = JSON.parse(data);

            $("#serviceApplyModal").modal('hide');
            if (result.status != CORRECT) {
                swal(errorCode2errorInfo(result.status));
            } else {
                swal("已提交申请，工作人员将会与您联系")
            }
        }
    })
}

function submitRequest() {
    var serializedData = $("#service-request-form").serialize();

    var name = $("#company-name-req");
    var scale = $("#scale");
    var industry = $("#industry");
    var city = $("#city");
    var serviceType = $("#service-type");
    var budget = $("#budget");

    if (name.val() == "") {
        $("#company-name-req-error").html("不能为空");
        return false;
    } else {
        $("#company-name-req-error").html("");
    }

    if (industry.val() == "") {
        $("#industry-error").html("不能为空");
        return false;
    } else {
        $("#industry-error").html("");
    }

    if (city.val() == "") {
        $("#city-error").html("不能为空");
        return false;
    } else {
        $("#city-error").html("");
    }

    if (serviceType.val() == "") {
        $("#service-type-error").html("不能为空");
        return false;
    } else {
        $("#service-type-error").html("");
    }

    if (budget.val() == "") {
        $("#budget-error").html("不能为空");
        return false;
    } else if (budget.val() < 0) {
        $("#budget-error").html("预算不能为负数")
        return false;
    } else {
        $("#budget-error").html("");
    }

    $.ajax({
        url: "/controller/service.con.php",
        type: "get",
        data: serializedData + "&funName=addServiceRequest",
        success: function (data) {
            var result = JSON.parse(data);

            $("#serviceRequestModal").modal('hide');
            if (result.status != CORRECT) {
                swal(errorCode2errorInfo(result.status));
            } else {
                swal("已提交需求")
            }
        }
    })
}

function goPage(page) {
    if (page != cp)
        location.href = "zhihui.html?p=" + page;
}

function prevPage() {
    var page = Math.max(cp - 1, 1);
    if (page != cp)
        location.href = "zhihui.html?p=" + page;
}

function nextPage() {
    var page = Math.min(pageNum, cp + 1);
    if (page != cp)
        location.href = "zhihui.html?p=" + page;
}