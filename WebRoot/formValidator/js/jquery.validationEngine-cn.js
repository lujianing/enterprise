
(function($) {
	$.fn.validationEngineLanguage = function() {
	};
	$.validationEngineLanguage = {
		newLang : function() {
			$.validationEngineLanguage.allRules = {
				"required" : { // Add your regex rules here, you can take
								// telephone as an example
					"regex" : "none",
					"alertText" : "* 非空选项.",
					"alertTextCheckboxMultiple" : "* 请选择一个单选框.",
					"alertTextCheckboxe" : "* 请选择一个复选框."
				},
				"length" : {
					"regex" : "none",
					"alertText" : "* 长度必须在 ",
					"alertText2" : " 至 ",
					"alertText3" : " 之间."
				},

				"confirm" : {
					"regex" : "none",
					"alertText" : "* 两次输入不一致,请重新输入."
				},

				"email" : {
					"regex" : "/^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/",
					"alertText" : "* 请输入有效的邮件地址."
				},

				"onlyNumber" : {
					"regex" : "/^[0-9]+$/",
					"alertText" : "* 请输入数字."
				},
				"onlyLetter" : {
					"regex" : "/^[a-zA-Z]+$/",
					"alertText" : "* 请输入英文字母."
				},
				"noSpecialCaracters" : {
					"regex" : "/^[0-9a-zA-Z]+$/",
					"alertText" : "* 请输入英文字母和数字."
				},
				"ajaxUser" : {
					"file" : "validate/validate",
					"alertTextOk" : "* 帐号可以使用.",
					"alertTextLoad" : "* 检查中, 请稍后...",
					"alertText" : "* 帐号不能使用."
				}
			}
		}
	}
})(jQuery);

$(document).ready(function() {
	$.validationEngineLanguage.newLang()
});