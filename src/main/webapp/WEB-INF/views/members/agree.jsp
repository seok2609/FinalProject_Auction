<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#agreeBtn{
		background: var(--color-primary);
		border: 0;
		padding: 14px 45px;
		color: #fff;
		transition: 0.4s;
		border-radius: 50px;
	}
	.check{
		 cursor: pointer;
	}
</style>
<script defer src="/js/agree.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script defer src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<!-- ===========header=============== -->
<c:import url="../common/header.jsp"></c:import>
<!-- ================================ -->
	  <section id="faq" class="faq">
	  
	  
      <div class="container" data-aos="fade-up">
		<h1 style="color: #008374;">약관동의 페이지</h1>

        <div class="row gy-4">

          <!-- <div class="col-lg-4">
            <div class="content px-xl-5">
              <h3>Frequently Asked <strong>Questions</strong></h3>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit
              </p>
            </div>
          </div> -->

          <div class="col-lg-8">

            <div class="accordion accordion-flush" id="faqlist" data-aos="fade-up" data-aos-delay="100">

              <div class="accordion-item">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                    <span class="num">1.</span>
                    전자금융거래 이용약관
                  </button>
                </h3>
                <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
                    제1장 총칙

					제1조 (목적)
					이 약관은 십일번가 주식회사(이하 ‘회사’)가 제공하는 회원제 서비스인 SK pay 전자금융거래 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
					
					제2조 (정의)
					① 이 약관에서 사용하는 용어의 정의는 다음 각호와 같습니다.
					1. ‘SK pay 전자금융거래 서비스(이하 ‘서비스’)’라 함은 회원이 가맹점과 재화 또는 용역(이하 ‘재화 등’이라 합니다)을 거래함에 있어 회사가 제공하는 전자지급결제대행 서비스, 결제대금예치서비스, 선불전자지급수단의 발행 및 관리 서비스를 의미하며, 구체적인 내용은 본 약관 각 조에 따릅니다.
					2. ‘회원’이라 함은 이 약관에 따라 회사와 이용계약을 체결하고 회사로부터 서비스 이용자격을 부여 받은 자를 의미합니다.
					3. ‘아이디(ID)’라 함은 회원의 식별과 서비스 이용을 위해 회원임을 인증하기 위하여 회원 자신이 정하고 회사가 승인한 문자/숫자의 조합을 의미합니다.
					4. ‘비밀번호’라 함은 회원의 동일성 식별과 회원 정보의 보호 및 거래내용의 진실성과 정확성을 확보하기 위해 회원 자신이 정한 문자/숫자의 조합을 의미합니다.
					5. ‘결제비밀번호’란 서비스의 부정 사용을 방지하기 위해 회원이 서비스 가입 시에 직접 설정하는 인증 암호를 말하며, 회원이 생체정보인식이 가능한 모바일 기기를 통하여 서비스 이용 시 회원의 생체정보를 등록하여 결제비밀번호를 대체할 수 있습니다.
					6. ‘가맹점’이라 함은 회사와 계약을 체결하고 회원이 서비스를 통하여 재화 등을 판매 또는 제공하거나 서비스를 이용할 수 있는 회사와 약정된 자를 말합니다.
					7. ‘전자지급수단’이라 함은 전자자금이체, 직불전자지급수단, 선불전자지급수단, 전자화폐, 신용카드, 전자채권 그 밖에 전자적 방법에 따른 지급수단을 말합니다.
					8. ‘전자금융거래’라 함은 회사가 전자적 장치를 통하여 전자금융업무를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
					9. ‘전자적 장치’라 함은 전자금융거래정보를 전자적 방법으로 전송하거나 처리하는데 이용되는 장치로서 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를 전송하거나 처리하는 장치를 말합니다.
					10. ‘접근매체’라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), 「전자서명법」 상의 인증서, 금융회사 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보 및 이와 같은 수단이나 정보를 사용하는데 필요한 비밀번호 등 「전자금융거래법」 제2조 제10호에서 정하고 있는 것을 말합니다.
					11. ‘거래지시’라 함은 회원이 본 약관에 따라 회사에게 서비스를 통한 전자금융거래의 처리를 지시하는 것을 말합니다.
					12. ‘오류’라 함은 회원의 고의 또는 과실 없이 전자금융거래가 본 약관 또는 회원의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
					② 본 조 및 본 약관의 다른 조항에서 정의되지 않은 용어의 해석은 「전자금융거래법」 등 관련 법령에 정한 바에 따릅니다.
					
					제3조 (약관 외 준칙)
					① 회사와 회원 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.
					② 본 약관에 명시되지 않은 사항에 대해서는 「전자금융거래법」, 「전기통신사업법」 등 관계법령 및 회사가 정한 본 서비스의 세부이용지침 등의 규정이 적용됩니다.
					③ 본 약관과 관련하여 회사의 정책 변경, 법령의 제·개정, 정부 정책의 변경 등에 의하여 공지사항 등을 통해 공지하는 내용도 이용계약의 일부를 구성하며, 회원은 항상 개별약관이나 이용정책 등의 내용에 변경이 있는지 여부를 주시하여야 하고, 변경사항의 공지가 있을 때에는 이를 확인하여야 합니다.
					
					제4조 (약관의 게시와 변경)
					① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스의 화면 또는 연결 페이지 등으로 게시합니다.
					② 회사는 「전자금융거래법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」 등 관련법령을 위배하지 않는 범위에서 이 약관을 변경할 수 있습니다.
					③ 회사가 약관을 변경할 경우에는 적용일자 및 변경 내용을 명시하여 그 시행일 1개월 전부터 본 조 제1항에 기재한 방법으로 공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경한 때에는 변경된 약관을 서비스 홈페이지에 1개월 이상 게시하고 회원에게 전자우편 등을 통하여 사후 통지합니다.
					④ 회사가 전 항에 따라 변경약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 변경약관에 동의한 것으로 봅니다.
					⑤ 회원이 변경약관의 적용에 동의하지 않는 경우 이 경우 회원은 이용계약을 해지할 수 있습니다.
					
					제5조 (거래내용의 확인)
					① 회사는 서비스 페이지 등의 조회 화면을 통하여 회원의 전자금융거래기록(회원의 ‘오류정정요구사실 및 처리결과에 관한 사항’을 포함합니다)을 확인할 수 있도록 하며, 회원의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송, 우편 또는 직접 교부의 방법으로 전자금융거래기록에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영장애, 그 밖의 사유로 전자금융거래기록을 제공할 수 없는 때에는 즉시 회원에게 전자문서 전송의 방법으로 그러한 사유를 알려야 하며, 전자금융거래기록을 제공할 수 없는 기간은 서면교부 기간에 산입하지 아니합니다.
					② 제1항의 전자금융거래기록 중 보존기간이 5년인 것은 다음 각 호와 같습니다.
					1. 전자금융거래의 종류, 금액, 거래 상대방 관련 정보
					2. 전자금융거래일시, 전자적 장치의 종류 및 이를 식별할 수 있는 정보
					3. 전자금융거래 계좌의 명칭 또는 번호
					4. 전자금융거래의 대가로 받은 수수료
					5. 「전자금융거래법」 제15조 제1항에 따른 지급인의 출금 동의에 관한 사항
					6. 전자금융거래와 관련한 전자적 장치의 접속기록
					7. 전자금융거래의 신청 및 조건의 변경에 관한 사항
					8. 건 당 거래금액이 1만원 초과하는 전자금융거래에 관한 기록
					③ 제1항의 전자금융거래기록 중 보존기간이 1년인 것은 다음 각 호와 같습니다.
					1. 건 당 거래금액이 1만원 이하인 전자금융거래에 관한 기록
					2. 전자지급수단의 이용과 관련된 거래승인에 관한 기록
					3. 회원의 오류정정 요구사실 및 처리결과에 관한 사항
					④ 회원이 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
					1. 주소: 서울특별시 중구 한강대로 416(남대문로5가)
					2. 이메일 주소: SKpay@11st.co.kr
					3. 전화번호: 1800-3388
					
					제6조 (오류의 정정 등)
					① 회원은 전자금융거래서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
					② 회사는 제1항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날부터 2주 이내에 그 결과를 문서, 전화 또는 전자우편으로 회원에게 알려 드립니다. 단, 회원이 문서로 알려줄 것을 요청하는 경우에는 문서로 알려 드립니다. 
					
					제7조 (전자금융거래기록의 생성 및 보존)
					① 회사는 회원이 이용한 전자금융거래의 내용을 추적·검색하거나 그 내용에 오류가 발생했을 때 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
					② 제1항의 규정에 따라 회사가 보존해야 하는 기록의 종류와 보존방법은 제5조 제2항 및 제3항에서 정한 바에 따릅니다.
					
					제8조 (거래지시의 철회 등)
					① 회원이 전자지급결제대행서비스를 이용한 경우, 회원은 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융회사 또는 전자금융업자의 전자적 장치에 입력이 끝날 때까지 거래지시를 철회할 수 있습니다.
					② 회원은 전자지급의 효력이 발생한 경우에는 「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령상 청약철회의 방법에 따라 결제대금을 반환 받을 수 있습니다.
					
					제9조 (전자금융거래정보의 제공금지)
					회사는 전자금융거래서비스를 제공하기 위해 취득한 회원의 인적 사항, 회원의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 법령에 의하거나 회원의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 
					
					제10조 (회사의 책임)
					① 회사는 관련법령과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다해 노력합니다.
					② 회사는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보보호를 위한 보안시스템을 갖추며, 개인정보처리방침을 공지하고 이를 준수합니다.
					③ 회사는 다음 각 호의 어느 하나에 해당하는 사고로 인하여 회원에게 손해가 발생한 경우 그 손해를 배상할 책임을 집니다.
					1. 접근매체의 위조나 변조로 발생한 사고
					2. 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고
					3. 전자금융거래를 위한 전자적 장치 또는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 제2조 제1항 제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고
					④ 회사는 제1항에도 불구하고 다음 각 호의 어느 하나에 해당하는 경우에는 그 책임의 전부 또는 일부를 회원이 부담하게 할 수 있습니다.
					1. 회원이 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공하거나, 제3자가 권한 없이 회원의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 쉽게 알 수 있었음에도 불구하고 회원이 자신의 접근매체를 누설 또는 노출하거나 방치한 경우, 기타 접근매체의 이용으로 발생한 사고 발생에 있어서 전자금융거래법 제9조 제2항 제1호 및 동법 시행령 제8조 각 호에 해당하는 이용자의 고의나 중대한 과실이 있는 경우
					2. 법인(「중소기업기본법」 제2조 제2항에 의한 소기업을 제외)인 회원에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의 의무를 다한 경우
					⑤ 회사는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며, 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
					
					제11조 (회원의 의무)
					① 회원은 안전한 서비스 이용을 위해 관련법령 및 이 약관, 회사가 서비스 페이지에서 고지하는 내용을 준수하여야 하고, 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 안 되며, 회사는 회원이 이를 위반하는 행위를 할 경우 서비스 이용을 제한할 수 있습니다.
					1. 회사가 제공하는 서비스 이용방법에 의하지 아니하고 비정상적인 방법으로 서비스를 이용하거나 시스템에 접근하는 행위
					2. 타인의 명의, 신용카드정보, 계좌정보 등을 도용하여 회사가 제공하는 서비스를 이용하는 행위
					3. 재화 등의 판매 또는 제공을 가장하여 자금을 융통하는 것과 같이 「여신전문금융업법」 등 관련법령에 의하여 금지된 방법으로 비정상적인 결제를 하는 행위
					4. 회사가 정하지 않은 비정상적인 방법으로 가맹점의 Point 등을 취득하거나 사용하는 행위
					5. 회사가 게시한 정보의 무단 변경 또는 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시하는 행위
					6. 회사 및 기타 제3자의 저작권 등 지적재산권 및 기타 권리에 대한 침해행위
					7. 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
					8. 외설 또는 폭력적인 메시지, 화상, 음성 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위
					9. 구매의사 없는 반복적인 구매행위
					② 회사가 회원의 이용을 제한할 경우 회원에게 전자우편 등의 방법으로 이를 통지하고, 상당기간을 정하여 이의신청 및 소명할 기회를 부여합니다. 이때 회원의 이의가 정당하다고 회사가 인정하는 경우 회사는 즉시 서비스의 이용을 재개합니다.
					③ 회사는 제1항 제1호 내지 제4호의 사유로 인하여 이용을 제한할 때에는 회원의 이용계약의 해지를 제한할 수 있으며, 가맹점의 경우 결제대금의 정산을 보류할 수 있습니다.
					
					제12조 (손해배상)
					① 회사가 제공하는 서비스와 관련하여 회사의 귀책사유인 경우를 제외하고 회사는 서비스 및 그 이용으로 발생할 수 있는 회원의 어떠한 피해에 대하여 그 책임을 부담하지 않습니다.
					② 회원이 이 약관의 규정을 위반함으로 인하여 회사의 영업활동에 손해가 발생하게 되는 경우 해당 회원은 회사에 그 손해를 배상해야 할 책임이 있습니다.
					
					제13조 (분쟁처리 및 분쟁조정)
					① 회원은 회사의 서비스 홈페이지에 게시된 분쟁처리 담당자에 대하여 전자금융거래와 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
					② 회원이 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 회원에게 안내합니다.
					③ 회원은 회사의 분쟁처리 결과에 대하여 이의가 있을 경우 금융감독원의 금융분쟁조정위원회나 한국소비자원의 소비자분쟁조정위원회에 회사의 전자금융거래서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다. 
					
					제14조 (관할)
					① 서비스 이용과 관련하여 회사와 회원 사이에 분쟁이 발생한 경우, 회사와 회원은 분쟁의 해결을 위해 성실히 협의합니다.
					② 회사와 회원 간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다. 
					
					제2장 전자지급결제대행 서비스
					
					제15조 (전자지급결제대행서비스의 제공)
					① 회사는 전자적 방법으로 재화 등을 구매하는 것과 관련하여 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 전자지급결제대행서비스를 제공합니다.
					② 회사는 제1항의 방법으로 전자지급결제대행 서비스를 제공할 수 있고, 아래와 같은 형태로 구현하여 제공할 수 있습니다.
					1. 회원이 결제정보를 미리 등록한 후 가맹점과의 재화 등 거래 시 결제정보를 매번 입력하지 아니하고 미리 등록한 결제정보를 이용하여 아이디와 비밀번호 등으로 간편하게 결제할 수 있는 간편결제서비스를 말합니다.
					2. 회원이 서비스를 통하여 가맹점이 판매하는 재화 등을 매월 또는 일정 시기에 구매하기 위하여 미리 입력하여 등록한 결제정보로 사전 인증을 마친 후 회원이 매월 또는 일정시기에 거래지시한 시점마다 결제비밀번호의 입력 없이 자동으로 결제하는 자동결제서비스를 말합니다.
					
					제16조 (접근매체의 관리)
					① 회사는 전자금융거래서비스를 제공할 때 접근매체를 선정하여 회원의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
					② 회원은 접근매체를 제3자에게 대여하거나 그 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
					③ 회원은 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
					④ 회원은 접근매체를 회원 스스로의 책임 하에 관리하여야 하며 접근매체의 훼손, 분실, 도난, 유출되는 등의 사고가 발생하는 경우 회원은 즉시 그 사실을 회사에 통지하여야 합니다.
					⑤ 회사는 회원으로부터 본 조 제4항에 따른 통지를 받은 때에는 그 때부터 제3자가 그 접근매체 또는 접근매체가 저장된 모바일 기기를 사용함으로 인하여 회원에게 발생한 손해를 배상할 책임이 있습니다.
					
					제17조 (한도 등)
					① 회사의 정책 및 전자지급수단의 발행업체(카드회사 등)의 기준에 따라 이용자의 전자지급수단별 월 누적 결제액 및 결제한도가 제한될 수 있습니다.
					② 자동결제서비스는 가맹점 중 회원에게 해당 서비스를 제공하기로 한 가맹점에 한하여 제공됩니다.
					
					제3장 결제대금예치서비스
					
					제18조 (결제대금예치서비스의 제공)
					① 회사는 선지급식 통신판매에서 회사가 회원이 지급하는 결제대금을 예치하고 배송이 완료된 후 재화 등의 대금을 가맹점에게 지급하는 ‘결제대금예치서비스’를 제공합니다.
					② ‘선지급식 통신판매’는 소비자가 재화 등을 공급받기 전에 미리 대금의 전부 또는 일부를 지급하는 방식의 통신판매를 말합니다.
					③ 회원은 재화 등 수령일로부터 7일(7일 중 영업일 3일 미만인 경우 3영업일)이 되는 날 또는 그에 부합하는 조치가 된 것으로 볼 수 있는 날로 회사가 공지를 통해 정한 날(구매확정기간)까지 재화 등 거래에 대하여 구매종료의 의사표시(구매확정, 반품 및 교환 등)를 하여야 하며, 구매확정기간 내에 구매종료의 의사표시가 없는 경우 구매를 확정한 것으로 간주하여 회사는 가맹점에게 결제대금을 정산해 줍니다.
					
					제19조 (적용범위)
					본 장은 가맹점 중 회원에게 해당 서비스를 제공하기로 한 가맹점에 한하여 제공되며, 선지급식 통신판매를 이용하는 경우에 적용됩니다.
					
					제20조 (예치된 결제대금의 지급 방법)
					① 회사는 서비스에서 제공하는 전자상거래 서비스의 신뢰성을 제고하고 안전한 거래가 이루어질 수 있도록 결제대금예치서비스를 제공합니다.
					② 결제대금예치서비스를 이용하는 회원은 재화 등을 공급받으면 구매확정기간 이내에 재화 등을 공급받은 사실을 회사에 통보해야 합니다.
					③ 회사는 회원으로부터 재화 등을 공급받은 사실을 통보 받으면 회사가 정한 기간 내에 가맹점에게 결제대금을 지급합니다.
					④ 회원이 구매확정기간 내에 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 않으면 회사는 회원이 재화 등을 공급받았다고 간주하여 가맹점에게 결제대금을 지급할 수 있습니다. 
					⑤ 회사가 가맹점에게 결제대금을 지급하기 전에 회원이 그 결제대금을 환급 받을 사유가 발생할 때에는 그 결제대금을 회원에게 환급합니다.
					⑥ 회사는 회원의 구매확정의 의사가 있거나 구매확정의 의사가 있다고 간주되는 경우 결제대금을 가맹점에 지급할 수 있으며, 구매확정 이후에는 회원과 가맹점이 직접 청약철회, 취소, 해제 및 결제대금의 환불 등에 관한 절차를 진행하여야 합니다.
					⑦ 회사는 결제대금예치서비스를 이용하지 아니하고 전자지급결제대행서비스를 이용한 결제에 대해서는 가맹점과의 계약에 따라 대금을 정산합니다.
					
					제21조 (준용규정)
					제16조(접근매체의 관리)는 본 장에 준용합니다.
					
					제4장 선불전자지급수단의 발행 및 관리 서비스
					
					제22조 (선불전자지급수단의 발행 및 관리)
					① ‘선불전자지급수단’이란 재화 등을 구매하고 그 대가를 지급하는데 사용하기 위하여 회사가 미리 회원에게 공지하고 발행한 결제수단으로, 「전자금융거래법」에서 규정하고 있는 것을 말합니다.
					② 회사는 제1항의 선불전자지급수단으로 ‘SK pay point’ 및 'SK pay money'를 발행 및 관리하며, 회원의 대가 지급 유무에 따라 충전식 선불전자지급수단과 적립식 선불전자지급수단으로 구분됩니다.
					③ ‘충전식 선불전자지급수단’은 회원이 미리 대가를 지급하고 유상으로 구매하는 선불전자지급수단을 말하며, ‘적립식 선불전자지급수단’은 회원이 가맹점의 재화 등을 구매할 경우 SK pay를 이용할 때 결제대금의 일정 비율을 적립하거나 이벤트 등을 통해 적립하는 선불전자지급수단을 말합니다.
					
					제23조 (준용규정)
					제16조(접근매체의 관리)는 본 장에 준용합니다.
					
					제24조 (환급 등)
					① 회원이 보유 중인 충전식 선불전자지급수단은 다음 각 호의 어느 하나에 해당하는 경우 그 잔액의 환급을 회사에 요구할 수 있습니다. 다만, 적립식 선불전자지급수단은 회사가 무상으로 제공하는 것으로 환급 대상에서 제외됩니다.
					1. 천재지변 등의 사유로 가맹점이 재화 등을 제공하기 곤란하여 선불전자지급수단을 사용하지 못하게 된 경우
					2. 선불전자지급수단의 결함으로 가맹점이 재화 등을 제공하지 못하는 경우
					3. 선불전자지급수단에 기록된 잔액이 100분의 40 이하(1만원 이하는 100분의 20 이하)인 경우
					② 회원이 재화 등의 구매나 이벤트 등을 통하여 회사로부터 무상 제공받은 적립식 선불전자지급수단은 회사에서 정한 기한 및 이용방법에 한해서만 이용 가능하며, 기한 및 이용방법은 적립식 선불전자지급수단 발행시의 공지내용 및 서비스 페이지에서 확인할 수 있습니다.
					
					제25조 (이용제한 및 한도)
					① 선불전자지급수단은 순금, 상품권 등 불법적인 현금화 우려가 있는 일부 상품의 경우 이용이 제한될 수 있으며, 제24조 제2항에서 규정한 이용방법에 의하여 이용이 제한될 수 있습니다.
					② 회사는 선불전자지급수단에 대해 전자금융거래법 및 회사 정책에 따라 보유 한도를 제한할 수 있습니다.
					
					제26조 (유효기간)
					① 회사는 회원에 대하여 선불전자지급수단에 대한 유효기간을 설정할 수 있으며, 회원은 회사가 정한 유효기간 내에서만 선불전자지급수단을 사용할 수 있습니다.
					② 회사는 서비스 페이지 등을 통하여 전 항의 유효기간 설정 여부 및 그 기간을 공지합니다. 단, 회사가 유효기간을 달리 정하지 않은 경우에는 본조 제5항의 소멸시효기간을 유효기간으로 봅니다.
					③ 회사가 유효기간을 소멸시효기간보다 짧게 정한 경우, 회원은 회사에게 유효기간 내에서 유효기간의 연장을 요청할 수 있고, 요청을 받은 회사는 특별한 사유가 없는 한 소멸시효 기간 내에서 유효기간을 3개월 단위로 연장합니다. 다만 무상으로 지급된 경우는 그러하지 아니합니다.
					④ 회사는 유효기간이 도래하기 7일전 통지를 포함하여 3회 이상 회원에게 유효기간의 도래, 유효기간의 연장 가능여부와 방법 등을 이메일 또는 문자메세지 등의 방법으로 통지합니다. 다만 무상으로 지급된 경우는 그러하지 아니합니다.
					⑤ 회사가 발행한 선불전자지급수단은 충전일로부터 5년간 사용하지 않으면 소멸합니다.
 
                  </div>
                </div>
              </div><!-- # Faq item-->
              
              <!-- 첫번째 약관동의 체크박스 -->
              <div>
              	전자금융거래 이용약관에 동의합니다.
              	<input type="checkbox" class="check">
              </div>

              <div class="accordion-item">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-2">
                    <span class="num">2.</span>
                    개인정보 수집 및 이용에 대한 안내
                  </button>
                </h3>
                <div id="faq-content-2" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
					                   
					서비스 이용을 위해 아래와 같이 개인정보를 수집·이용합니다.
					고객님께서는 동의를 거부할 권리가 있으며, 동의 거부 시 11번가 서비스 이용이 불가합니다.
					
					가. 개인회원
					
					개인정보 수집 및 이용 목적	수집하는 개인정보 항목	개인정보의 보유 및 이용기간
					이용자식별, 계약이행을 위한 연락, 서비스 이용에 따른 정보제공(고지사항 전달, 본인의사 확인, 서비스 관련 상담, 민원사항 처리, 카카오톡을 이용한 알림 정보 전송, 유의사항 등), 서비스이용 만족도 조사	아이디(ID), 비밀번호, 이름, 이동전화번호, 이메일, 상담내용	고객님의 개인정보는 서비스를 제공하는 기간 동안 보유 및 이용하며, 수집 및 이용목적이 달성되면 지체없이 파기합니다.
					단, 관계 법령에 따라 고객님의 개인정보를 보관하여야 하는 경우 회사는 해당 법령에서 정한 기간 동안 보관합니다. 또한 회사방침*에 의해 고객님의 개인정보를 보관하여야 하는 경우 회사는 고객님께 안내한 기간 동안 보관합니다.
					* 회사방침에 따라 보관하는 경우
					- 개별적으로 고객님의 동의를 받은 경우에는 고지한 기간 동안 보관
					- 반복적인 회원탈퇴 및 재가입 방지를 위해 탈퇴 후 2개월간 개인정보 보관
					- 서비스 제공과 관련된 문의사항 응대를 위해 서비스 사용로그는 회원탈퇴 후 1개월간 보관하며, 위치정보 이용 및 제공사실 확인자료는 6개월간 보관합니다.
					11번가㈜의 상품/서비스의 이용 실적 정보 통계/분석 및 상품/서비스 추천	필수, 선택항목에서 수집한 모든 정보 항목
					불법/부정이용 방지, 개인정보 유효기간제 준수, 장바구니, 최근 본 상품 등 서비스	자동수집정보 : 서비스이용기록, 이용정지기록, 이용해지기록, IP주소, 접속로그, 쿠키
					부정거래 방지	이름, 아이디(ID), 이메일, 주소, 이동전화번호, 서비스이용기록, IP주소, 접속로그
					서비스이용을 위한 이용자식별, 중복가입방지, 회원연령확인, 성인콘텐츠 이용 시 성인인증, 대금추심, 그 외 거래안전을 위해 본인인증 후 구매하거나 이용할 수 있는 서비스	성명, 생년월일, 성별, 휴대전화번호(휴대폰인증시), CI(연계정보), DI(중복가입확인정보)*, IP주소
					* 11번가 TEXT-ID로 본인확인 한 고객만 해당
					상품과 경품 배송 시 배송지 주소 및 연락처 확인	이름, 주소, 연락처
					출고지/반품/교환지 주소 관리	이름, 주소, 연락처
					특정금융거래정보의 고객확인 의무 이행
					(개인셀러)	■ 기본정보 : 성명, 생년월일, 성별, 국적, 연계정보(CI), 직업, 휴대전화, 이메일, 사업장주소(국가, 사업장주소)
					■ 실소유자 확인 정보 : 실소유자 여부	특정금융거래정보의 보고 및 이용 등에 관한 법률에 의한 5년 보관(회원 유지기간 동안 5년마다 정보 갱신)
					나. 사업자회원
					
					개인정보 수집 및 이용 목적	수집하는 개인정보 항목	개인정보의 보유 및 이용기간
					이용자식별, 계약이행을 위한 연락, 서비스 이용에 따른 정보제공(고지사항 전달, 본인의사 확인, 서비스 관련 상담, 민원사항 처리, 유의사항 등), 서비스이용 만족도 조사	아이디(ID), 비밀번호, 대표자명, 담당자명, 사업자등록번호, 사업자 및 담당자 연락처, 이메일주소, 상담내용	고객님의 개인정보는 서비스를 제공하는 기간 동안 보유 및 이용하며, 수집 및 이용목적이 달성되면 지체없이 파기합니다.
					단, 관계 법령에 따라 고객님의 개인정보를 보관하여야 하는 경우 회사는 해당 법령에서 정한 기간 동안 보관합니다. 또한 회사방침*에 의해 고객님의 개인정보를 보관하여야 하는 경우 회사는 고객님께 안내한 기간 동안 보관합니다.
					* 회사방침에 따라 보관하는 경우
					- 개별적으로 고객님의 동의를 받은 경우에는 고지한 기간 동안 보관
					- 반복적인 회원탈퇴 및 재가입 방지를 위해 탈퇴 후 2개월간 개인정보 보관
					- 서비스 제공과 관련된 문의사항 응대를 위해 서비스 사용로그는 회원탈퇴 후 1개월간 보관하며, 위치정보 이용 및 제공사실 확인자료는 6개월간 보관합니다.
					11번가(주)의 상품/서비스의 이용 실적 정보 통계/분석 및 상품/서비스 추천	필수,선택항목에서 수집한 모든 정보 항목
					불법/부정이용 방지, 장바구니, 최근 본 상품 등 서비스	자동수집정보 : 서비스이용기록, 이용정지기록, 이용해지기록, IP주소, 접속로그, 쿠키
					부정거래 방지	성명, 아이디(ID), 이메일주소, 주소, 휴대전화번호, 서비스이용기록, IP주소, 접속로그
					부가가치세법에 따른 세금계산서 발행, 중복가입방지	대표자명, 담당자명, 사업자등록번호, 사업자 및 담당자 연락처, 법인등록번호, CI(연계정보), DI(중복정보)*
					* 11번가 TEXT-ID로 본인확인 한 고객만 해당
					대금결제서비스의 제공	은행계좌정보(예금주, 계좌번호)
					상품과 경품 배송 시 배송지 주소 및 연락처 확인	이름, 주소, 연락처
					정산대금, 반품/교환 배송비 수령을 위한 계좌정보 관리	은행계좌정보(예금주, 계좌번호)
					정산대금, 반품/교환 배송비 수령을 위한 계좌정보 관리	은행계좌정보(예금주, 계좌번호)
					특정금융거래정보의 고객확인 의무 이행(사업자셀러)	가.개인/간이사업자
					■ 기본정보
					대표자의 성명, 생년월일, 성별, 국적, 연계정보(CI)
					■ 실소유자 확인 정보 : 실소유자 여부
					
					나.법인사업자/비영리단체
					■ 기본정보
					- 대표자의 성명, 생년월일, 국적
					- 담당자의 성명, 생년월일, 성별, 국적, 연계정보(CI), 휴대폰번호, 직업, 거주지 주소/국가
					■ 실소유자 확인 정보 : 실소유자의 성명, 생년월일, 국적	특정금융거래정보의 보고 및 이용 등에 관한 법률에 의한 5년 보관(회원 유지기간 동안 5년마다 정보 갱신)
					11번가 서비스 이용을 위해 동의 받은 개인정보 수집·이용약관을 제외한 나머지 개인정보 처리 관련 사항에 대해서는 11번가 회원과 동일한 개인정보처리방침이 적용됩니다.
					
                  </div>
                </div>
              </div><!-- # Faq item-->
              
              <!-- 두번째 약관동의 체크박스 -->
              <div>
              	개인정보 수집 및 이용에 대한 안내에 동의합니다.
              	<input type="checkbox" class="check">
              </div>

              <div class="accordion-item">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
                    <span class="num">3.</span>
                    판매이용약관
                  </button>
                </h3>
                <div id="faq-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
                    판매이용약관 (2022. 9. 1 시행)

 
					제1조 (목적)
					본 약관은 십일번가 주식회사(이하 “회사”)와 회사가 운영하는 웹사이트(http://www.11st.co.kr, 이하 “사이트”. 또한 이하 “회사”에 “사이트”를 포함하여 통칭함)에 판매회원(본 약관에서 ‘판매회원’은 11번가 구매이용약관의 ‘셀러회원’과 같음)으로 가입하여 사이트에서 판매회원에게 제공하는 전자상거래 관련 서비스와 기타 서비스(이하 “서비스”)를 이용하는 자 간의 권리, 의무를 확정하고 이를 이행하여 상호 발전을 도모하는 것을 목적으로 합니다.
					
					
					 
					제2조 (용어의 정의)
					본 약관에서 사용되는 용어의 정의는 본 약관에서 별도로 규정하는 경우를 제외하고 11번가 구매이용약관 제2조를 따릅니다.
					
					
					 
					제3조 (효력)
					① 회사는 본 약관에서 규정되지 않은 세부적인 내용을 판매서비스이용정책(이하 "이용정책")에 규정할 수 있으며, 이를 ‘판매회원 거래관리툴(Seller Tool, 이하 “판매회원툴”)’을 통하여 공지하며, 이용정책은 이 약관과 더불어 판매서비스 이용계약(이하 “이용계약”)의 일부를 구성합니다.
					② 회사는 관련 법령의 규정 등에 따라 판매서비스 중 특정 서비스에 관한 약관(이하 "개별약관")을 별도로 제정할 수 있으며, 판매회원이 개별약관에 동의하면 개별약관은 이용계약의 일부를 구성하고, 개별약관에 이 약관과 상충하는 내용이 있으면 개별약관이 우선하여 적용됩니다.
					③ 11번가 구매이용약관의 내용 중 성질상 판매 서비스에 적용될 수 있는 내용은 제2항과 동일하게 적용됩니다. 본 약관에 따라 판매회원으로 가입하고자 하는 자는 구매이용약관의 내용을 숙지하고 본 항의 내용에 동의하는 것임을 확인합니다.
					④ 이 약관, 이용정책, 개별약관의 변경이 있으면 회사는 변경 내용의 효력발생일 7일 이전에 해당 변경 사항을 판매회원툴에 공지하며, 공지를 하면서 공지일로부터 변경 시행일까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 판매회원의 의사표시가 없는 경우에는 변경된 사항을 승인한 것으로 봅니다. 다만, 판매회원에게 불리한 내용으로 변경할 때에는 30일 이전에 판매회원툴에 공지하며, 판매회원에게 개별 통지합니다.
					⑤ 변경된 약관은 그 적용일자 이전으로 소급하여 적용되지 않습니다.
					⑥ 서비스 이용 기준일 현재 구매이용약관상의 만 19세 미만의 회원이 본 판매이용약관상의 판매회원 중 개인 판매회원으로 전환하려고 하거나 전환 없이 직접 개인 판매회원으로 상품이나 용역을 판매하고자 한다면 회사는 해당 회원에게 법정대리인의 동의서와 입증 자료의 제출을 요구할 수 있으며, 해당 회원은 이에 동의해야 합니다. 해당 회원이 본 규정을 지키지 않으면 해당 회원은 상품이나 용역을 판매할 수 없습니다.
					⑦ 구매이용약관상의 회원이 개인 판매회원으로 전환하고자 하거나 전환 없이 직접 개인 판매회원으로 상품 또는 용역을 판매하고자 한다면 회사는 해당 회원에게 신원확인 목적 등을 위하여 회사가 인정하는 신원확인(본인인증) 절차의 완료, 기타 필요한 자료의 제출을 요구할 수 있으며, 해당 회원은 회사가 요구하는 기한 내에 관련 절차의 완료 및 요구 자료를 제출해야 합니다. 해당 회원이 본 규정을 지키지 않으면 회사는 해당 회원에 대하여 사이트 로그인, 상품 및 용역의 등록 또는 판매 등 회사가 제공하는 서비스의 이용을 제한할 수 있습니다.
					
					
					 
					제4조 (서비스이용료)
					① 서비스이용료는 회사가 제공하는 서비스를 이용하는 데 따른 대가로 판매회원이 회사에 지급해야 하는 금액을 의미하며, 회사는 판매대금 또는 구매회원으로부터 예치 받은 금액에서 서비스이용료를 공제하는 등으로 판매회원에게 정산합니다.
					② 서비스이용료는 판매가(판매회원이 정한 최초의 상품가격을 말합니다)와 기타 고객이 상품 구매에 부가하여 결제한 금액(예컨대, 배송비, 포장 박스 등)에 각 항목별로 회사가 정한 비율(이하 “서비스이용료율”)을 곱한 금액과 각종 판매촉진서비스(회사가 진행하는 광고 및 프로모션, 검색 등) 이용료를 포함합니다.
					③ 회사는 서비스이용료와 서비스이용료율에 대한 자세한 내용은 판매회원툴에 공지하며, 그 변경절차에 관한 사항은 제3조 제4항에 따릅니다.
					④ 회사는 제1항의 서비스이용료에 대하여 매월 초 판매회원툴을 통해 판매회원에게 세금계산서를 발행하며, 판매회원은 서비스이용료 및 서비스이용료율, 판매촉진서비스의 내용, 이용방법 등 관련 정책을 판매회원툴을 통해 확인할 수 있습니다.
					
					
					 
					제5조 (판매회원의 책임 및 관리의무)
					① 사이트에서 상품과 용역의 판매는 판매회원 등록이 완료되는 동시에 가능하며, 판매회원은 상품과 용역에 관한 정보를 판매회원툴을 통하여 직접 등록, 관리해야 합니다. 이를 위해서 판매회원은 상품의 등록에서 판매, 정산에 이르기까지의 과정 및 환불, 반품 과정을 알기 쉽게 설명한 가이드 또는 매뉴얼을 판매회원툴을 통하여 제공받습니다.
					② 상품과 용역의 판매가격(표준마진율, 배송비, 서비스이용료 등을 판매자가 직접 고려 및 판단해야 합니다) 및 기타 상품과 용역의 광고∙홍보를 포함하는 모든 판매활동은 판매회원 스스로 판단 및 결정하며, 본인의 행위에 대한 법적 책임을 부담하여야 합니다. 만약 판매회원이 법령 및 본 약관을 위배하는 행위를 한 경우에 회사는 본 약관 제16조 및 제17조에 따라 이용자(11번가를 이용하는 회원 및 비회원, 이하 같음) 보호와 회사의 손해를 최소화 할 수 있는 조치를 취할 수 있습니다.
					③ 판매회원은 재고 수량 등 수시로 바뀌는 사항에 대한 데이터를 적절히 관리해야 하며, 판매회원은 데이터를 허위로 기재할 수 없습니다.
					④ 판매회원은 「전자상거래 등에서의 소비자보호에 관한 법률」(이하 “「전자상거래법」”), 「전자금융거래법」, 「여신전문금융업법」, 「전기통신사업법」, 「식품위생법」, 「화장품법」, 「전기용품 및 생활용품 안전관리법」, 「부가가치세법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「상표법」, 「저작권법」, 「어린이제품 안전 특별법」 등 사이트에서 상품과 용역의 판매와 관련하여 법령이 요구하는 사항을 지켜야 하며, 회사가 위법 또는 위험 여부를 최종 확인하기 이전에 이용자 보호를 위해 필요하다고 인정하는 경우에는 판매금지 등 필요한 조치를 우선 취할 수 있습니다. 단, 확인 결과 위법 또는 위험 요소가 없는 경우에는 지체 없이 해당 조치를 해제합니다.
					⑤ 판매회원은 회사가 서면으로 미리 승인하지 않으면 사이트의 상호나 로고 등을 사용할 수 없습니다.
					⑥ 판매회원은 판매된 상품 및 용역에 대한 보증 서비스를 자신의 책임과 비용으로 시행하여야 합니다.
					⑦ 판매회원은 세금계산서 발급 등 구매회원의 요구에 응해야 합니다.
					⑧ 판매회원은 구매회원이 확인할 수 있도록 본인의 연락처, 주소 등의 정보를 정확하게 등록∙공개해야 하며, 구매회원의 문의에 성실하고 정확하게 답변해야 합니다. 판매회원의 불성실, 부정확한 답변으로 구매회원에게 손해가 발생하면 판매회원이 이에 대해 책임을 부담합니다.
					⑨ 판매회원은 상품의 판매와 관련하여 특정한 인허가 자격이 요구되면 이에 대한 요건을 만족한 후 판매상품을 등록하여 판매 또는 광고해야 합니다. 인허가 자격을 갖추지 않은 상태에서 관련 상품을 판매 또는 광고하여 발생한 모든 민∙형사상의 책임은 판매회원 본인에게 있습니다.
					⑩ 판매회원은 상품 등록 후 장기간 판매가 없는 상품 등록을 유지할 수 없으며, 이를 위반하면 회사는 별도 통지 없이 상품 검색의 효율성 제고와 구매자 편의 개선을 위해 해당 상품을 삭제하거나 판매 중단 처리할 수 있습니다. 다만, 본 규정에도 불구하고 회사는 6개월 간 상품 등록, 판매활동 또는 판매실적이 없는 해외 개인셀러의 경우에는 서비스 이용 제한 또는 계약을 해지할 수 있습니다.
					⑪ 회사는 판매회원의 사유로 배송 완료까지 상당 시간이 흐르거나 취소율이 일정 수준을 초과하면 경고, 신용점수 차감, 아이디(ID) 정지 등 서비스 품질향상을 위하여 해당 판매회원에게 필요한 조치를 취할 수 있습니다. 이때 회사는 구체적인 내용에 대한 정책을 합리적인 기준에 따라 정하고 미리 공지합니다.
					
					
					 
					제6조 (지식재산권)
					① 판매회원은 상품, 서비스 등의 등록 및 판매, 이벤트, 기획전 등과 관련하여 제3자의 상표권, 특허권, 저작권, 성명권, 초상권 등 제반 지식재산권을 침해하지 않아야 하며, 제3자의 지식재산권을 사용할 때에는 정당한 권리자로부터 사용 허락을 받은 후에 사용해야 합니다.
					② 판매회원이 등록∙사용한 제반 정보(초상, 성명 포함)에 대하여 제3자가 지식재산권과 관련한 권리침해를 주장하면, 회사는 본 약관 제16조 제1항 제2호 및 제17조 제2항에 따라 해당 상품과 서비스의 판매를 중지하는 등 필요한 조치를 취할 수 있습니다.
					③ 판매회원이 등록한 상품, 서비스에 관한 이미지, 상품상세 등 제반 정보는 판매 장려를 위하여 사이트, 회사가 제휴한 제3자(및 그 사이트)와 다른 회원의 블로그 등에 회사가 정한 방침에 따라 노출될 수 있습니다. 다만, 다른 회원이 블로그 등에 이를 노출하려면 회사가 정한 방침에 동의하고 회사가 허용한 방식으로만 하여야 합니다.
					④ 회사는 판매회원이 등록한 이미지 등 제반 정보(초상, 성명 포함)가 가이드 미준수 또는 분쟁이 발생한 경우에는 이를 수정할 수 있습니다. 또한, 판매회원이 이벤트 또는 기획전 등의 참여를 신청한 경우에 회사는 판매회원이 상품 상세 페이지 상에 등록한 이미지 등을 활용하여 이벤트 또는 기획전 등에 사용할 이미지 등을 제작할 수 있으며 판매회원은 이에 대한 권리도 확보하여야 합니다.
					⑤ 판매회원은 사이트에 등록∙사용한 정보와 관련하여 제3자로부터 소송 또는 소송 이외의 방법 등으로 이의제기를 받게 되면 회사를 면책시켜야 하며, 면책에 실패한 경우 그로 인해 회사가 입은 모든 손해를 배상하여야 합니다.
					
					
					 
					제7조 (상품의 배송)
					① 구매자의 주문에 따른 결제가 완료된 순간 회사는 판매회원에게 주문 정보를 판매회원툴, 이메일(E-mail), 팩스, 전화 등의 방법으로 전달하고, 판매회원은 해당 주문 정보에 따라 배송을 하여야 합니다.
					② 판매회원은 주문내역을 확인하고 배송 중 상품이 파손되지 않도록 적절한 포장을 한 후 배송을 증명하거나 추적할 수 있는 물류대행(택배)업체에 배송을 위탁하여야 합니다.
					③ 「전자상거래법」 제15조 제1항에 따라 판매회원은 구매자의 결제일로부터 3영업일 이내에 상품 등의 공급을 위하여 필요한 조치를 하여야 하고(단, 구매자와 판매회원 간에 상품 등의 공급 시기에 관하여 따로 약정한 경우는 제외), 판매회원툴에 송장번호 등의 발송 관련 데이터를 입력하여 발송이 완료되었음을 증명하여야 합니다.
					④ 판매회원이 전항의 기한 내에 발송하지 않거나, 배송지 오류 등으로 구매자가 상품을 정상적으로 받지 못하면 판매회원은 그에 관한 모든 책임을 부담하여야 합니다.
					⑤ 판매회원은 발송 후 3일 이내에 구매자가 주문한 상품을 받을 수 있도록 조치해야 하며, 구매자는 배송상태가 ‘배송완료’로 되어 있으나 상품을 받지 못한 경우 또는 3영업일 이상 장기간 ’배송 중’으로 되어 있는 경우에는 상품 미도착 신고를 접수할 수 있습니다. 구매자의 상품 미도착 신고가 접수되면 판매회원은 판매회원툴을 통하여 이를 확인하고 필요한 조치를 하여야 합니다. 판매회원이 상품 미도착 신고 접수일로부터 10일 이내에 필요한 조치를 하지 않으면, 회사는 거래를 취소하고 구매자에게 환불할 수 있습니다.
					⑥ 회사가 구매자의 구매대금 결제 확인을 통지한 후 상당 기간 발주확인을 하지 않거나, 발주확인을 한 이후라도 배송 등 후속 절차를 이행하지 않으면 회사는 별도의 개별 정책으로 구매자에게 자동으로 환불 처리하는 등의 조치를 할 수 있습니다. 다만, 구매자가 희망하지 않는 경우는 제외하며 개별 정책은 미리 공지합니다.
					⑦ 회사는 제3자와 업무제휴를 통해 통합택배, 해외배송 서비스 등을 시행할 수 있습니다.
					
					
					 
					제8조 (교환, 환불)
					① 구매자가 상품 수령 후 교환이나 환불을 요청하면 판매회원은 「전자상거래법」 등 관련 법률에 따라 반품을 받은 후 교환이나 환불을 해주어야 하며, 추가로 발생하는 비용은 구매자와 판매회원 중 교환이나 환불의 책임이 있는 측에서 부담합니다.
					② 발주확인 후 취소 요청 건에 대해 2영업일 이내에 환불처리나 발송확인 처리를 하지 않으면, 3영업일에 주문 건은 자동으로 환불 처리됩니다.
					③ 판매회원은 상품의 하자 또는 사용 상의 안전성에 결함이 있는 경우에는, 이를 전량 회수하여 수리, 교환, 환불하는 ‘리콜’ 조치를 취하여야 하며, 이에 따른 모든 비용을 부담하여야 합니다.
					④ 판매회원은 「전자상거래법」 제17조 제2항에 따라 청약철회가 제한되는 사유에 해당되는 경우 청약철회가 불가능하다는 사실을 전자상거래법 제17조 제6항에 따라 상품의 포장 기타 소비자가 쉽게 알 수 있는 곳에 명기하여야 합니다.
					⑤ 상품을 반품 받은 판매회원은 배송비 정산, 사은품의 반환 확인 등이 필요하면 반품을 보류할 수 있고, 제4항에 따른 청약철회 제한 사유에 해당하는 등 정당한 사유가 있으면 반품을 거부할 수 있습니다. 판매회원이 반품보류 없이 반품수령일(용역 또는 디지털 콘텐츠를 공급한 경우에는 구매자가 청약철회를 한 날)로부터 3영업일 이내에 특별한 의사를 표시하지 않으면 회사는 환불에 필요한 조치를 할 수 있으며, 그 구체적인 사항에 대하여 회사는 합리적인 기준에 따라 정책을 정할 수 있습니다. 다만, 판매회원이 구매자의 청약철회를 제한하고자 그 사유를 증빙하여 환불보류를 요청하면 회사는 환불을 보류할 수 있습니다.
					⑥ 회사는 제5항의 규정에도 불구하고 판매회원이 구매자로부터 반품을 받아 이를 보류 또는 거부할 지 여부를 직접 판단∙결정하기 이전에 회사의 정책으로 우선 반품을 승인 처리한 후 구매자에게 환불할 수 있습니다. 이때 특정 환불 처리 건에 대해 판매회원이 이의를 제기하는 경우에는 회사가 구매자를 대신하여 환불의 적법성 여부를 가리며 회사의 과실로 적법하지 않은 환불을 하여 판매회원에게 손실이 발생한 경우에는 이를 회사의 책임으로 보상합니다.
					⑦ 판매회원은 구매자가 반품한 상품을 수령해야 하며, 판매회원의 연락 두절 등의 사유로 반품배송을 할 수 없어 구매자가 직접 회사로 상품을 보낼 때에는 회사는 상당 기간을 정하여 해당 상품을 수령할 것을 판매회원에게 통지하고, 판매회원이 해당 기간 내에 특별한 의사를 표시하지 않으면 회사는 해당 상품을 폐기할 수 있습니다.
					
					
					 
					제9조 (판매대금의 정산)
					① 구매자가 서비스 화면에서 구매확정을 클릭하거나 자동구매확정이 되면 회사는 그로부터 2일(토요일 및 법정공휴일 제외) 이내에 판매대금에서 서비스이용료, 회사에 대한 미납금 및 기타 채무금을 공제한 나머지 금액을 판매회원에게 송금합니다. 다만, 구매자가 신용카드로 결제했을 때에는 회사는 허위등록 또는 판매가장등록, 신용카드 결제시스템만을 이용하기 위한 허위거래가 의심되는 거래의 해당 내역을 확인하기 위하여 최고 60일까지 송금을 보류할 수 있습니다. 이 경우 판매회원이 물품판매에 관한 거래사실 증빙서류를 회사에 제공한다면 회사는 이를 확인한 후 송금 처리합니다.
					② 구매확정 기간 내에 구매자가 구매확정, 교환 또는 반품에 대한 의사표시를 하지 않아 구매확정의 의사가 있는 것으로 간주되면 회사는 그 다음 영업일에 자동구매확정으로 처리할 수 있습니다.
					③ 회사는 판매회원툴을 통하여 판매금액, 추가정산금액, 공제금액, 정산금액을 판매회원에게 통보합니다.
					④ 판매회원은 물품발송을 표시할 때 송금방법을 지정해야 합니다. 계좌입금을 송금방법으로 선택한 경우 판매회원이 지정한 입금계좌의 예금주는 판매회원과 동일인임을 원칙으로 합니다.
					
					
					 
					제10조 (정산의 보류)
					① 회사는 판매회원의 귀책사유로 발생한 비용을 판매대금 정산 때 공제할 수 있으며, 판매회원과의 이용계약 종료 후에는 해당 판매회원의 판매대금의 일정 비율에 해당하는 금액을 이용계약 종료일로부터 일정 기간 예치하여 이 기간에 구매자로부터 환불, 교환 등 이의제기가 있을 때 관련 비용의 지급에 사용할 수 있습니다.
					② 회사는 장기간 배송지연 건을 배송완료 건으로 간주하여 주문 절차를 종결할 수 있되, 판매대금의 정산은 향후 구매자의 환불 요청에 대비하여 일정 기간 유보할 수 있습니다.
					③ 판매회원의 채권자가 신청한 사항에 대해 법원이 판매대금의 가압류, 압류 및 추심명령 등을 결정하면, 회사는 판매회원과 채권자 간의 합의 또는 채무액의 변제 등으로 이 결정이 해제될 때까지 판매대금의 정산을 중지할 수 있습니다.
					④ 본 조에 정한 것 외에도 법률의 규정이나 합리적인 사유(구매자 클레임 다수 발생시 환불요청 대비 등 구매자 보호를 위한 경우, 부정거래 발생, 법원∙수사기관∙금융기관 등 권한 있는 기관의 요청이 있는 경우)가 있으면 회사는 해당 사항을 판매회원에게 통지하고 판매대금의 전부 또는 일부의 정산을 일정 기간 유보하거나 상계할 수 있습니다.
					⑤ 회사는 「특정 금융거래정보의 보고 및 이용 등에 관한 법률」(이하 「특정금융정보법」)에 따른 금융회사등으로서 판매회원이 「범죄수익은닉의 규제 및 처벌 등에 관한 법률」(이하 「범죄수익은닉규제법」)에 따른 중대범죄 및 같은 법 제2조 제2호 나목에서 규정된 범죄(이하 ‘특정범죄’)의 행위에 해당하는 거래로 의심할 만한 사정이 있는 경우 「특정금융정보법」 제4조에 따라 금융정보분석원장에게 보고하고, 판매대금이 범죄수익으로 판단되는 경우에는 「범죄수익은닉규제법」 제5조 제1항에 따라 관할 수사기관에 신고하며, 다음 각호의 기간까지 정산을 보류합니다.
					1. 판매회원이 신고된 특정범죄로 기소되지 않는 경우 : 수사종결 시까지
					2. 판매회원이 신고된 특정범죄로 기소된 경우: 관련 재판의 판결 확정 시까지
					
					
					 
					제11조 (전세계배송 이용특약)
					① 전세계배송 서비스는 구매자가 구매한 상품이 회사의 물류센터(회사와 제휴 관계를 맺은 제3자의 물류센터 포함)를 거쳐, 해외배송망을 통해 수취인에게 배송되는 서비스를 말합니다.
					- 국내배송단계: 구매자가 구매한 상품이 회사의 물류센터로 입고되는 시점까지의 단계
					- 해외배송단계: 물류센터 입고 이후 해외배송망을 통해 수취인에게 배송되기까지의 단계
					② 상품이 전세계배송으로 판매되었다면 판매자는 해당 상품을 구매자에게 배송하지 않고 회사의 물류센터(회사와 제휴 관계를 맺은 제3자의 물류센터 포함)로 배송합니다. 회사의 물류센터는 판매자를 대신하여 해외의 구매자(혹은 수취인)에게 해외배송 서비스를 제공합니다.
					③ 전세계배송 서비스는 전세계 배송이 가능한 상품군에 한하여 적용되며 판매자는 해외배송비 계산을 위해 상품 무게 값을 입력하고 상품 정보를 확인하여야 합니다. 또한, 국내 통관 불가, 원산지 표기 오류, 상품파손, 오배송 등으로 반송, 반품, 교환이 있다면, 이 때문에 발생하는 비용은 판매자가 부담합니다. 단, 판매자에게 귀책 사유가 없는 경우에는 예외로 합니다.
					④ 회사는 전세계배송 주문 체결 건에 대하여 구매대금(구매회원이 실제 결제한 금액에서 전세계배송 해외배송비를 제외한 금액)을 기준으로 회사에서 제시하는 비율(%)로 판매대금에서 ‘수출대행수수료’ 항목을 공제합니다.
					⑤ 판매자는 회사가 판매회원툴을 통해 공지하는 전세계배송 서비스 이용 정책을 숙지하고 따릅니다.
					
					
					 
					제12조 (개인정보의 보호)
					① 판매회원은 판매서비스를 이용하면서 얻은 타인의 개인정보(구매회원 등)를 이 약관에서 정한 목적 이외의 용도로 사용할 수 없으며, 이를 위반하면 관련 법령에 따라 모든 민∙형사상의 법적 책임을 지고 자신의 노력과 비용으로 회사를 면책시켜야만 하며, 회사는 해당 판매회원에 대한 계약 해지 등 제17조 제2항에 따른 제제 조치를 취할 수 있습니다.
					② 회사는 개인정보 보호를 위하여 배송 등의 목적으로 판매회원에게 공개된 구매회원의 개인정보를 상당 기간이 지난 후 비공개 조치할 수 있습니다.
					③ 회사가 개인정보를 보호하는 데 상당한 주의를 기울였음에도 특정 판매회원이 제1항을 위반하여 타인의 개인정보를 유출하거나 유용했을 때 회사는 그에 대하여 아무런 책임을 지지 않습니다.
					④ 「전기통신사업법」 등 관련 법령이 규정하는 적법한 절차에 따라 수사관서 등이 판매회원에 관한 정보의 제공을 회사에 요청했을 때 회사는 해당 자료를 제출할 수 있습니다.
					⑤ 판매회원이 불법행위를 하였거나 구매자 또는 제3자의 신고, 소송 제기 등으로 인해 불법행위가 의심되는 경우, 회사는 이에 대한 수사 등을 의뢰하거나 협조하기 위하여 관련 자료를 수사관서, 법원 등에 제출할 수 있고, 판매회원은 이에 동의합니다.
					⑥ 판매회원은 회사로부터 제공받은 개인정보(구매회원 등)를 제공받은 목적(배송, CS 등)의 용도로 법령 또는 회사가 정한 기간 동안 보유할 수 있으며 그 기간이 종료될 경우 즉시 파기해야 합니다. 또한 제공받은 개인정보(구매회원 등)의 주체로부터 직접 파기 요청을 받은 경우 이에 응해야 합니다.
					⑦ 판매회원은 관련 법령 및 방송통신위원회 고시에 따라 회사로부터 제공받은 개인정보(구매회원 등)를 보호하기 위하여 기술적∙관리적 보호조치를 취해야 합니다.
					
					
					 
					제13조 (계약기간 및 해지)
					① 이용계약의 기간은 판매회원이 약관에 동의한 날로부터 해당 연도 말일까지이며, 판매회원이 기간 만료 1개월 전까지 서면으로 반대 의사를 표시하지 않는 한 계약기간은 같은 조건으로 1년간 자동 갱신됩니다.
					② 당사자 일방에게 다음 각 호의 사유가 발생했을 때 그 상대방은 별도의 최고 없이 해지를 통지함으로써 이용계약을 즉시 해지할 수 있습니다.
					1. 이용계약(구매이용약관, 전자금융거래 이용약관, 개인정보처리방침 등을 포함)의 의무를 위반하여 상대방으로부터 그 시정을 요구 받은 후 7일 이내에 이를 바로잡지 않은 경우
					2. 부도 등 금융기관의 거래정지, 회생 및 파산절차의 개시, 영업정지 및 취소 등의 행정처분, 주요 자산에 대한 보전처분, 영업양도 및 합병 등으로 이용계약을 더는 이행할 수 없는 경우
					3. 법령을 위반한 경우
					4. 판매회원의 책임 있는 사유로 2개월 간의 거래 건 중 20% 이상에서 구매자로부터 이의가 제기된 경우
					5. 판매 상품이 전자상거래에서의 상품등의 정보 제공에 관한 고시 상의 정보를 잘못 기재하거나 고의로 누락하여 소비자의 구매 또는 청약철회를 방해하는 행위
					6. 회사의 안전판매가이드(https://cs.11st.co.kr/page/seller/faq/category/96)를 위반하고 회사의 시정 요구에 응하지 않는 경우
					③ 판매회원은 언제든지 회사에 해지의사를 통지함으로써 이용계약을 해지할 수 있습니다.
					④ 이용계약이 해지될 때까지 판매회원은 완결되지 않은 주문 건의 배송, 교환, 환불에 필요한 조치를 해야 하며, 해지 이전에 이미 판매한 상품에 대한 판매회원의 책임과 관련 조항은 그 효력을 유지합니다.
					
					 
					
					 
					제14조 (손해배상)
					① 당사자 일방 또는 당사자 일방의 피고용인, 대리인, 기타 도급 및 위임 등으로 당사자 일방을 대신하여 이용계약을 이행하는 자의 책임 있는 사유로 말미암아 이 계약의 이행과 관련하여 상대방에게 손해가 발생하면, 그 당사자 일방은 상대방에게 발생한 손해를 배상할 책임이 있습니다.
					② 판매회원이 이용계약을 위반하여 회사의 대외 이미지 실추 등 회사에 유∙무형적 손해가 발생하면, 판매회원은 회사의 손해를 배상해야 합니다.
					③ 회사는 제10조 제5항에 따른 본 약관 위반 및 불법행위를 한 판매회원에 대하여 불법행위와 관련된 상품의 판매기간 동안 발생한 총 판매대금의 10%를 위약벌로 부과하며, 해당 판매회원에게 판매대금 정산이 보류되어 있는 경우 위약벌에 해당하는 금액을 자동채권으로 하고 보류된 정산대금을 수동채권으로 하여 즉시 상계합니다.
					
					
					 
					제15조 (회사의 면책)
					① 회사는 사이트를 기반으로 한 거래시스템만을 제공할 뿐, 판매회원이 등록한 상품과 용역, 그에 관한 정보 등에 대한 책임은 판매회원에게 있습니다. 또한 판매회원과 구매자와의 거래에서 분쟁이 발생했을 때 회사는 그 분쟁에 개입하지 않으며 분쟁의 결과에 대한 모든 책임은 판매회원이 부담합니다. 이와 관련하여 회사가 제3자에게 손해를 배상하거나 기타 비용을 지출하게 된다면 회사는 판매회원에게 구상권을 행사할 수 있습니다. 단, 회사는 분쟁의 합리적이고 원활한 조정을 위하여 회사가 설치/운영하는 분쟁조정센터(고객센터 포함)를 통하여 예외적으로 해당 분쟁에 개입할 수 있으며, 판매회원은 분쟁조정센터의 결정을 신의성실의 원칙에 따라 최대한 존중해야 합니다.
					② 회사는 권리자의 적법한 요구가 있으면 해당 상품과 용역 등에 관한 정보를 삭제하거나 수정할 수 있으며, 판매회원은 이에 따른 손해배상을 회사에 청구할 수 없습니다.
					③ 회사는 「전자상거래법」 제20조 제2항에 따라 판매회원의 정보를 열람하는 방법을 구매자에게 제공할 수 있으며, 판매회원은 해당 정보를 기재하지 않거나 허위로 기재하여 발생하는 모든 책임을 져야 합니다.
					④ 회사는 컴퓨터 등 정보통신설비의 보수, 점검, 교체 및 고장, 통신 두절 등의 사유가 발생하면 판매서비스의 제공을 일시적으로 중단할 수 있으며, 이와 관련하여 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.
					
					
					 
					제16조 (금지 상품 및 행위)
					① 회사는 다음 각 호에서 정하는 매매 부적합 상품의 등록∙판매를 금지하며, 이러한 상품을 등록∙판매했을 때의 모든 책임은 해당 상품을 등록∙판매한 판매회원이 부담합니다.
					1. 거짓 또는 과장하거나 구매자를 기만하는 방법으로 광고한 상품
					2. 지식재산권, 상표권 등 타인의 권리를 침해하는 상품(불법 복제된 영상물, 음반, 게임물, 위조∙모조품 등)
					3. 법령에 따라 유통 및 판매가 금지된 상품(장물, 습득한 유실물, 통신판매를 금지한 유가증권, 단말기 보조금 관련 사항을 기재한 상품, 담배, 도수가 있는 안경·선글라스, 콘택트렌즈, 군수품, 의약품, 주류, 살아 있는 동물 등. 단, 정부의 고시 등에 따라 통신판매가 허용되는 경우는 제외)
					4. 유통 및 판매를 위하여 필요한 정부의 검정∙검사∙심의, 법정인증(전기용품, 공산품, 어린이용품, 화학제품 등)을 통과하지 못하였거나 인증 표시가 없는 상품
					5. 기타 관계 법령에 저촉되거나 회사가 합리적인 사유로 판매를 금지하는 상품
					② 회사는 회사와 다른 판매회원의 정상적인 영업 활동을 방해하는 다음 각 호의 상품 판매 및 행위를 금지합니다.
					1. 실제 판매하지 않는 상품(테스트 목적으로 등록한 경우 등)
					2. 상품과 관련이 없거나 해외 발송 상품을 국내 카테고리에 등록하는 등 정책을 위반하여 카테고리에 등록한 상품
					3. 동일 카테고리 또는 인접 카테고리에 같거나 유사한 판매조건으로 복수 등록한 중복 상품(같은 상품으로 간주되는 경우도 포함)
					4. 검색 노출을 확장하기 위해 판매 상품과 관련 없는 브랜드명, 물품명, 인기 키워드 등을 기재하여 등록한 상품
					5. 실제 재고를 보유하지 않으면서 허위로 재고를 등록한 상품(상품 등록 유지를 위해 가격을 임의로 변경해 유지하거나, 구매신청이 들어오면 재고를 보유한 다른 판매자에게 재주문하여 구매자에게 배송하는 경우 등)
					6. 상품의 판매 가격이 시중의 통상적인 거래 가격보다 지나치게 낮거나 높아 위∙모조품 또는 허위 재고로 의심되는 상품
					7. 사이트를 통하지 않고 구매자에게 직접 상품을 판매하거나 이를 유도하는 행위 또는 상품 발송 이전이나 구매자의 실제 상품 수령 이전에 구매자에게 구매확정에 관한 안내를 하거나 구매확정을 하도록 유도하는 일체의 행위
					8. 다른 오픈마켓이나 인터넷쇼핑몰 등에 임의로 최저가를 등록하는 행위 등으로 11번가의 할인쿠폰 발행을 유도한 후 구매자가 해당 쿠폰을 적용한 조건으로 판매하는 행위
					9. 판매회원 본인의 상품 구매 또는 실제 상품의 이동 없이 판매점수 및 광고 효과를 높이기 위한 구매 또는 부당한 할인 획득을 위해 제3자의 명의 또는 계정을 이용하여 구매하는 행위
					10. 판매회원이 판매한 각각의 상품에 대한 발송예정일까지 상품을 발송하지 않거나, 발송하지 않은 상품에 대한 운송장번호를 미리 입력하는 행위(가송장 사용 행위), 설치상품 등 배송 추적이 되지 않는 상품에 대해 상품 발송(배송사 전달 또는 설치 상품의 배송 출발) 이전에 미리 판매회원툴에서 발송완료로 처리하여 구매자에게 허위 배송 정보를 제공하는 행위 및 이에 준하는 행위
					11. 연락처, 주소 등의 정보를 거짓으로 등록하거나 회사 또는 구매자의 정당한 연락을 회피하는 행위 및 불성실, 부정확한 답변을 하는 행위
					12. 판매회원이 본인에게 책임이 있는 사유로 주문을 취소하는 것임에도 법령 또는 회사의 정책 적용을 회피할 목적으로 구매자에게 취소를 요구하거나 종용하는 행위
					13. 제17조 제1항에서 정하는 회사의 모니터링 업무에 협조하지 않아 답변 및 증빙 자료의 제출을 거부∙해태 하는 행위
					14. 기타 비정상적인 방법으로 노출한 모든 상품 및 부당한 이익을 취하는 모든 행위
					③ 판매회원은 회사의 경영 또는 영업 활동을 방해하는 불공정행위를 직∙간접적으로 하거나, 제3자로 하여금 하게 해서는 안 됩니다. 특히 판매회원은 직접 또는 회사와 경쟁관계에 있는 제3자 또는 해당 사이트(이하 "경쟁회사"로 통칭함)와 연계∙공조하여 법령 상 금지된 불공정행위(사업활동 방해 등)를 하여 회사의 영업에 피해를 주는 행위를 해서는 안 됩니다.
					
					
					 
					제17조 (제재 절차 및 조치)
					① 회사는 판매회원의 법령 위반, 본 약관 위반, 기타 금지 행위 여부에 대한 모니터링을 실시하고 있으며, 판매회원은 회사의 모니터링 업무에 협조하여야 하고, 회사가 요청하는 소명 사항에 대한 확인 및 답변과 필요 최소한의 증빙 자료를 제출할 의무가 있습니다.
					② 회사는 판매회원이 법령 또는 제16조를 비롯한 본 약관에서 금지하는 행위를 하였거나 또는 법령∙가격∙유통상황∙상품광고의 내용 등을 종합적으로 고려하여 금지 행위를 한 것으로 판단하는 경우에는 위반 행위의 경중 및 횟수에 따라 소명 요청, 수정 요청, 경고, 서비스 이용제한(판매 중지 또는 금지를 통한 “판매 활동 제한” / 신규 상품 등록 중지 또는 금지, 제재 대상과 동일한 상품의 등록 중지 또는 금지, 상품 전시 차단 또는 삭제, 검색 제한, 광고 사용 중지 또는 광고 입찰 제한을 통한 “상품 등록∙전시∙검색∙광고 제한” / 상품 발송 지연 사실 등 법령 또는 약관 위반 사실의 공개), 거래 취소(이 경우 판매회원이 지급한 서비스 이용료는 환불되지 않을 수 있습니다) 또는 즉시 환불(구매자 취소 요청 시 판매자 확인 절차 없이 바로 환불 처리), 계약 해지, 재가입 차단 등 이용자 보호와 회사의 손해를 최소화 할 수 있는 조치를 취할 수 있습니다.
					③ 회사는 제2항에서 정한 조치를 하기 이전에 해당 판매회원에 대하여 의견 청취 절차를 진행하며, 판매회원은 3영업일(단, 회사가 판매회원의 소명 기간 연장 요청에 동의한 경우에는 그 기간) 이내에 소명하여야 합니다.
					④ 회사는 제2항에서 정한 조치가 있은 후에 해당 판매회원이 법령 및 본 약관에 위반하는 행위를 하지 않았음을 입증한 경우 또는 제3항의 의견 청취 결과 위반 사실이 없는 것으로 소명된 경우에는 이미 시행한 조치를 지체 없이 해제하여 원상 회복합니다.
					⑤ 회사는 판매회원이 법령 또는 제16조를 비롯한 본 약관에서 금지하는 행위를 하여 발생한 회사의 손해를 해당 판매회원에게 청구할 수 있습니다. 특히 판매회원이 제16조 제2항의 매매 부적합 상품 중 위조품을 판매하여 구매자에게 손해가 발생했을 때 회사는 손해에 상당하는 금액(구매대금 및 구매자의 정신적 피해에 대한 보상)을 구매자에게 직접 지급할 수 있고, 이때 회사는 구매자에게 지급한 보상금(금전적 가치로 환산할 수 있는 수단을 포함) 및 회사가 지출한 제반 경비(상품 운송비 등)를 해당 위조품을 등록∙판매한 판매회원에게 청구할 수 있습니다. 이 규정은 제15조에서 규정하는 회사의 면책을 부인하는 것으로 해석될 수 없습니다.
					⑥ 제16조 제3항의 매매 부적합 상품을 회사가 보관하게 된 경우 판매회원은 해당 상품을 본인의 부담으로 회사의 보관 창고에서 지체 없이 반출하여야 합니다. 다만, 2주 이내에 반출하지 아니할 경우 회사는 국세청, 경찰 조사 등의 사유가 있는 경우를 제외하고는 해당 상품을 판매자가 등록한 주소로 발송할 수 있으며, 판매자의 주소 불명으로 발송이 불가능하거나 반송되는 경우에는 해당 상품을 폐기할 수 있습니다. 이 경우 관련 비용은 해당 판매회원이 부담합니다.
					
					
					 
					제18조 (공정거래를 위한 법령 준수)
					회사는 다음 각 호의 어느 하나에 해당하는 불공정 거래 행위 또는 부당한 공동행위를 하지 않으며, 「독점규제 및 공정거래에 관한 법률」 등 관련 법령을 지킵니다.
					1. 정상적인 거래 관행에 비추어 부당한 조건 등 불이익을 판매회원에게 제시하여 거래하도록 강제하는 행위
					2. 서비스이용료 및 판매촉진서비스 이용료의 결정과 관련하여 회사와 경쟁관계에 있는 제3의 회사와 담합하는 등의 불공정 행위
					3. 판매회원들을 부당하게 차별적으로 취급하여 서비스 이용료와 판매촉진서비스 이용료를 판매회원 별로 다르게 정하는 행위. 다만, 합리적인 사유가 있으면 다르게 정할 수 있습니다.
					4. 회사와 경쟁관계에 있는 제3의 회사와 거래하는 것을 금지하거나 부당하게 강요하는 행위 등 불이익을 주는 행위
					
					
					 
					제19조 (비밀유지)
					① 각 당사자는 법령상 요구되는 경우를 제외하고는 상대방으로부터 취득한 구매자정보, 기술정보, 생산 및 판매계획, 노하우 등 비밀로 관리되는 정보를 제3자에게 누설해서는 안 되며, 그 정보를 이용계약의 이행 이외의 목적으로 사용해서는 안 됩니다.
					② 제1항의 의무는 이용계약의 종료 후에도 3년간 존속합니다.
					
					
					 
					제20조 (관할법원)
					이용계약과 관련하여 회사와 판매회원 간에 분쟁이 발생하여 소송이 제기될 때에는 민사소송법에 따라 관할법원을 정합니다.
					
					
					 
					제21조 (보칙)
					① 판매회원은 주소지 또는 대금결제를 위한 통장계좌 등에 변경이 있으면 즉시 회사에 해당 내용을 통지해야 하며, 회사는 통지의 지연으로 발생한 손해에 대해 책임을 지지 않습니다.
					② 각 당사자는 상대방의 서면 동의 없이 이용계약상의 권리와 의무를 제3자에게 양도하거나 처분할 수 없습니다.
					③ 이 약관과 관련하여 당사자가 서로 합의하여 추가로 작성한 계약서, 협정서, 약정서 등과 회사의 정책변경, 법령의 제·개정 또는 공공기관의 고시·지침 등에 따라 회사가 사이트 또는 판매회원툴을 통해 판매회원에게 공지하는 내용도 이용계약의 일부를 구성합니다.
					④ 이 약관과 이용정책, 개별약관에서 정하지 않은 사항은 구매이용약관을 따르며, 구매이용약관에서 정하지 않은 사항은 관련 법령과 상관례를 따릅니다.
					
					
					 
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2007.10.15.부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2008.10.8일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2009년 5월 7일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2009년 12월 24일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2010년 1월 8일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2010년 6월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2010년 6월 10일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2010년 7월 23일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2011년 1월 28일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2011년 7월 29일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2011년 10월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2012년 6월 15일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2012년 7월 27일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2012년 10월 3일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2013년 2월 25일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2013년 2월 28일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2013년 4월 12일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2013년 11월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2014년 8월 29일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2014년 12월 18일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2015년 6월 25일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2015년 8월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2016년 4월 27일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2016년 8월 8일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 3월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 5월 8일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 6월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 7월 3일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 7월 21일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 9월 21일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 9월 25일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 11월 2일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2017년 11월 10일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2018년 9월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2018년 9월 18일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2018년 9월 21일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2019년 1월 3일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2019년 4월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2019년 5월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2019년 5월 30일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2019년 8월 8일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2019년 9월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2021년 10월 1일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2022년 2월 15일부터 시행합니다.
					■ 부칙
					제 1 조 (시행일)
					이 약관은 2022년 9월 1일부터 시행합니다.

 

 
                  </div>
                </div>
              </div><!-- # Faq item-->
              
              <!-- 세번째 약관동의 체크박스 -->
              <div>
              	판매이용약관에 동의합니다.
              	<input type="checkbox" class="check">
   			  </div>
   			  

            </div>
            	

          </div>
            	<!-- 전체 약관동의 체크박스 -->
            	<div>
               		전체동의<input type="checkbox" id="all" style="cursor: pointer">
   			  	</div>
        </div>
        
        <div style="float: right">
       		<button type="button" id="agreeBtn">다음</button>
		</div>
      </div>
    </section><!-- End Frequently Asked Questions Section -->
    
<!— ===========footer=============== —>
<c:import url="../common/footer.jsp"></c:import>
<!— ================================ —>
</body>
</html>