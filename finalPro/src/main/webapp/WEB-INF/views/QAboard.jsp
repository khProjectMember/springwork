<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>樂受文化 악수문화센터</title>

    <!-- css -->    

    <link rel="stylesheet" href="resources/css/servicecenterQA.css">

    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
  

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
 
    <!--jquery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="common/header.jsp" />   
   
    <div id="wrap">
        <div id="content">
            <div class="inner">
                <div class="content_fir">
                    <div class="nav_box">
                        <ul>
                            <li><a href="#" class="nav_a"><img src="resources/img/icons8-홈-페이지-25.png" alt="main화면"></a></li>
                            <li><a href="#" class="nav_a">고객센터</a></li>
                            <li><a href="#">1:1문의</a></li>
                        </ul>                            
                    </div>                     
                </div>              
            </div>
        </div>
    </div>
    <div id="wrap">
        <div id="content" style="padding-top:96px;">
            <div class="inner">
                <div class="bz">
                    <h2 style="padding-left:15px; font-size:40px;">자주하는문의</h2>                       
                    <div class="container">
                        <div class="reco">
                            <form id="frm" name="frm" method="post" action="">

                            </form>
                            <div class="inqury-wrap">
                                <img src="resources/img/QNA.jpg" alt="찾는 답변이 없으세요?이용 문의에서 원하시는 답을 찾지 못하시는 경우 전화 또는 1:1 고객문의 내용을 남겨주세요" class="img-change1">
                            </div>
                            <div class="inqury-link">
                                <ul>
                                    <li>
                                        <a href="#" class="call_center">
                                            <span class="img-icon">
                                                <img src="../img/pencil.png" style="display:inline-block; vertical-align:top;">
                                            </span>
                                            <strong class="call_center_sub"style="padding-left:10px; font-size:18px; color: #666;">문화센터 자주하는문의</strong>
                                            <p class="informationculture" style="margin-top: 16px;
                                            line-height: 1.3em;
                                            color: #666;
                                            font-size: 19px;">문화센터 대해 궁금한 사항은 아래 내용을 참고하시기
                                            <br>
                                             바랍니다.
                                             </p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="call_center">
                                            <span class="img-icon">
                                                <img src="resources/img/headset.png" alt="지점별 연락처 보기" style="display:inline-block; vertical-align:top;">
                                            </span>
                                            <strong style="padding-left:10px;font-size:18px;color: #666;">답변게시판</strong>
                                            <p class="informationculture" style="margin-top: 16px;
                                            line-height: 1.3em;
                                            color: #666;
                                            font-size: 19px;">답변게시판에서 확인하시기 바랍니다.</p>                                            
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="call_center">
                                            <span class="img-icon">
                                                <img src="resources/img/headset.png" alt="1:1문의" style="display:inline-block; vertical-align:top;">
                                            </span>
                                            <strong style="padding-left:10px;font-size:18px;color: #666;">1:1문의</strong>
                                            <p class="informationculture" style="margin-top: 16px;
                                            line-height: 1.3em;
                                            color: #666;
                                            font-size: 19px;" class>고객센터>1:1문의 신청하시기 바랍니다.
                                            <span></span>
                                            </p>
                                        </a>
                                    </li>
                                </ul>
                            </div>                          
                        </div>

                        
                        <div class="tab-wrap mt30">
                            <div class="tab_menu-area" style="  padding-left: -1px;">
                                <div class="tab-menu2 callcenter-tab float-wrap slick-initialized slick-slider">
                                    <div area-live="polite" class="slick-list draggable">
                                        <div class="slick-track" role="listbox" style="opacity:1; width:30000px; transform:translate3d(3px, 0px, 0px);">                                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="search-panel search-bd-bottom">
                        <ul class="col2" style="margin-right:-99px;">
                                <li style="width:37%">
                                    <input type="text" class="default-input" id="search_text" name="search_text" placeholder="검색어를 입력하세요" maxlength="50" value>
                                </li>
                                <li class="last">
                                    <a href="#" class="btn btn-srch bg-c">검색</a>
                                </li> 
                            </ul>
                        </div>
                        <div id="Accordion_wrap">          
                                <div class="que">
                                    <span>수업이 휴강되었을 때 보강이 이루어지나요?</span>                                    
                                </div>                                
                                <div class="anw">                  
                                    <span class="ans-top">강사님의 개인사정 및 기타 사유로 인한 휴강의 경우 마지막주 또는 강사님과 수강생이</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서로 합의된 지정일에 보강일자를 선정하여 강좌를 진행합니다.&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 법정공휴일에 의한 휴강은 보강이 없으므로, 강의 일정을 꼭 확인해 주시고&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 법정공휴일에 의한 휴강은 보강이 없으므로, 강의 일정을 꼭 확인해 주시고&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강생 개인사정으로 인한 결석 등의 사유로 수강하지 못한 부분 또한&nbsp;</span><br/>
                                 </div>
                        </div>
                        <div id="Accordion_wrap">          
                                <div class="que">
                                <span>강좌 수강 시 자녀 동반이 가능한가요?</span>                                    
                                </div>                                
                                <div class="anw">                  
                                        <span class="ans-top">수업분위기를 위해 성인강좌의 수강자 및 영아강좌의 수강대상인 자녀 외 자녀동반은 불가합니다.</span><br/>
                                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가족수강생이 아닌 자녀 동반 시, 본인 및 타수강생들의 수업 집중에 방해가 됩니다. &nbsp;</span><br/>
                                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원활한 수업진행을 위해 강의실內에 수강자녀가 아닌 자녀는 동반하지 않도록 부탁드립니다.&nbsp;</span><br/>
                                </div>
                        </div>                    
                        <div id="Accordion_wrap">          
                                <div class="que">
                                <span>강사님의 연락처를 알 수 있나요?</span>                                    
                                </div>                                
                                <div class="anw">                  
                                    <span class="ans-top">개인정보보호를 위해 고객님께  강사님의 연락처를 포함한 개인 신상 정보는 공개해 드릴 수 없습니다. </span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;하지만, 강사님과 긴급한 연락을 취하셔야 할 경우 문화센터 직원에게 문의하시면 직원을 통해 연락을 취하실 수 있습니다.&nbsp;</span><br/>
                                </div>
                        </div>                          
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>문화센터 가입시 입회비가 있나요?</span>                                    
                            </div>                                
                                <div class="anw">                  
                                    <span class="ans-top">연회비, 입회비가 없습니다.</span><br/>                                        
                                </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수업이 휴강되었을 때 보강이 이루어지나요?</span>                                    
                            </div>                                
                                <div class="anw">                  
                                    <span class="ans-top">강사님의 개인사정 및 기타 사유로 인한 휴강의 경우 마지막주 또는 강사님과 수강생이</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서로 합의된 지정일에 보강일자를 선정하여 강좌를 진행합니다.&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 법정공휴일에 의한 휴강은 보강이 없으므로, 강의 일정을 꼭 확인해 주시고&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 법정공휴일에 의한 휴강은 보강이 없으므로, 강의 일정을 꼭 확인해 주시고&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강생 개인사정으로 인한 결석 등의 사유로 수강하지 못한 부분 또한&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별도의 보강이 이루어지지 않으므로 이점 양지해 주시기 바랍니다.&nbsp;</span>
                                </div>
                        </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>인터넷 접수기간 종료 후, 강좌 개강 후에도 수강신청이 가능한가요?</span>                                    
                            </div>                                
                                <div class="anw">                  
                                    <span class="ans-top">인터넷 접수기간이 종료 되었거나, 강좌가 개강된 이후에도</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강좌에 따라 정원이 마감되지 않은 경우, 해당점을 방문하시면 중간 접수가 가능합니다.&nbsp;</span><br/><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중간 접수 시 전체 수강료 기준 잔여 기간만큼의 수강료를 환산하여 접수를 도와드리며(재료비, 교재비 예외)&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 중간 접수 시 수강료의 경우 계산된 최종 금액의 10원 단위에서 올림하여 계산됩니다.&nbsp;</span><br/><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*사전에 해당점에 접수 가능 여부를 문의하신 후, 방문해주시기 바랍니다.&nbsp;</span><br/>                                          
                                </div>
                        </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수강자명 변경은 어떻게 하나요?</span>                                    
                            </div>                                
                                <div class="anw">                  
                                    <span class="ans-top">수강 대상자는 [수강신청] > [ 바로신청] > [수강정보확인] > [결제정보확인]에서 변경/추가가 가능합니다.</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 결제 완료 이후에는 [My 페이지] > [나의수강정보] 수강내역에서 수강자 변경/추가(회원정보의 가족수강생 등록 후)가 가능합니다.&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   변경이 안 될 경우 <이용점> 으로 연락하시면  본인 또는 가족수강생 확인후 변경해 드립니다.&nbsp;</span><br/>
                                </div>
                        </div>  
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수강증, 영수증 발급은 어디서 하나요?</span>                                    
                            </div>                                
                                <div class="anw">                  
                                    <span class="ans-top">수강증/영수증의 경우 해당 강좌 결제시  [수강신청] > [수강신청완료] > [신청내역] > [수강증/영수증출력]으로 가능하며,</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제 이후 출력시에는 [My페이지] > [나의수강정보] > [결제내역-영수증출력], [수강내역-수강증출력]하시면 됩니다.&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 수강증 출력이 안되는 경우 수업 당일 해당점 안내데스크에서 발급해 드립니다.&nbsp;</span><br/>                                         
                                </div>
                        </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수강 취소 후 환불은 언제되나요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">카드 승인 취소는 카드사 및 처리일에 따라 영업일 기준 5~7일 소요됩니다.</span><br/>                                      
                            </div>
                    </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>재료비, 교재비는 수강료에 포함 되어있나요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">수강료의 금액은 순수 수업료 이며 [홈페이지 로그인] > [수강신청] > [강좌명]의 해당 강좌 상세정보에 교재 및 재료비가 표기되어 있습니다.</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별도 표기가 없는 강좌는 수업첫날 안내해드리며, 수업전 이용점으로 문의 해주시기 바랍니다.&nbsp;</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 강좌 진행상 수업 중 별도로 재료를 구입하거나 교재를 구입하는 경우가 있습니다.&nbsp;</span><br/>
                            </div>
                        </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>온라인 결제이후 <부분취소>가 안되는 카드가 있나요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">일부 카드의 경우, 카드사의 정책에 따라 온라인 결제 후</span><span class="anw-sub" style="color:red;"><부분취소>가 되지 않는 카드가 있을 수 있습니다.</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ex-바우처를 통한 체크카드, 지역은행 체크카드 등)&nbsp;</span><br/><br/>
                                    <span class="anw-sub" style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 경우 학기 개강 전(수강신청 기간)에는 마이페이지에서 결제하신 금액을 <전체취소> 후 재결제 해주시기 바랍니다.&nbsp;</span><br/>
                                    <span class="anw-sub" style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 학기 개강 후(묶음 결제한 강좌 중 1개 이상의 강좌가 시작되었거나, 개강 임박으로 온라인 취소가 불가능한 기간)에는&nbsp;</span><br/>
                                    <span class="anw-sub" style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제건의 전체취소가 불가하므로, 해당점으로 방문해주시기 바랍니다.&nbsp;</span><br/>
                            </div>
                        </div>                                                   
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>알림톡의 알림내용은 무엇인가요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">회원님의 수강자 휴대번호로 등록된 번호와 연동된 카카오톡으로 문화센터 [개강, 폐강, 휴강 안내] 등의 알림톡이 발송됩니다.</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 휴면회원이시거나, 롯데마트 카카오톡 채널을 차단하신 경우, 또는 카카오톡을 미사용하시는 경우 알림톡을 수신하실 수 없습니다.&nbsp;</span><br/><br/>
                            </div>
                        </div> 
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수강후기작성은 어떻게 하나요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">[문센커뮤니티] > [수강후기] > [수강후기 작성하기], 또는 [글쓰기 아이콘] 클릭 후 작성하실 수 있습니다. </span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   [수강신청] > [수강신청상세]에서도 수강후기 댓글등록이 가능합니다.</span><br/>                                
                            </div>
                        </div>                           
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>강사지원시 임시저장 이후 수정할 시 어떻게 해야하나요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">강사지원시 임시저장후 다시 수정, 입력할 시 </span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;처음 지원과 동일하게 강사지원 < 동의 체크 < 해당 작성한 화면이 노출됩니다.</span><br/>                                
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이후 수정, 작성후 제출하기 버튼을 클릭하시기 바랍니다.</span><br/>       
                            </div>
                        </div>                           
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>오프라인(방문)으로 수강한 기록이 안보여요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">오프라인에서 접수한 내용을 확인하시려면 홈페이지 로그인 [My페이지] > [나의 수강정보] > [방문점수강내역연결]로</span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;온·오프라인으로 방문한 접수(등록) 내역을 확인 하실 수 있습니다.</span><br/>                                
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 방문점 연결시 [본인인증] 확인후 연결이 가능합니다. </span><br/>       
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;또한 회원 정보는 방문(오프라인)회원 정보와 L.POINT 회원 정보가 동일 해야합니다. (성명,생년월일등)</span><br/>       
                            </div>
                        </div> 
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수강료는 한달 기준인가요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">별도 표기되지 않은 경우, 정규강좌는 모두 3개월(11회~12회) 기준 수강료입니다.</span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (강좌에 따라 해당 수강료와 별도로 재료비, 교재비가 존재할 수 있습니다.)</span><br/><br/>                           
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 강좌에 따라 개강 이후에도 방문 시 중간 접수가 가능한 강좌가 있으므로, 해당점으로 사전에 문의해주시기 바랍니다. </span><br/>       
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중간 접수의 경우, 전체 수강료 기준 잔여 기간만큼의 수강료를 환산하여 접수를 도와드리며(재료비, 교재비 예외)</span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중간 접수 시 수강료는 계산된 최종 금액의 10원 단위에서 올림하여 계산됩니다.</span><br/>       
                            </div>
                        </div>     
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>악기강좌를 수강하려 하는데 악기를 구입해야 하나요??</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">해당 이용점에 따라 악기대여가 가능한 강좌도 있으나, 개인 전용 악기는 별도 지참 하시기 바랍니다.</span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ( ※ 점별 진행강좌에 따라 상이할 수 있습니다.) </span><br/><br/>                           
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 자세한 사항은 해당 이용점으로 문의하시기 바랍니다.  </span><br/>       
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;악기의 구입이 고민되시면 첫 수강 시 해당 강사님과 상담 후 구입하실 수 있도록 안내해 드립니다.</span><br/>
                            </div>
                        </div>  
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>강좌 수강시 자녀동반이 가능한가요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">수업분위기를 위해 성인강좌의 수강자 및 영아강좌의 수강대상인 자녀 외 자녀동반은 불가합니다.</span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  가족수강생이 아닌 자녀 동반 시, 본인 및 타수강생들의 수업 집중에 방해가 됩니다.  </span><br/><br/>                           
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 원활한 수업진행을 위해 강의실內에 수강자녀가 아닌 자녀는 동반하지 않도록 부탁드립니다. </span><br/>       
                             </div>
                        </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>온라인결제 취소와 방문 결제 취소는 어떻게 하나요?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">온라인에서의 전액환불 취소는 개강일 3일전, 방문 시에는 해당강좌 개강 전일까지 환불 가능합니다.</span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   온라인 신청 강좌의 취소 </span><br/><br/>                           
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강 취소 : [My페이지] > [나의수강정보내역] >[수강내역 취소/변경] > [결제취소] </span><br/>       
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 온라인 취소 가능 시간 : 10:00 ~ 22:00  </span><br/>    
                                </div>
                        </div> 
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수강료 결제수단은?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">온라인으로 수강신청시 홈페이지 또는 모바일웹에서 신용카드(체크카드포함)로만 결제가 가능합니다. </span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방문하여 결제하실 경우는 현금, 신용카드, 롯데상품권,L.POINT 결제가 가능합니다.   </span><br/>                                
                            </div>
                        </div> 
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>신용카드 결제시 (무이자 할부 중단) 카드 안내</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top"> 문화센터 온라인 결제 시 신용카드 무이자 할부 중단 카드사에 대해 안내드립니다.</span><br/>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 해당 카드 : 롯데카드, 우리카드&nbsp;</span><br/><br/>
                                    <span class="anw-sub" style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제 시 카드사별 (무) 표시를 확인하시기 바랍니다. (해당 카드 클릭, 개월수 옆 할부 표시) <전체취소> 후 재결제 해주시기 바랍니다.&nbsp;</span><br/>
                            </div>
                        </div>
                        <div id="Accordion_wrap">          
                            <div class="que">
                            <span>수강료 결제수단은?</span>                                    
                            </div>                                
                            <div class="anw">                  
                                    <span class="ans-top">온라인으로 수강신청시 홈페이지 또는 모바일웹에서 신용카드(체크카드포함)로만 결제가 가능합니다. </span><br/>
                                    <span class="anw-sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방문하여 결제하실 경우는 현금, 신용카드, 롯데상품권,L.POINT 결제가 가능합니다.   </span><br/>                                
                            </div>
                        </div>                      
                   
            
              
            <div class="bg-gray qna-notice mt30">
                <p class="ico-notice">찾는 답변이 없으세요? 궁금하신 사항은 1:1문의에 내용을 남겨주세요.</p>
                    <div class="ico-btn">
                        <a href="#";>
                        <img src="resources/img/headset.png" alt="1:1문의">                                    
                        </a>
                    </div>
            </div>  
            <div class="quickmenu">
                <ul>
                    <li><a href="">문의</a></li>
                    <li><a href="#"><img src="resources/img/icons8-쪽으로-48.png" alt="화살표 위로"></a></li>
                </ul>
            </div>
        </div>
    </div>
</div> 

    <div class="all"></div>  
    <jsp:include page="common/footer.jsp" />
    
    <script>
    $(".que").click(function() {
    $(this).next(".anw").stop().slideToggle(300);
    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    });

        // 검색 버튼 fade
        $(function() {
            $('.main_btn').on('click', function(e) {
                $('.h_form').fadeIn(300)
                
                $('.search_cancle').on('click', function() {
                    $('.h_form').fadeOut(300)
                })
            })
        })

        // 강좌 이미지 설명 hover
        $(function() {
            $('.over_mouse').mouseover(function() {
                $(this).find('.img_info').stop().fadeIn(400);
            }).mouseleave(function() {
                $(this).find('.img_info').stop().fadeOut(400);
            })
        })

        // 헤더 카데고리 바 숨겨진 div
        $(function() {
            $('.nav_category').mouseover(function() {
                $('.nav_bar').stop().fadeIn(1);
            })
            $($('.nav_bar')).mouseleave(function() {
                $(this).fadeOut(1);
            })
            
            
        })

        $(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
            
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
            if(position < 1500) {
                $('.quickmenu').stop().animate({top:position+"px"}, 1000); //해당 오브젝트 위치값 재설정
            }
        });
            
        const swiper = new Swiper('.swiper', {
            
            loop: true,
            // speed: 10000,
            // loopedSlides: 5,
            // observer:true,
            // observeParents:true,

            // If we need pagination
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            
            // Navigation arrows
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },

            autoplay: {
                delay: 3000,
                // stopOnLastSlide: false,
                // disableOnInteraction: true,
            }

            // freeMode: {
            //     enabled: true,
            //     sticky: true,
            // },

        });
        
       
    </script>
</body>
</html>